/* 
 
        OpenSpritzer v1.3, an open hardware pressure ejection system.
This Arduino file is designed to be uploaded on an Arduino Nano for the OpenSpritzer project 
Source : https://github.com/BadenLab/Openspritzer
This project is Open Source licensed, released under CERN OHL v1.2
by  C.J. Forman & M.J.Y. Zimmermann, 2019.02.05
Baden Lab, CRPC, School of Life Sciences, University of Sussex, United Kingdom
                                                                                              */

////////////////////////////////////////////////////////////////////////////////////////////////
//                         KEY PARAMETERS TO SET BY USERS
////////////////////////////////////////////////////////////////////////////////////////////////

  const int POT_LOW           = 0;      // Lowest value read from the potentiometer.
  const int POT_HIGH          = 1023;   // Highest value read from the potentiometer 
  const int PotNoise          = 25;     // Error value added to the potentiometer reading (0 - 1023)
  
  const int PULSE_LOW         = 10;     // Minimum Pulse Duration in ms
  const int PULSE_HIGH        = 1000;   // Maximum Pulse Duration in ms
  
  const int PULSE_Delay       = 300;    // Minimum time between two sucessive button push in ms


////////////////////////////////////////////////////////////////////////////////////////////////
//                        EXTRA FOR DISPLAY
////////////////////////////////////////////////////////////////////////////////////////////////
  #include <SPI.h>
  #include <Wire.h>
  #include <Adafruit_GFX.h>
  #include <Adafruit_SSD1306.h>

  #define SCREEN_WIDTH 128 // OLED display width, in pixels
  #define SCREEN_HEIGHT 32 // OLED display height, in pixels

  #define OLED_RESET     4 // Reset pin # (or -1 if sharing Arduino reset pin)
  #define SCREEN_ADDRESS 0x3C ///< See datasheet for Address; 0x3D for 128x64, 0x3C for 128x32
  Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);
;
  
////////////////////////////////////////////////////////////////////////////////////////////////
//                               GLOBAL VARIABLES
//////////////////////////////////////////////////////////////////////////////////////////////// 
  
  // Set up the pins
  const int FootPin           = 2;      // Set the foot pedal to digital pin 2
  const int SolenoidPin       = 5;      // Set the solenoid valve to digital pin 5
  const int LEDPin            = 10;     // Set proxy LED to digital pin 10
  const int PotPin            = A0;     // Set the potentiometer to analog pin A0
  

  // Declare global variables
 
  int PotValue                = 0;      // Potentiometer value reading
  int CurrentPotValue         = 0;      // Current potentiometer value read

  int Pulse_Duration          = 0;      // Amount of time the pulse is on
  word BaudRate               = 9600;   // Baud Rate



////////////////////////////////////////////////////////////////////////////////////////////////   
//                                        MODULES
//////////////////////////////////////////////////////////////////////////////////////////////// 

void SetPulseDuration() {               
  // Read the potentiometer value and define the pulse duration accordingly
  PotValue = analogRead(PotPin);
  Pulse_Duration = map(PotValue,POT_LOW,POT_HIGH,PULSE_LOW,PULSE_HIGH);
  }

void Refresh(){
  display.clearDisplay();
  display.setCursor(0,0);
  display.setTextSize(1);
  display.println("Pulse Duration: ");
  display.setTextSize(3);
  display.print(map(PotValue,POT_LOW,POT_HIGH,PULSE_LOW,PULSE_HIGH));
  display.setCursor(55,8);
  display.print(" ms");
  display.display();
}


void LED(){                             
    // The proxy LED blinks as long as the last set pulse duration
    PotValue = analogRead(PotPin);
    Pulse_Duration = map(PotValue,POT_LOW,POT_HIGH,PULSE_LOW,PULSE_HIGH);

    Refresh();
}

void Pulse(){   
  // Open the Valve, Blink the LED for the define Pulse Duration time                        
  digitalWrite(SolenoidPin, HIGH);
  digitalWrite(LEDPin, HIGH); // light the LED
  delay(Pulse_Duration); // wait for the pulse duration.
  digitalWrite(SolenoidPin, LOW);  // close the solenoid and switch off the LED.
  digitalWrite(LEDPin, LOW);
}



////////////////////////////////////////////////////////////////////////////////////////////////   
//            SETUP (this only runs once at when the Arduino is initialised)
//////////////////////////////////////////////////////////////////////////////////////////////// 

void setup() {
  // Initialise the serial communication with PC
  Serial.begin(BaudRate);
  if(!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }
  
  // Initialize the pins
  pinMode(PotPin, INPUT);
  pinMode(FootPin, INPUT);
  pinMode(LEDPin, OUTPUT);
  pinMode(SolenoidPin, OUTPUT);

  // Set initial conditions on pins. Prevent pulse from happening
  digitalWrite(SolenoidPin, LOW);
  digitalWrite(LEDPin, LOW);

  // Set the first pot value and the first pulse duration
  SetPulseDuration();

  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);
  display.clearDisplay();
}


////////////////////////////////////////////////////////////////////////////////////////////////
//                                      MAIN LOOP
////////////////////////////////////////////////////////////////////////////////////////////////

void loop() {
 
  // Keep the valve closed while waiting for a pulse
  digitalWrite(SolenoidPin, LOW);  
  digitalWrite(LEDPin, LOW);
  
  // Blink the proxy LED if the potentiometer value is manually changed
  CurrentPotValue = analogRead(PotPin);
  if(CurrentPotValue > PotValue + PotNoise || CurrentPotValue < PotValue - PotNoise)
      {
          LED();
      }

  // If button is pressed, trigger pulse, blink LED ans pause (PULSE_Delay) before the next pulse
  if(digitalRead(FootPin)==1) // read the button pin.
      {
          Pulse();
          SetPulseDuration();
          delay(PULSE_Delay);
      }


   // Monitor Potentiometer values
   if(Serial.available()) {
     Serial.print("PotValue");
     delay(300);
     Serial.println(CurrentPotValue);
   }
}
