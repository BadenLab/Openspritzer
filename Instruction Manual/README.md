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
- [Programming OpenSpritzer](#Programming-the-Spritzer)
- [Operating the Stimulator](#Operating-the-Stimulator)

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

Connect an air compressor to the “Air In” port via the L-shaped adaptor.

The output airhose must be connected to the “Air Out” port.

A good pressure for sharp crisp pulses, which helps the solenoid to close again, is 1.4 bar (20 psi). Important: When first connecting high-pressure air to Openspritzer, e.g. from a compressor or air-tank, make sure that the Openspritzer gauge is near zero. A too-high line pressure (>>1.4 bar) risks irreversibly damaging the solenoid.
The stimulator must be powered with a 24v power supply. The Arduino Nano is powered through an internal voltage step-down regulator (24 to 5v). And does not need to be connected to be connected through a mini-USB cable once code has been uploaded.

For convenience in darkened circumstances the LED will also illuminate whenever the 5v line is high.

<img align="right" width="580" height="380" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/Connection.png">

The foot pedal and/or the TTL cable(s), once soldered to a BNC male connector should be connected on the left side of the box to their appropriate BNC female connector. To operate with a footswitch the DPDT must be placed in the "Pedal" position. It is not necessary to use the Arduino to operate the solenoid if you have a convenient method for producing 5v TTL pulses, such as PulseQ electrophysiology package (Funetics) running on Igor Pro (Wavemetrics) in conjunction with the ITC 1600. To use TTL pulses ensure the DPDT switch is in the “TTL” position. Whenever the 5v line is high the solenoid will open and release compressed air from the output valve.

Attaching a computer at operation time allows for dynamic reprogramming of the Arduino during experimentation, which could be very useful. E.g. resetting the base time unit.
To operate the unit, press the foot-button and after 400 milliseconds a puff of a predefined duration will occur. The LED will illuminate during the puff to give visual confirmation that the puff has occurred. The duration of the puff can be changed by adjusting the potentiometer.

When the potentiometer is changed Openspritzer goes into a monitoring mode during which time the LED is lit and indicate the new time duration.

***

## Programming the Spritzer


1-	Download and install [Arduino environment](www.arduino.org) on a computer.

2-	Close Arduino and open the Openspritzer arduino file from the [Arduino Code folder](https://github.com/BadenLab/Openspritzer/blob/master/Arduino%20Code/Openspritzer/Openspritzer.ino).

3-	From the “Tools” tab: Select from “Boards” the “Arduino nano”.	From “Processor”, select ATM328P (If you're using an arduino clone or an old official board, select ATM328P (Old Bootloader)). From “Port”, select the computer port to which the Arduino is connected (if doubt, unplug, replug and observe the choices differences). If the Arduino is not recognised, check the driver installation (if you're using a clone, check the processor datasheet of your model), then check the mini USB cable.

4-	Compile and Upload the code by clicking on the arrow button on the top left.

5-	The Spritzer is ready to be used.


<img width="850" height="700" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/Top%20View2.jpg">

***

The code can be modified and uploaded as many times as you like. The way the Openspritzer code has been constructed allows simple modification of key parameters such as the base unit of time and are listed in supporting table 2.

<h4> IMPORTANT</h4>: The first time that the Arduino is used the POT_LOW and POT_HIGH parameters should be measured. A Serial.println statement is included in the code to allow monitoring of this value over the serial port. To measure these values, open the serial port monitoring window in the Arduino programming environment (magnifying lens, top right corner) and then sweep the potentiometer from low to high. The two parameters POT_HIGH and POT_LOW should be initialised to the highest values and lowest values observed in the monitoring window output (usually those should be 0 and 1023). This is used in the calculations of the pulse duration and will vary from Openspritzer to Openspritzer depending on the precise value of the potentiometer resistance.

The monitoring algorithm relies on the PotNoise parameter to decide whether or not the potentiometer has settled. To set PotNoise, monitor the serial port output during the analog monitoring procedure (described above) and find the PotValue measured by the analogRead command. PotNoise should be larger than any fluctuations in the PotValue when it is not being altered. During testing, depending on which power supply was used, it was found that a reasonable value for PotNoise was 5.

Next the user assigns a time to the minimum and maximum potentiometer value by modifying PULSE_LOW and PULSE_HIGH. Those value are in milliseconds. PULSE_LOW will correspond to the minimum air puff duration when the potentiometer is turn all the way down, and reciprocally for PULSE_HIGH. By default those values are 10 and 1000 ms.
Finally, the PULSE_Delay is to be defined. This value allows some time for the user to release the button before applying the next pulse. This value can be adjusted to give rapid or spread pulses, however we found that for the average user, a value of 500ms is sufficient.

The user is obviously free to write any code they wish to monitor the foot button, read the potentiometer, blink the LED or operate the solenoid.

***

This project is licensed under the [GNU General Public License v3.0](https://github.com/BadenLab/Openspritzer/blob/master/LICENSE)

***
