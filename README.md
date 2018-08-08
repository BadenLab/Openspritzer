<p align="right"><img src="https://github.com/BadenLab/Zebrafish-visual-space-model/blob/master/Images/Logo.png" width="300"/>
<h1 align="center">Openspritzer</h1></p>
<h3 align="center">An open hardware pressure ejection system for reliably delivering picolitre volumes.
</h3><p align="center"><h6 align="right">by C.J. Forman, H. Tomes, B. Mbobo, R.J. Burman, M. Jacobs, T Baden &
J.V. Raimondo</h6>
<img align="center" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/Cover%20Picture2.PNG" width="1000"/>
</p>


Designed for ease of use, robustness and low-cost, the “Openspritzer” is an open hardware “Picospritzer” as routinely used
in biological labs around the world. The performance of Openspritzer and commercial alternatives is effectively indistiguishable.

The system is based on a solenoid valve connected to a pressure gauge. Control can be attained directly via an external TTL pulse
or internally through an Arduino set by a rotary encoder. The basic setup can be put together for 3-400€, or substantially less if you
are prepare to shop around.

We anticipate that due to its high performance and low cost Openspritzer will be of interest to a broad range of researchers working
in the life and physical sciences.

***

- [A £350 DIY opensource microinjector](#a-DIY-opensource-microinjector)
- [An efficient device that provides the same level of control as commercial systems](#correlating-a-recording-area-into-the-visual-space)

***

## A DIY opensource microinjector
Compared to similar commercial systems that can cost up to several thousand pounds, the cost of the fully equiped Openspritzer (~£350) makes it
particularly attractive for those wishing to pursue cutting-edge techniques in low ressource environments.

This repository contains detailed [assembly instructions](https://github.com/BadenLab/Openspritzer/blob/master/Manuscript%20and%20Instruction/supplementary_information_final.pdf) and an operation manual for Openspritzer. The [bill of material](https://github.com/BadenLab/Openspritzer/blob/master/Manuscript%20and%20Instruction/BOM.csv) details all pneumatic, mechanical and electronic components required along with possible supplier URL links.

<img align="right" width="100" height="132" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/PCB%20Board.png">

To simplify the wiring assembly, we have designed a customed [circuit board](https://github.com/BadenLab/Openspritzer/tree/master/PCB). Gerber files can be send to PCB prototype enterprise for production.

<img align="left" width="200" height="200" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/3d%20print.png">

We used [OpenSCAD](http://openscad.org) to design the [box and lid](https://github.com/BadenLab/Openspritzer/tree/master/3D%20printing%20files) stl files that could be 3D printed to efficiently hold all openspritzer components. The OpenSCAD script is provided. You may have to modify the measurements in the script to comply with the components that you have purchased.

The device is controled by an arduino nano. The [.ino code](https://github.com/BadenLab/Openspritzer/tree/master/Arduino) can be modified and uploaded as many times as you like. The way the Openspritzer code has been constructed allows simple modification of key parameters such as the base unit of time. These are all included at the beginning of the code for ease of reference.


The purpose of the
device is to regulate the pressure and duration of a puff of compressed air. Typically the output port
is connected to a glass puffer pipette which has been drawn into a sharp point with a narrow 2.3 diameter pore

The device consists of a circuit board, a solenoid valve, a pressure regulator with a gauge and
various interface components. Supplementary Fig. S2 shows the device without the covering lid
and the solenoid displaced to expose the circuit board. The pressure regulator is mounted on the left
and attached to the front panel via a retaining threaded ring that comes with the regulator. The
circuit board is mounted onto attachment points on the floor of the box. It is situated next to the side
wall containing the electronic interface components. There are two supports on which the solenoid
can rest above the circuit board and an LED can be attached to a mount-point on the lid. There are
also several retaining pillars which keep the solenoid in position. The lid has a block attached to it
which acts to clamp the solenoid down when the box is closed


When connected to a standard micro-pipette via suitable pneumatic tubing, the device is capable of
delivering minute doses of reagents to a wide range of biological and chemical systems.



In this work,
we characterise the performance of the device and compare it to a popular commercial system using two-photon
fluorescence microscopy. We found that Openspritzer provides the same level of control over
delivered reagent dose as the commercial system. Next, we demonstrate the utility of Openspritzer in
a series of standard neurobiological applications.



First, we used Openspritzer to deliver precise
amounts of the neurotransmitters glutamate and GABA to hippocampal neurons to elicit time- and
dose-precise excitatory and inhibitory responses, respectively. Second, we used Openspritzer to
deliver infectious viral and bacterial agents to living tissue. Viral transfection of hippocampal
interneurons with channelrhodopsin allowed for the optogenetic manipulation of hippocampal
circuitry with light. Finally, we successfully used Openspritzer to infect organotypic hippocampal
slice cultures with fluorescent Mycobacterium bovis bacilli. We anticipate that due to its high
performance and low cost Openspritzer will be of interest to a broad range of researchers working in
the life and physical sciences.
