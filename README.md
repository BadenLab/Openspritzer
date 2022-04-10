<p align="right"><img src="https://github.com/BadenLab/Zebrafish-visual-space-model/blob/master/Images/Logo.png" width="300"/>
<h1 align="center">Openspritzer</h1></p>
<h3 align="center">An open hardware pressure ejection system for reliably delivering picolitre volumes.</h3>
<p align="center"><h6 align="right">by C.J. Forman, H. Tomes, B. Mbobo, R.J. Burman, M. Jacobs, T Baden &
J.V. Raimondo</h6></p>
<p align="center"><h6 align="right">adapted by M.J.Y. Zimmermann</h6></p>
<img align="center" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/Cover%20Picture2.PNG" width="1000"/>
</p>


<p align="justify">Designed for ease of use, robustness and low-cost, the “Openspritzer” is an open hardware “Picospritzer” as routinely used
in biological labs around the world. The performance of Openspritzer and commercial alternatives is effectively indistiguishable.

<p align="justify">The system is based on a solenoid valve connected to a pressure gauge. Control can be attained directly via an external TTL pulse
or internally through an Arduino set by a rotary encoder. The basic setup can be put together for 3-400€, or substantially less if you
are prepare to shop around.

<p align="justify">We anticipate that due to its high performance and low cost Openspritzer will be of interest to a broad range of researchers working
in the life and physical sciences.</p>

This project is licensed under the [GNU General Public License v3.0](https://github.com/BadenLab/Openspritzer/blob/master/LICENSE)<br>
The hardware is licensed under the [CERN OHL v1.2](https://github.com/BadenLab/LED-Zappelin/blob/master/PCB/LICENSE)

***

- [Openspritzer, a DIY opensource microinjector.](#openspritzer-a-diy-opensource-microinjector)
- [Openspritzer rivals the performance of commercial systems.](#openspritzer-rivals-the-performance-of-commercial-systems)
- [Openspritzer in neuroscience experiments.](#openspritzer-in-neuroscience-experiments)
  - [Contributors:](#contributors)

***

## Openspritzer, a DIY opensource microinjector.

<img align="right" width="175" height="400" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/PCB.png">

<p align="justify">Compared to similar commercial systems that can cost up to several thousand pounds, the cost of the fully equiped Openspritzer (~£350) makes it
particularly attractive for those wishing to pursue cutting-edge techniques in low ressource environments.</p>


This repository contains detailed [assembly instructions](https://github.com/BadenLab/Openspritzer/tree/master/Instruction%20Manual) and an operation manual for Openspritzer. The [bill of material](https://github.com/BadenLab/Openspritzer/blob/master/Bill%20of%20Materials/BOM.csv) details all pneumatic, mechanical and electronic components required along with possible supplier URL links.


To simplify the wiring assembly, we have designed a customed [circuit board](https://github.com/BadenLab/Openspritzer/tree/master/PCB). PCB prototype companies will only need the gerber.zip folder to be sent to them for production.

<img align="left" width="325" height="225" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/3d%20print.png">

We used [OpenSCAD](http://openscad.org) to design [3D files](https://github.com/BadenLab/Openspritzer/tree/master/3D%20Designs) that could be printed to efficiently hold all openspritzer components.

The device is controled by an arduino nano. The [.ino code](https://github.com/BadenLab/Openspritzer/tree/master/Arduino%20Code) can be modified and uploaded as many times as you like. The way the Openspritzer code has been constructed allows simple modification of key parameters. These are all included at the beginning of the code for ease of reference.

***

## Openspritzer rivals the performance of commercial systems.

<img align="right" width="300" height="300" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/Figure2.PNG">
Openspritzer control over dose delivery matches that of a leading commercial alternative.

<p align="justify">To directly assess the time precision and reliability of Openspritzer we visualised fluorescent dye puffs from a sharp microelectrode under two-photon microscopy. The images were taken from a puff with a duration of several seconds using a wide area scan (rectangles).

<p align="justify">Fluorescence profiles of different command-duration puffs are shown for Openspritzer (green) and Picospritzer, a popular microinjection system(purple), respectively. The same data is shown again in log-log space to highlight details of shorter pulses. Overall, both devices behave in a very similar way in terms of providing effective and near linear control over the total dosage.</p>

***

## Openspritzer in neuroscience experiments.

<img align="Left" width="250" height="500" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/Figure3.png">
Openspritzer controls neural activity by delivering neurotransmitters with millisecond precision.

<p align="justify">To demonstrate the utility of Openspritzer, we use it in a series of standard neurobiological applications:
We delivered precise amounts of glutamate(cyan) and GABA(orange) to hippocampal neurons to elicit time- and dose-precise excitatory and inhibitory responses respectively, while monitoring the voltage response of the recorded neuron in current-clamp mode.

<p align="justify">20 ms doses of glutamate (100 μM) reliably evoked excitatory postsynaptic potentials (EPSPs) and action potentials. Similarly, action potential activity elicited via somatic current injection could be suppressed by 20 ms puffs of GABA (100 μM).

<p align="justify">To assess the accuracy of the drug delivery, we applied 10 sweeps where a 20 ms glutamate puff was applied after 500 ms produced almost identical EPSPs demonstrating the precise timing of Openspritzer and highly conserved puff volumes.

<p align="justify">Then, to test the effect of command duration on effective dose delivey, we next applied puffs of increasing duration from 10 to 100 ms in 10 ms steps. Here, each additional 10 ms increase in duration produced a clear increase in both EPSP duration and amplitude. These results confirm the reliability and precision of Openspritzer for delivering small doses of an agent to a widely used biological sample in a controlled manner.</p>

***


<p align="justify">To demonstrate the utility of Openspritzer we performed multiple example experiments delivering agents ranging in size from single molecules to whole bacteria. Each experiment depended critically on the performance of the device. The spatio-temporal control of reagent delivery affored by Openspritzer is a primary feature of the device.

<p align="justify">Furthermore, with the emergence of a plethora of popular new techniques involving genetic manipulation of tissue and organisms, such as optogenetics and CRISPR, the demand for equipment with the functionality of Openspritzer is likely to increase.

<p align="justify">We anticipate that due to its high performance and low cost Openspritzer will be of interest to a broad range of researchers working in the life and physical sciences.</p>

<p align="center"><h6 align="right">Source: CJ. Forman et al, 2017 --  https://www.nature.com/articles/s41598-017-02301-2   </h6>

***
### Contributors:

This project is under development for a number of years with contributors from different continents! Here is a small overview:

**2017** formal prototype and publication: 
CJ Forman, H Tomes, RJ Burman M Jacobs, T Baden, JV Raimondo

**2018** creation of PCB, editable designs and 3D printed casing
M Zimmermann, AM Chagas

**2022** Screen add on for pulse duration feedback
J Frie, J Khokhar

