<p align="right"><img src="https://github.com/BadenLab/Zebrafish-visual-space-model/blob/master/Images/Logo.png" width="300"/>
<h1 align="center">Openspritzer</h1></p>
<h3 align="center">An open hardware pressure ejection system for reliably delivering picolitre volumes.</h3>
<p align="center"><h6 align="right">by C.J. Forman, H. Tomes, B. Mbobo, R.J. Burman, M. Jacobs, T Baden &
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

- [A £350 DIY opensource microinjector](#openspritzer,-a-DIY-opensource-microinjector.)
- [An efficient device that provides similar level of control as commercial systems](#Openspritzer-rivals-the-performance-of-commercial-systems.)
- [Openspritzer can deliver neurotransmitters with millisecond precision to control neural activity](#Openspritzer-in-neuroscience-experiments.)
- [OpenSpritzer is suitable for delivering infectious agents including viral delivery of opsins for optogenetics](#Openspritzer-for-microinjection-of-infectious-agents)

***

## Openspritzer, a DIY opensource microinjector.

Compared to similar commercial systems that can cost up to several thousand pounds, the cost of the fully equiped Openspritzer (~£350) makes it
particularly attractive for those wishing to pursue cutting-edge techniques in low ressource environments.

This repository contains detailed [assembly instructions](https://github.com/BadenLab/Openspritzer/blob/master/Manuscript%20and%20Instruction/supplementary_information_final.pdf) and an operation manual for Openspritzer. The [bill of material](https://github.com/BadenLab/Openspritzer/blob/master/Manuscript%20and%20Instruction/BOM.csv) details all pneumatic, mechanical and electronic components required along with possible supplier URL links.

<img align="right" width="150" height="150" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/PCB%20Board.png">

To simplify the wiring assembly, we have designed a customed [circuit board](https://github.com/BadenLab/Openspritzer/tree/master/PCB). PCB prototype enterprise will only need the [Gerber](https://github.com/BadenLab/Openspritzer/tree/master/PCB/OpenSpritzer%20v0.02/gerber) files to be sent to them for production.

<img align="left" width="200" height="200" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/3d%20print.png">

We used [OpenSCAD](http://openscad.org) to design the [box and lid](https://github.com/BadenLab/Openspritzer/tree/master/3D%20printing%20files) .stl files that could be 3D printed to efficiently hold all openspritzer components. You may have to modify the measurements in the script to comply with the components that you have purchased.

The device is controled by an arduino nano. The [.ino code](https://github.com/BadenLab/Openspritzer/tree/master/Arduino) can be modified and uploaded as many times as you like. The way the Openspritzer code has been constructed allows simple modification of key parameters such as the base unit of time. These are all included at the beginning of the code for ease of reference.

***

## Openspritzer rivals the performance of commercial systems.

<img align="right" width="300" height="300" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/Figure2.PNG">
Openspritzer control over dose delivery matches that of a leading commercial alternative.

To directly assess the time precision and reliability of Openspritzer we visualised fluorescent dye puffs from a sharp microelectrode under two-photon microscopy. The images were taken from a puff with a duration of several seconds using a wide area scan (rectangles).

Fluorescence profiles of different command-duration puffs are shown for Openspritzer (green) and Picospritzer, a popular microinjection system(purple), respectively. The same data is shown again in log-log space to highlight details of shorter pulses. Overall, both devices behave in a very similar way in terms of providing effective and near linear control over the total dosage.

***

## Openspritzer in neuroscience experiments.

<img align="Left" width="250" height="500" src="https://github.com/BadenLab/Openspritzer/blob/master/Images/Figure3.png">
Openspritzer controls neural activity by delivering neurotransmitters with millisecond precision.

To demonstrate the utility of Openspritzer, we use it in a series of standard neurobiological applications:
We delivered precise amounts of glutamate(cyan) and GABA(orange) to hippocampal neurons to elicit time- and dose-precise excitatory and inhibitory responses respectively, while monitoring the voltage response of the recorded neuron in current-clamp mode.

20 ms doses of glutamate (100 μM) reliably evoked excitatory postsynaptic potentials (EPSPs) and action potentials. Similarly, action potential activity elicited via somatic current injection could be suppressed by 20 ms puffs of GABA (100 μM).

To assess the accuracy of the drug delivery, we applied 10 sweeps where a 20 ms glutamate puff was applied after 500 ms produced almost identical EPSPs demonstrating the precise timing of Openspritzer and highly conserved puff volumes.

Then, to test the effect of command duration on effective dose delivey, we next applied puffs of increasing duration from 10 to 100 ms in 10 ms steps. Here, each additional 10 ms increase in duration produced a clear increase in both EPSP duration and amplitude. These results confirm the reliability and precision of Openspritzer for delivering small doses of an agent to a widely used biological sample in a controlled manner.


***

## Openspritzer for microinjection of infectious agents

***
***

To demonstrate the utility of Openspritzer we performed multiple example experiments delivering agents ranging in size from single molecules to whole bacteria. Each experiment depended critically on the performance of the device. The spatio-temporal control of reagent delivery affored by Openspritzer is a primary feature of the device.

Furthermore, with the emergence of a plethora of popular new techniques involving genetic manipulation of tissue and organisms, such as optogenetics and CRISPR, the demand for equipment with the functionality of Openspritzer is likely to increase.

We anticipate that due to its high performance and low cost Openspritzer will be of interest to a broad range of researchers working in the life and physical sciences.
<p align="center"><h6 align="right">Source: [CJ. Forman et al, 201](https://www.nature.com/articles/s41598-017-02301-2) </h6>
