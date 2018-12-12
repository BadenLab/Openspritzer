/* 


        OpenSpritzer v1.3, an open hardware pressure ejection system.

This 3D file is designed for the OpenSpritzer project components and its customed PCB
Source : https://github.com/BadenLab/Openspritzer
This project is Open Source licensed, released under CERN OHL v1.2

by M.J.Y. Zimmermann, 2018.12.11
Baden Lab, CRPC, School of Life Sciences, University of Sussex, United Kingdom

                                                                                     */



// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                            ---  User Parameters  ---                             */
 
Wall = 2;           // Defines the wall thickness of the box
Smoothness = 360;    // Number of facets
tol = 0.1;          // Printing tolerance
TOL = 0.4;          // Component tolerance

sep = 5;            // x & y separation values for display function
zsep = 5;           // z separation values for display function

// // // // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Switches  ---                              */


// Parts to be printed
Bottom =  1;        // Lower Part of the box
Front =   1;        // Front Part of the box
Back =    1;        // Back Part of the box
Right =   1;        // Right Part of the box
Left =    1;        // Left Part of the box
Lid =     1;        // Top Part of the box


// Display part used for visualisation
Regulator = 10;     // Pressure Regulator
Solenoid = 10;      // Pressure Solenoid
PCB = 10;           // Custumed Printed Circuit Board


// // // // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                        ---  Component Parameteres  ---                        */

//Hardware measurements
r_M3 = 3/2; //M3 screw radius 
r_M3_nut = 6.3/2; //M3 nut radius
h_M3_nut = 2.35; //M3 nut heigh
r_M6 = 6/2; //M6 screw radius

//Regulator- measurements taken from the regulator
x_Reg = 50.1+2*tol;
y_Reg = 52.75+2*tol;
z_Reg = 50.1+2*tol;
r_RegKnob = 35.8/2 + tol;
pos_y_Reg = 5 + r_RegKnob + TOL;
pos_z_Reg = 2 + r_RegKnob;
r_Gauge = 40/2;
GaugexOffset = (13.2 + 22.72)/2 +.3;
GaugeDiameter = 9.8/2 + tol;
AirHoseInxOffset = (36.95 + 48.05)/2 + .4-4.5;
r_AirHoseIn = (13.3)/2 + tol;
x_RegStop = 5;

r_AirHoseOut = 10.3/2 + tol;

//Main Box
x_Box = 85+2*TOL;
y_Box = 120 +2*TOL;
z_Box = z_Reg + 2*Wall + 2*TOL;

//Solenoid - measurements taken from the solenoid.
x_Sol = 31+2*tol;
y_Sol= 73+2*tol;
z_Sol = 10+2*tol;
y_Sol_in = 17;
y_Sol_out1 = 10.5;
y_Sol_out2 = 22.5;
r_Sol = 10.3/2 + tol;

//PCB - measurements taken from the PBC footprint.
x_PCB = 85+2*tol;
y_PCB = 57.5+2*tol;
z_PCB = 1.6;
pos_z_PCB = 15-tol;
r_Platform = r_M3 + Wall; // holder for PCB radius
h_Platform = pos_z_PCB-z_PCB-tol; // holder for PCB height
pos_x_Platform1 = -x_Box/2 + TOL + r_Platform + 28.5;
pos_x_Platform2 = -x_Box/2 + TOL + r_Platform + 28.5 + 29;
pos_y_Platform1 = -y_Box/2 + TOL + r_Platform + 18;
pos_y_Platform2 = -y_Box/2 + TOL + 2*Wall + 18 + 36;


// DPDT switch
pos_y_DPDT = 20;
h_DPDT = 9.14/2+0.51;
r_DPDT = 4.75/2;

// Potentiometer
pos_y_Pot = 42.75;
h_Pot = 13/2;
r_Pot = 9.5/2;

// BNC
pos_x_BNC1 = 22;
pos_x_BNC2 = 22.75;
pos_z_BNC = 15.8/2;
h_BNC = 15.8/2;
r_BNC = 12.83/2;
cut_BNC = r_BNC-5.54;

// LED
r_LED = 4.4/2 + tol;

// Barrel Jack
h_Jack = 11.15 + tol;
y_Jack = 9.25 + 2*tol;
pos_y_Jack = 47.75;

// Mini USB
h_USB = 3.8 + tol;
USBWidth = 7.65 + 2*tol;
USBWidth2 = 6.75 + 2*tol;
pos_z_USB = 8.51+4.1+1.57;

// Power Switch
x_Switch = 14;
y_Switch = 20;

// PCB holder screw positions
screw01 = [-x_Box/2+2*Wall,-y_Box/2+2*Wall,h_M3_nut];
screw02 = [-x_Box/2+2*Wall,y_Box/2+2*Wall,h_M3_nut];
screw03 = [x_Box/2+2*Wall,-y_Box/2+2*Wall,h_M3_nut];
screw04 = [x_Box/2+2*Wall,y_Box/2+2*Wall,Wall];

// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Display  ---                               */

if(Bottom==1){
    difference(){
        Puffer();
        Front_neg();
        Right_neg();
        Left_neg();
        Back_neg();
    }
}

if(Front==1){translate([sep,0,zsep]){
    difference(){
        intersection(){
            Puffer();
            Front();
        }
        Right_neg();
        Left_neg();
        translate([x_Box/2+2*Wall-TOL,-y_Box/2+2*Wall+TOL+pos_y_DPDT,pos_z_PCB+h_DPDT])rotate([0,90,0])cylinder(r=r_DPDT,h=2*Wall+TOL,$fn=Smoothness);
    }
}}
if(Back==1){translate([-sep,0,zsep]){
    difference(){
        intersection(){
            Puffer();
            Back();
        }
        Right_neg();
        Left_neg();
    }
}}
if(Right==1){translate([0,sep,2*zsep]){
    intersection(){
        Puffer();
        Right();
    }
}}
if(Left==1){translate([0,-sep,2*zsep]){
    intersection(){
        Puffer();
        Left();
    }
    translate([x_Box/2,-y_Box/2+2*Wall+TOL,z_Box-Wall-z_Sol-TOL-Wall-TOL])rotate([0,0,90])cube([x_Sol,y_Sol,Wall]);
}}

if(Lid==1){translate([0,0,3*zsep+tol]){
    difference(){
        Lid();
        Logo();
        LED();
        Title();
        Screw_hole();
        Regulator();
        Power_Switch();
    }
    difference(){
        Box();
        Top_negative();
    }
}}  

if (Regulator==1)Regulator();
if (Solenoid==1)Solenoid(); 
if (PCB==1)PCB();
    

// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Modules  ---                               */


// // // // // // // // // // // // Box Modules // // // // // // // // // // // //

module Box(){
    difference(){
        minkowski(){
            translate([-x_Box/2+Wall,-y_Box/2+Wall,0])cube([x_Box+2*Wall,y_Box+2*Wall,z_Box-Wall]);
            cylinder(r1=Wall, h=Wall, $fn=Smoothness);
        }

        difference(){
            translate([-x_Box/2+2*Wall,-y_Box/2+2*Wall,Wall])cube([x_Box,y_Box,z_Box]);
            //translate([x_Box/2+2*Wall-x_RegStop,y_Box/2-y_Reg+2*Wall-TOL,Wall])cube([x_RegStop,x_RegStop,h_Platform]);
        }
        
        Labels()        
        
        // DPDT
        translate([x_Box/2+2*Wall-TOL,-y_Box/2+2*Wall+TOL+pos_y_DPDT,pos_z_PCB+h_DPDT])rotate([0,90,0])cylinder(r=r_DPDT,h=2*Wall+TOL,$fn=Smoothness);
        
        // Potentiometer
        translate([x_Box/2+2*Wall-TOL,-y_Box/2+2*Wall+TOL+pos_y_Pot,pos_z_PCB+h_Pot])rotate([0,90,0])cylinder(r=r_Pot
        ,h=2*Wall+TOL,$fn=Smoothness);   
   
        // Regulator 
        Regulator();
        
        //Solenoid
        Solenoid();
        
        // Mini USB
        translate([0,-y_Box/2,pos_z_PCB + pos_z_USB])USB();
        
        // BNC
        translate([pos_x_BNC1,-y_Box/2,pos_z_PCB + pos_z_BNC])BNC();
        translate([-pos_x_BNC2,-y_Box/2,pos_z_PCB + pos_z_BNC])BNC();
        
        // Barrel Jack
        translate([-x_Box/2, -y_Box/2+2*Wall+TOL+pos_y_Jack, pos_z_PCB])cube([2*Wall,y_Jack,h_Jack]);
        
        Screw_Nuts();
        Screw_hole();
        Screw_PCB();
    }      
        PCB_Screw();
    
}
module Puffer(){
    difference(){
        Box();
        translate([-x_Box/2,-y_Box/2,z_Box-Wall])cube([x_Box+4*Wall,y_Box+4*Wall,2*Wall]);
        }
    Screw();
}
module Screw_Nuts(){
    translate(screw01-[0,0,h_M3_nut])cylinder(r=r_M3_nut+tol,h=h_M3_nut+Wall,$fn=6);
    translate(screw02-[0,0,h_M3_nut])cylinder(r=r_M3_nut+tol,h=h_M3_nut+Wall,$fn=6);
    translate(screw03-[0,0,h_M3_nut])cylinder(r=r_M3_nut+tol,h=h_M3_nut+Wall,$fn=6);
    translate(screw04-[0,0,h_M3_nut])cylinder(r=r_M3_nut+tol,h=h_M3_nut+Wall,$fn=6); 
}
module Platform_Holder(){
    difference(){
        cylinder(r1=r_Platform+Wall,r2=r_Platform,h=h_Platform,$fn=Smoothness);
        cylinder(r=r_M3+tol,h=h_Platform,$fn=Smoothness);
        cylinder(r=r_M3_nut+tol,h=h_M3_nut+Wall,$fn=6);
    }
}
module PCB_Screw(){
    translate([pos_x_Platform1,pos_y_Platform1,0])Platform_Holder();
    translate([pos_x_Platform1,pos_y_Platform2,0])Platform_Holder();
    translate([pos_x_Platform2,pos_y_Platform1,0])Platform_Holder();
    translate([pos_x_Platform2,pos_y_Platform2,0])Platform_Holder();    
}
module Screw_PCB(){
    translate([pos_x_Platform1,pos_y_Platform1,0])cylinder(r=r_M3_nut+tol,h=h_M3_nut+Wall,$fn=6);
    translate([pos_x_Platform1,pos_y_Platform2,0])cylinder(r=r_M3_nut+tol,h=h_M3_nut+Wall,$fn=6);
    translate([pos_x_Platform2,pos_y_Platform1,0])cylinder(r=r_M3_nut+tol,h=h_M3_nut+Wall,$fn=6);
    translate([pos_x_Platform2,pos_y_Platform2,0])cylinder(r=r_M3_nut+tol,h=h_M3_nut+Wall,$fn=6);    
}
module Screw_hole(){
    translate(screw01)cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
    translate(screw02)cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
    translate(screw03)cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
    translate(screw04)cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);    
}
module Screw(){
    difference(){
        union(){
            translate(screw01)cylinder(r=r_M3+Wall/2,h=z_Box-h_M3_nut-Wall,$fn=Smoothness);
            translate(screw02)cylinder(r=r_M3+Wall/2,h=z_Box-h_M3_nut-Wall,$fn=Smoothness);
            translate(screw03)cylinder(r=r_M3+Wall/2,h=z_Box-h_M3_nut-Wall,$fn=Smoothness);
            translate(screw04)cylinder(r=r_M3+Wall/2,h=z_Box-h_M3_nut-Wall,$fn=Smoothness);
            
            translate(screw01)cylinder(r1=r_M3+Wall,r2=r_M3+Wall/2,h=4*Wall,$fn=Smoothness);
            translate(screw02)cylinder(r1=r_M3+Wall,r2=r_M3+Wall/2,h=4*Wall,$fn=Smoothness);
            translate(screw03)cylinder(r1=r_M3+Wall,r2=r_M3+Wall/2,h=4*Wall,$fn=Smoothness);
            translate(screw04)cylinder(r1=r_M3+Wall,r2=r_M3+Wall/2,h=4*Wall,$fn=Smoothness);
        }     
        Screw_hole();
    }
}
module Lid(){
    translate([-x_Box/2+Wall,-y_Box/2+Wall,z_Box-Wall])cube([x_Box+2*Wall,y_Box+2*Wall,Wall]);
}


// // // // // // // // // // // // Negative Modules // // // // // // // // // // // //

module USB(){
    translate([-USBWidth/2,0,h_USB/2])cube([USBWidth,2*Wall+TOL,h_USB/2]);
    translate([-USBWidth2/2,0,0])cube([USBWidth2,2*Wall+TOL,h_USB/2]);
}
module BNC(){
    difference(){
        rotate([-90,0,0])cylinder(r=r_BNC+tol,h=2*Wall+TOL,$fn=Smoothness);
        translate([-r_BNC,0,r_BNC-cut_BNC])cube([2*r_BNC,2*Wall+tol,cut_BNC]);
    }
}
module Top_negative(){
    translate([-x_Box/2,-y_Box/2,0])cube([x_Box+4*Wall,y_Box+4*Wall,z_Box-Wall]);
}

module LED(){
    translate([35.75,-48.5,z_Box-Wall-tol])cylinder(r=r_LED,h=Wall+tol,$fn=Smoothness);  
}
module Logo(){
    translate([x_Box/2+2.5,-20,z_Box-Wall/2])rotate([0,0,90])scale([0.75,0.75,1])scale([0.175,0.175,1])import("C:/Users/Maxime/Documents/GitHub/Openspritzer/3D Printing Files/v1.3 - Customed PCB/Badenlab_logo.stl");
}
//C:/Users/Maxime/Desktop/Badenlab_logo.stl"
module Title(){
    translate([-15,-x_Box/2-5,z_Box-Wall/2])linear_extrude(h=Wall/2)rotate([0,0,90])text("OpenSpritzer");
    translate([-15,40,z_Box-Wall/2])linear_extrude(h=Wall/2)rotate([0,0,90])text("v1.3",size=5);
    translate([-6,-42.5,z_Box-Wall/2])linear_extrude(h=Wall/2)rotate([0,0,90])text("An open hardware pressure ejection system",size=4);
}
module Labels(){
    translate([12.5,-y_Box/2+Wall,z_Box/2+2])rotate([90,0,0])linear_extrude(h=Wall/2)text("Foot Pedal",size=3);
    translate([-26.5,-y_Box/2+Wall,z_Box/2+2])rotate([90,0,0])linear_extrude(h=Wall/2)text("TTL",size=3);
    translate([-x_Box/2+42.5,-y_Box/2+Wall,z_Box/2+18])rotate([90,0,0])linear_extrude(h=Wall/2)text("Air out",size=3);
    
    translate([x_Box/2+3*Wall,-y_Box/2+37.5,z_Box/2+2])rotate([90,0,0])rotate([0,90,0])linear_extrude(h=Wall/2)text("Pulse Duration",size=3);
    translate([x_Box/2+3*Wall,-y_Box/2+26,z_Box/2-5])rotate([90,0,0])rotate([0,90,0])linear_extrude(h=Wall/2)text("TTL",size=3);
    translate([x_Box/2+3*Wall,-y_Box/2+2,z_Box/2-5])rotate([90,0,0])rotate([0,90,0])linear_extrude(h=Wall/2)text("Foot Pedal",size=3);
    
    translate([3+4.5,y_Box/2+4*Wall-Wall,z_Box/2+8])rotate([90,0,180])linear_extrude(h=Wall/2)text("Air in",size=3);
    
    translate([-x_Box/2+Wall,6,z_Box/2+3])rotate([90,0,-90])linear_extrude(h=Wall/2)text("Power in",size=3);
    translate([-x_Box/2+Wall,2,z_Box/2+-0.5])rotate([90,0,-90])linear_extrude(h=Wall/2)text("24V",size=3);
}
module Power_Switch(){
    translate([-x_Box/2+x_Switch/2,y_Box/2-y_Switch,z_Box-Wall])cube([x_Switch+2*tol,y_Switch+2*tol,2*Wall]);
}

// // // // // // // // // // // // Compartimentation Modules // // // // // // // // // // // //

f1=17.5;
f2=10;
module Front(){
    difference(){
        union(){
            translate([x_Box/2,-y_Box/2,z_Box/3-Wall])cube([4*Wall,f1,z_Box*2/3]);
            translate([x_Box/2,-y_Box/2+f1,3*Wall])cube([4*Wall,y_Box+4*Wall-f1-f2,z_Box-4*Wall]);
            translate([x_Box/2,y_Box/2-Wall,z_Box/3-Wall])cube([4*Wall,f2,z_Box*2/3]);
        }
        translate([x_Box/2+2*Wall-x_RegStop,y_Box/2-y_Reg+2*Wall-TOL,Wall])cube([x_RegStop,x_RegStop,h_Platform]);//Reg Stop    
        translate([x_Box/2+3*Wall,-y_Box/2,z_Box/3-Wall])cube([Wall,f1,Wall]);//Front Left
        translate([x_Box/2+3*Wall,-y_Box/2+f1,3*Wall])cube([Wall,y_Box+4*Wall-f1-f2,Wall]);//Front Middle
        translate([x_Box/2+3*Wall,y_Box/2-Wall,z_Box/3-Wall])cube([Wall,f2,Wall]);//Front Right
    }
}
module Front_neg(){
    difference(){
        union(){
            translate([x_Box/2-tol,-y_Box/2,z_Box/3-Wall-tol])cube([4*Wall+tol,f1-tol,z_Box*2/3+tol]);
            translate([x_Box/2,-y_Box/2+f1-tol,3*Wall-tol])cube([4*Wall,y_Box+4*Wall-f1-f2+2*tol,z_Box-4*Wall+tol]);
            translate([x_Box/2-tol,y_Box/2-Wall+tol,z_Box/3-Wall-tol])cube([4*Wall+tol,f2+tol,z_Box*2/3+tol]);
        }
        translate([x_Box/2+2*Wall-x_RegStop,y_Box/2-y_Reg+2*Wall-TOL,Wall])cube([x_RegStop,x_RegStop,h_Platform]);//Reg Stop    
        translate([x_Box/2+3*Wall+tol,-y_Box/2,z_Box/3-Wall-tol])cube([Wall,f1-tol,Wall]);//Front Left
        translate([x_Box/2+3*Wall,-y_Box/2+f1-tol,3*Wall-tol])cube([Wall,y_Box+4*Wall-f1-f2+2*tol,Wall]);//Front Middle
        translate([x_Box/2+3*Wall+tol,y_Box/2-Wall+tol,z_Box/3-Wall-tol])cube([Wall,f2+tol,Wall]);//Front Right
    }
}
b1=50;
b2=22.5;
module Back(){
    difference(){
        union(){
            translate([-x_Box/2,-y_Box/2,z_Box/3-Wall])cube([4*Wall,b1,z_Box*2/3]);
            translate([-x_Box/2,-y_Box/2+b1,3*Wall])cube([4*Wall,b2,z_Box-4*Wall]);
            translate([-x_Box/2,-y_Box/2+b1+b2,z_Box/3-Wall])cube([4*Wall,y_Box+4*Wall-b1-b2,z_Box*2/3]);
        }
        translate([-x_Box/2+Wall,-y_Box/2+3*Wall,z_Box/3-Wall])cube([Wall,b1-3*Wall,Wall]);
        translate([-x_Box/2+Wall,-y_Box/2+b1,3*Wall])cube([Wall,b2,Wall]);
        translate([-x_Box/2+Wall,-y_Box/2+b1+b2,z_Box/3-Wall])cube([Wall,y_Box+4*Wall-b1-b2-3*Wall,Wall]);
    }
}
module Back_neg(){
    difference(){
        union(){
            translate([-x_Box/2,-y_Box/2,z_Box/3-Wall-tol])cube([4*Wall+tol,b1-tol,z_Box*2/3+tol]);
            translate([-x_Box/2,-y_Box/2+b1-tol,3*Wall-tol])cube([4*Wall,b2+2*tol,z_Box-4*Wall+tol]);
            translate([-x_Box/2,-y_Box/2+b1+b2+tol,z_Box/3-Wall-tol])cube([4*Wall+tol,y_Box+4*Wall-b1-b2+tol,z_Box*2/3+tol]);
        }
        translate([-x_Box/2+Wall+tol,-y_Box/2+3*Wall,z_Box/3-Wall-tol])cube([Wall,b1-3*Wall-tol,Wall]);
        translate([-x_Box/2+Wall,-y_Box/2+b1-tol,3*Wall-tol])cube([Wall,b2+2*tol,Wall]);
        translate([-x_Box/2+Wall+tol,-y_Box/2+b1+b2+tol,z_Box/3-Wall-tol])cube([Wall,y_Box+4*Wall-b1-b2-3*Wall+tol,Wall]);
    }
}
r1=25.5+2.5;
r2=32.5+2.5;
module Right(){
    difference(){
        union(){
            translate([-x_Box/2,y_Box/2,z_Box*2/3-Wall])cube([r1,4*Wall,z_Box/3]);
            translate([-x_Box/2+r1,y_Box/2,3*Wall])cube([r2,4*Wall,z_Box-4*Wall]);
            translate([-x_Box/2+r1+r2,y_Box/2,z_Box*2/3-Wall])cube([x_Box+4*Wall-r1-r2,4*Wall,z_Box/3]);
        }
        translate([-x_Box/2,y_Box/2+3*Wall,z_Box*2/3-Wall])cube([r1,Wall,Wall]);// Right Back
        translate([-x_Box/2+r1,y_Box/2+2*Wall,3*Wall])cube([r2,Wall,Wall]); // Right Middle
        translate([-x_Box/2+r1+r2,y_Box/2+3*Wall,z_Box*2/3-Wall])cube([x_Box+4*Wall-r1-r2,Wall,Wall]);// Right Front
    }
}
module Right_neg(){
    difference(){
        union(){
            translate([-x_Box/2,y_Box/2-tol,z_Box*2/3-Wall-tol])cube([r1-tol,4*Wall+tol,z_Box/3+tol]);
            translate([-x_Box/2+r1-tol,y_Box/2,3*Wall-tol])cube([r2+2*tol,4*Wall,z_Box-4*Wall+tol]);
            translate([-x_Box/2+r1+r2,y_Box/2-tol,z_Box*2/3-Wall-tol])cube([x_Box+4*Wall-r1-r2,4*Wall+tol,z_Box/3+tol]);
        }
        translate([-x_Box/2,y_Box/2+3*Wall+tol,z_Box*2/3-Wall-tol])cube([r1-tol,Wall,Wall]);// Right Back
        translate([-x_Box/2+r1,y_Box/2+2*Wall,3*Wall-tol])cube([r2,Wall,Wall]); // Right Middle
        translate([-x_Box/2+r1+r2+tol,y_Box/2+3*Wall+tol,z_Box*2/3-Wall-tol])cube([x_Box+4*Wall-r1-r2+tol,Wall,Wall]);// Right Front
    }
}
l1=10;
l2=70;
module Left(){
    difference(){
        union(){
            translate([-x_Box/2,-y_Box/2,z_Box*2/3-Wall])cube([l1,4*Wall,z_Box/3]);
            translate([-x_Box/2+l1,-y_Box/2,3*Wall])cube([l2,4*Wall,z_Box-4*Wall]);
            translate([-x_Box/2+l1+l2,-y_Box/2,z_Box*2/3-Wall])cube([x_Box+4*Wall-l1-l2,4*Wall,z_Box/3]);
        }
        translate([-x_Box/2,-y_Box/2,z_Box*2/3-Wall])cube([l1,Wall,Wall]);// Left Back
        translate([-x_Box/2+l1,-y_Box/2,3*Wall])cube([l2,Wall,Wall]); // Left Middle
        translate([-x_Box/2+l1+l2,-y_Box/2,z_Box*2/3-Wall])cube([x_Box+4*Wall-l1-l2,Wall,Wall]);// Left Front
    }
}
module Left_neg(){
    difference(){
        union(){
            translate([-x_Box/2,-y_Box/2-tol,z_Box*2/3-Wall-tol])cube([l1,4*Wall+tol,z_Box/3+tol]);
            translate([-x_Box/2+l1-tol,-y_Box/2-tol,3*Wall-tol])cube([l2+2*tol,4*Wall+tol,z_Box-4*Wall+tol]);
            translate([-x_Box/2+l1+l2,-y_Box/2-tol,z_Box*2/3-Wall-tol])cube([x_Box+4*Wall-l1-l2,4*Wall+tol,z_Box/3+tol]);
        }
        translate([-x_Box/2,-y_Box/2,z_Box*2/3-Wall-tol])cube([l1-tol,Wall-tol,Wall]);// Left Back
        translate([-x_Box/2+l1-tol,-y_Box/2,3*Wall-tol])cube([l2+2*tol,Wall,Wall]); // Left Middle
        translate([-x_Box/2+l1+l2+tol,-y_Box/2,z_Box*2/3-Wall-tol])cube([x_Box+4*Wall-l1-l2+tol,Wall-tol,Wall]);// Left Front
    }  
}

// // // // // // // // // // // // Component Modules // // // // // // // // // // // //

module Regulator(){color([1,0,1])translate([x_Box/2-x_Reg+2*Wall-TOL-x_RegStop,y_Box/2-y_Reg+2*Wall-TOL,Wall+TOL]){
    cube([x_Reg,y_Reg,z_Reg]);
    translate([x_Reg,y_Reg/2,z_Reg/2])rotate([0,90,0])cylinder(r=r_RegKnob, h=r_RegKnob, $fn=Smoothness);
    translate([x_Reg-GaugexOffset,y_Reg/2,z_Reg])cylinder(r=GaugeDiameter , h=2*Wall, $fn=Smoothness);
    translate([x_Reg-GaugexOffset,y_Reg/2,z_Reg+2*Wall])cylinder(r=r_Gauge , h=8*Wall, $fn=Smoothness);
    translate([x_Reg-AirHoseInxOffset,y_Reg,z_Reg/2])rotate([-90,0,0])cylinder(r=r_AirHoseIn, h=5*Wall, $fn=Smoothness);
}}   
module Solenoid(){
    color([1,0,1])translate([x_Box/2,-y_Box/2+2*Wall+TOL,z_Box-Wall-z_Sol-TOL])rotate([0,0,90]){
        cube([x_Sol,y_Sol,z_Sol]);
        translate([x_Sol,y_Sol-y_Sol_in,z_Sol/2])rotate([0,90,0])cylinder(r=r_Sol, h=2*Wall+TOL, $fn=Smoothness);
        translate([0,y_Sol-y_Sol_out1,z_Sol/2])rotate([0,-90,0])cylinder(r=r_Sol, h=2*Wall+TOL, $fn=Smoothness);
        translate([0,y_Sol-y_Sol_out2,z_Sol/2])rotate([0,-90,0])cylinder(r=r_Sol, h=2*Wall+TOL, $fn=Smoothness);
    }
}   
module PCB(){
    color([0.5,1,0.5])translate([-x_Box/2+2*Wall+TOL,-y_Box/2+2*Wall+TOL,pos_z_PCB-z_PCB])difference(){
        cube([x_PCB+2*tol,y_PCB+2*tol,z_PCB]);
        cylinder(r=r_M6,h=z_PCB,$fn=Smoothness);
        translate([x_PCB+2*tol,0,0])cylinder(r=r_M6,h=z_PCB,$fn=Smoothness);   
    }
}
