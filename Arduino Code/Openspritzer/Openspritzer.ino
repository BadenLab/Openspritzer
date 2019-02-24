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

  const int PULSE_LOW           = 10;     // Minimum Pulse Duration in ms
  const int PULSE_HIGH          = 1000;   // Maximum Pulse Duration in ms
  
  const int PULSE_Delay         = 500;    // Minimum time between two sucessive button push in ms



////////////////////////////////////////////////////////////////////////////////////////////////
//                               GLOBAL VARIABLES
//////////////////////////////////////////////////////////////////////////////////////////////// 
  
  // Set up the pins
  const int FootPin           = 2;      // Set the foot pedal to digital pin 2
  const int SolenoidPin       = 5;      // Set the solenoid valve to digital pin 5
  const int LEDPin            = 10;     // Set proxy LED to digital pin 10
  const int PotPin            = A0;     // Set the potentiometer to analog pin A0
  

  // Declare global variables
  const int POT_LOW           = 0;      // Lowest value available from the potentiometer.
  const int POT_HIGH          = 1023;   // Highest value available from the potentiometer  
  int PotValue                = 0;      // Potentiometer value reading
  int CurrentPotValue         = 0;      // Current potentiometer value read
  int PotNoise                = 10;     // Error value added to the potentiometer reading (0 - 1023)
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

void LED(){                             
    // The proxy LED blinks as long as the last set pulse duration
    PotValue = analogRead(PotPin);
    Pulse_Duration = map(PotValue,POT_LOW,POT_HIGH,PULSE_LOW,PULSE_HIGH);
    digitalWrite(LEDPin,HIGH);
    delay(Pulse_Duration);
    digitalWrite(LEDPin,LOW);
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
     Serial.print("Potentiometer value");
     Serial.println(CurrentPotValue);
   }
}
