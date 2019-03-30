<p align="right"><img src="https://github.com/BadenLab/Zebrafish-visual-space-model/blob/master/Images/Logo.png" width="300"/>
<h1 align="center">Instruction Manual</h1></p>
<h1 align="center">OpenSpritzer v1.3</h1>

***

## Overview

<img align="right" width="550" height="410" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/Top%20View.jpg">

This document contains detailed assembly instructions, a software guideline and includes a parts list.

 The Arduino code and 3D printing files (SCAD and STL) can be downloaded [here](https://github.com/BadenLab/Openspritzer/tree/master/3D%20Designs/v1.3%20-%20Customed%20PCB), and further modified to fit customise purposes. The purpose of the device is to regulate the pressure and duration of a puff of compressed air. Typically, the output port is connected to a glass puffer pipette which has been drawn into a sharp point with a narrow (2-3μm) diameter pore.

The device consists of a circuit board, a solenoid valve, a pressure regulator with a gauge and various interface, off-the-shelf, components.

The device is here shown without its covering lid. The pressure regulator is mounted on the right and attached to the front panel via a retaining threaded ring that comes with the regulator. The printed circuit board (PCB) is mounted onto attachment points on the bottom of the box. There is a platform supports on which the solenoid can rest above the circuit board and a LED can be attached to a mount-point on the lid.

***

- [Assembling OpenSpritzer](#Assembly)
- [Programming the Stimulator](#Programming-the-ESP32)
- [Operating the Stimulator](#Operating-the-Stimulator)
- [Calibrating the Stimulator](#Calibrating-the-Stimulator)

***

## Assembly

<img align="right" width="350" height="225" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/Schematics2.png">

<p align="center"><h4 align="left">1 – Obtaining the custom-designed PCB</h4></p>

From the GitHub repository, one can find the [gerber.zip folder]https://github.com/BadenLab/Openspritzer/tree/master/PCB) needed to order the PCB to any manufacturer company (i.e. https://jlcpcb.com).

Ordering a minimum of 5 units should not cost more than £10. Gerber files were designed with [KiCad 5.0](http://kicad-pcb.org/).


Schematics and PCB footprint can be downloaded and modified from the same repository if need be.


****

<p align="center"><h4 align="left">2 – Soldering the custom-designed PCB</h4></p>
<img align="left" width="550" height="410" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/components.png">

The board is self-explanatory and should not take more than an hour to solder



<img align="center" width="570" height="370" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/PCB3.png">


***

<p align="center"><h4 align="left">3 – Printing the Spritzer box</h4></p>
<img align="left" width="550" height="350" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/3d%20print.png">

[STL files](https://github.com/BadenLab/Openspritzer/tree/master/3D%20Designs/v1.3%20-%20Customed%20PCB/STL%20Files) can be found on the GitHub repository and print directly if the user wishes to go for the default design (4 stimulation LEDs + 4 proxy LEDs) and [BoM](https://github.com/BadenLab/Openspritzer/blob/master/Bill%20of%20Materials/BOM.csv).

However, [SCAD files](https://github.com/BadenLab/Openspritzer/blob/master/3D%20Designs/v1.3%20-%20Customed%20PCB/OpenSpritzer%20v1.3.scad) are also available and easily adjustable for personalised design.

We used [OpenSCAD](www.openscad.com) to design the stimulator box. The tolerance of the printer can be adjusted in the “USER Parameters” section of the script (tol =0.1; by default, this value is used for Prusa MK3 and Ultimaker 2). Each component can be displayed/design individually in the “Switches” section. Variables such as LED number (4 by default) and the potentiometer board dimensions can be adjusted in the “Component Parameters” section.

The PCB is screwed to the “Bottom” part of the box by using M3 screws and nuts. The potentiometer board adjusts itself with the “Back” part of the box, and the trimmers should adapt to their respective holes exactly.

All part should fit tightly together and are maintained together by 4 M3*50mm socket screws.

***

<p align="center"><h4 align="left">4 – Connecting the Spritzer</h4></p>

<img align="right" width="580" height="380" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/Connection.png">

Connect an air compressor to the “Air In” port via the L-shaped adaptor.

The output airhose must be connected to the “Air Out” port.

A good pressure for sharp crisp pulses, which helps the solenoid to close again, is 1.4 bar (20 psi). Important: When first connecting high-pressure air to Openspritzer, e.g. from a compressor or air-tank, make sure that the Openspritzer gauge is near zero. A too-high line pressure (>>1.4 bar) risks irreversibly damaging the solenoid.
The stimulator must be powered with a 24v power supply. The Arduino Nano is powered through an internal voltage step-down regulator (24 to 5v). And does not need to be connected to be connected through a mini-USB cable once code has been uploaded.

For convenience in darkened circumstances the LED will also illuminate whenever the 5v line is high.

The foot pedal and/or the TTL cable(s), once soldered to a BNC male connector should be connected on the left side of the box to their appropriate BNC female connector. To operate with a footswitch the DPDT must be placed in Arduino mode and a 5 V power supply provided to the Arduino via the USB port. It is not necessary to use the Arduino to operate the solenoid if you have a convenient method for producing 5v TTL pulses, such as PulseQ electrophysiology package (Funetics) running on Igor Pro (Wavemetrics) in conjunction with the ITC 1600. To use TTL pulses ensure the DPDT switch is in the “TTL” position. Whenever the 5v line is high the solenoid will open and release compressed air from the output valve.

Using the Arduino to drive the puffer allows operation with the external footswitch. To operate with a footswitch the DPDT must be placed in “Foot Pedal”. Attaching a computer at operation time allows for dynamic reprogramming of the Arduino during experimentation, which could be very useful. E.g. resetting the base time unit.
To operate the unit, press the foot-button and after 400 milliseconds a puff of a predefined duration will occur. The LED will illuminate during the puff to give visual confirmation that the puff has occurred. The duration of the puff can be changed by adjusting the potentiometer.

When the potentiometer is changed Openspritzer goes into a monitoring mode during which time the LED is continuously lit. When the potentiometer stops changing, Openspritzer lits the LED to indicate the new time duration.

***

## Programming the ESP32


1-	Download and install [Arduino environment](www.arduino.org) on the computer.

2-	To use the ESP32, a couple of steps are necessary
Install the latest SiLabs [CP2104 driver](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers).
Follow the installation instructions from the [Espressif repository](https://github.com/espressif/arduino-esp32/blob/master/docs/arduino-ide/boards_manager.md).

3-	Install the TLC5947 library:	Start Arduino and from the “Sketch” tab, select “Include Library” and open “ Manage Libraries”.	From the search bar enter “TLC5947”. Select and Install the library

4-	Close Arduino and open the Multi-Chromatic-Stimulator arduino file from the [Arduino Code folder](https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/tree/master/Arduino%20code/2-Photon_Mutli_Chromatic_Stimulator).


5-	From the “Tools” tab: Select from “Boards” the “Adafruit ESP32 Feather”.	From “Upload Speed”, select 921600.	From “Flash Frequency”, select 80Hz. From “Port”, select the computer port to which the ESP is connected (if doubt, unplug, replug and observe the choices differences). If the ESP is not recognised, check the driver installation (2), then check the micro USB cable.

6-	Compile and Upload the code by clicking on the arrow button on the top left.

7-	The stimulator is ready to be used.

***

## Operating the Stimulator
<p align="center"><h4 align="left">The code is organised in five distinct part:</h4></p>

  Stimulus Parameters

Here, the user determines the sequence of his looping stimulus.

–	The array_LED# corresponds to the sequence of each LED#. The value corresponds to the LED power and CAN ONLY TAKE A VALUE FROM 0 TO 100, where 0 corresponds to no light and 100 to max light intensity

–	The array_Time corresponds to the duration of each entry in ms; the first entry being the pre-adaptation that will only be played at the start of the stimulus, the sequence will then loop starting at the second position.

–	The number of Loops is determined by nLoops. The stimulus will stop after finishing the n Loop.

–	IMPORTANT, for the code to work flawlessly, the number of entries within the arrays has to be the same and manually entered in nArrayEntries (including the pre-adaptation at position 1).

***

  Microcontroller Board Selection

This is where the user defines if he is using an ESP32 or an Arduino Nano

***

  Internal Definitions

This is the main definition part of the code which can be modified to:

-	Add more LEDs than the 4 main and 4 proxy defined by default. (Global variables, the LED pins correspond to the pin number on the TLC5947).

-	Adjust the trigger duration (25ms by default).

-	Adjust the Trigger interval (1000 ms by default)

***

  Internal Methods

This is the main core of the code and should not be structurally changed apart from adding more LEDs (straight forward)

***

  Main Loop

This is where the stimuli controls are defined. By default, when compile window is open (magnifying glass on the top right corner) and the baud rate at the bottom right of the window has be changed to 115200, a manual command will trigger a stimulus:

By default:

-	'a' –> Play stimulus at max power

-	'b' –> Play stimulus at min power

-	'0' –> Turn off all LEDs stop any stimulus being played and reset the loop

-	'+' –> Turn on all LED to max power

-	'-' –> Turn on all LED to min power

-	'1' –> Turn First LED to max power

-	'2' –> Turn First LED to min power

-	'3' –> Turn Second LED to min power

-	'4' –> Turn Second LED to min power

-	'5' –> Turn Third LED to min power

-	'6' –> Turn Third LED to min power

-	'7' –> Turn Fourth LED to min power

-	'8' –> Turn Fourth LED to min power

Important to note, obviously the stimulation will only be played if a blanking signal is sent to the board.

***

## Calibrating the Stimulator

The TLC5947 is 12 bits PWM grayscale driver, meaning that it offers a 4096 degree of freedom to adjust each LED power.
On the arduino code there is a second tab called “LED_values” which hard-codes the maximum power an LED can get. Those values range from 0 (no current) to 4095 (max current, 15mA by default).

On the default script we proposed 2 distinct max values (oddly named here max and min power) that can be called individually. The purpose here is to have the opportunity to use the same stimulus sequence at two different light intensities. Off course more can be added manually by the user.

For the calibration, we suggest setting the max_LED# value at 4095 (Full power) and use successively a spectrometer and a powermeter. To adjust the LED brightness, the user should first use the trimmer potentiometer at the back of the stimulator then finely tune the desired max power in the code. When the LED value (0-100) will be entered in the stimulus sequence, it will automatically be mapped to 0-max_LED#

***

This project is licensed under the [GNU General Public License v3.0](https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/LICENSE)

***
