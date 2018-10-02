Smoothness = 20;
tol = 0.15;
Wall = 2;
TOL = 1;
sep = 0;




// // // // // // // // // // // // //
// // // // // Switches // // // // //
// // // // // // // // // // // // //

Puffer = 10;
Lid = 1;

Regulator = 10;
Solenoid = 10;
PCB = 10;

// // // // // // // // // // // // //
// // // Components Parameters / // // 
// // // // // // // // // // // // //

//Hardware measurements
r_M3 = 3/2; //M3 screw radius 
r_M3_nut = 6/2; //M3 nut radius
h_M3_nut = Wall; //M3 nut heigh
r_M6 = 6/2; //M6 screw radius

//Regulator- measurements taken from the regulator
x_Reg = 50.1;
y_Reg = 52.75;
z_Reg = 50.1;
r_RegKnob = 35.8/2 + tol;
pos_y_Reg = 5 + r_RegKnob + TOL;
pos_z_Reg = 2 + r_RegKnob;
AirHoseInDiameter = 13.3 + tol;
AirHoseInYOffset = (36.95 + 48.05)/2 + .4;
AirHoseOutDiameter = 10.3 + tol;

x_Box = 75+2*TOL;
y_Box = 125 +2*TOL;
z_Box = z_Reg + Wall;

//Solenoid - measurements taken from the solenoid.
x_Sol = 32.5;
y_Sol=88.6;
z_Sol = 10.1;
y_SolBody = 73.2;
x_SolRet = 4;
SolRetOffsetX = 6.5;
SolShelfDepth = 4;

//PCB - measurements taken from the PBC footprint.
x_PCB = 75;
y_PCB = 62.5;
z_PCB = 2;
pos_z_PCB = 25-tol;
r_Platform = r_M3 + Wall; // holder for PCB radius
h_Platform = pos_z_PCB; // holder for PCB height
pos_x_Platform1 = -x_Box/2 + TOL + r_Platform + 10;
pos_x_Platform2 = -x_Box/2 + TOL + r_Platform + 55;
pos_y_Platform1 = -y_Box/2 + TOL + r_Platform + 5;
pos_y_Platform2 = -x_Box/2 + TOL + r_Platform + 40;


// DPDT switch
pos_y_DPDT = 20;
h_DPDT = 9.14/2+0.51;
r_DPDT = 4.75/2;

// Potentiometer
pos_y_Pot = 41.25;
h_Pot = 13/2;
r_Pot = 9.5/2;

// BNC
pos_x_BNC1 = 15;
pos_x_BNC2 = 15;
pos_z_BNC = 30;
h_BNC = 15.8/2;
r_BNC = 12.83/2;
cut_BNC = 5.54;

// LED
r_LED = 4.4/2 + tol;

h_Screw = 5;



// Reg derived quantities
RegYPosition = y_Box/2 - 6.8;
RegSpacerDepth = y_Box/2 - RegYPosition;
RegSpacerWidth = 6;

// sol derived quantities
SolYPosition = -y_Box/2 + 2*(r_M3+Wall);
SolShelfHeight  = z_Box - Wall - 2 * z_Sol;
SolRetHeight = SolShelfHeight + z_Sol;



screw01 = [-x_Box/2+2*Wall,-y_Box/2+2*Wall,h_M3_nut];
screw02 = [-x_Box/2+2*Wall,y_Box/2+2*Wall,h_M3_nut];
screw03 = [x_Box/2+2*Wall,-y_Box/2+2*Wall,h_M3_nut];
screw04 = [x_Box/2+2*Wall,y_Box/2+2*Wall,Wall];


module Box(){
    difference(){
        minkowski(){
            translate([-x_Box/2+Wall,-y_Box/2+Wall,0])cube([x_Box+2*Wall,y_Box+2*Wall,z_Box-Wall]);
            cylinder(r1=Wall, h=Wall, $fn=Smoothness);
        }
        
        translate([-x_Box/2+2*Wall,-y_Box/2+2*Wall,Wall])cube([x_Box,y_Box,z_Box]);
       
        // DPDT
        translate([x_Box/2+2*Wall-TOL,-y_Box/2+2*Wall+TOL+pos_y_DPDT,pos_z_PCB+h_DPDT])rotate([0,90,0])cylinder(r=r_DPDT,h=2*Wall+TOL,$fn=Smoothness);
        
        // Potentiometer
        translate([x_Box/2+2*Wall-TOL,-y_Box/2+2*Wall+TOL+pos_y_Pot,pos_z_PCB+h_Pot])rotate([0,90,0])cylinder(r=r_Pot
        ,h=2*Wall+TOL,$fn=Smoothness);   
   
        // Regulator Knob
        translate([x_Box/2+2*Wall-TOL,y_Box/2-pos_y_Reg,pos_z_Reg])rotate([0,90,0])cylinder(r=r_RegKnob, h=2*Wall+TOL, $fn=Smoothness);
        
        // Mini USB
        translate([0,-y_Box/2,pos_z_USB])USB();
        
        // BNC
        translate([pos_x_BNC1,-y_Box/2,pos_z_BNC])BNC();
        translate([-pos_x_BNC2,-y_Box/2,pos_z_BNC])BNC();

            

            
        translate(screw01-[0,0,h_M3_nut])cylinder(r=r_M3_nut+tol,h=h_M3_nut,$fn=6);
        translate(screw02-[0,0,h_M3_nut])cylinder(r=r_M3_nut+tol,h=h_M3_nut,$fn=6);
        translate(screw03-[0,0,h_M3_nut])cylinder(r=r_M3_nut+tol,h=h_M3_nut,$fn=6);
        translate(screw04-[0,0,h_M3_nut])cylinder(r=r_M3_nut+tol,h=h_M3_nut,$fn=6);
    
        translate(screw01)cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
        translate(screw02)cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
        translate(screw03)cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
        translate(screw04)cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
        

        
        //PCB();
    }      
    
        translate([pos_x_Platform1,pos_y_Platform1,0])Platform_Holder();
        translate([pos_x_Platform1,pos_y_Platform2,0])Platform_Holder();
        translate([pos_x_Platform2,pos_y_Platform1,0])Platform_Holder();
        translate([pos_x_Platform2,pos_y_Platform2,0])Platform_Holder();
}


module Screw(){
    difference(){
        union(){
            translate(screw01)cylinder(r=r_M3+Wall/2,h=z_Box-h_M3_nut,$fn=Smoothness);
            translate(screw02)cylinder(r=r_M3+Wall/2,h=z_Box-h_M3_nut,$fn=Smoothness);
            translate(screw03)cylinder(r=r_M3+Wall/2,h=z_Box-h_M3_nut,$fn=Smoothness);
            translate(screw04)cylinder(r=r_M3+Wall/2,h=z_Box-h_M3_nut,$fn=Smoothness);
            
            translate(screw01)cylinder(r1=r_M3+Wall,r2=r_M3+Wall/2,h=4*Wall,$fn=Smoothness);
            translate(screw02)cylinder(r1=r_M3+Wall,r2=r_M3+Wall/2,h=4*Wall,$fn=Smoothness);
            translate(screw03)cylinder(r1=r_M3+Wall,r2=r_M3+Wall/2,h=4*Wall,$fn=Smoothness);
            translate(screw04)cylinder(r1=r_M3+Wall,r2=r_M3+Wall/2,h=4*Wall,$fn=Smoothness);
        }
        
        translate(screw01)cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
        translate(screw02)cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
        translate(screw03)cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
        translate(screw04)cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
    }
}

module Platform_Holder(){
    difference(){
        cylinder(r=r_Platform,h=h_Platform,$fn=Smoothness);
        cylinder(r=r_M3+tol,h=h_Platform,$fn=Smoothness);
    }
}

    // miniUSB Hole
h_USB = 3.8 + tol;
USBWidth = 7.6 + tol;
USBWidth2 = 6.5 + tol;
pos_z_USB = 30;
module USB(){
    translate([-USBWidth/2,0,h_USB/4])cube([USBWidth,2*Wall+TOL,h_USB/2]);
    translate([-USBWidth2/2,0,-h_USB/4])cube([USBWidth2,2*Wall+TOL,h_USB/2]);
}

module BNC(){
    difference(){
        rotate([-90,0,0])cylinder(r=r_BNC,h=2*Wall+TOL,$fn=Smoothness);
        translate([0,0,r_BNC+cut_BNC])cube([r_BNC,2*Wall+tol,r_BNC]);
    }
}













module Puffer(){
    Box();
    Screw();
}
if(Puffer==1)Puffer();
    
module Lid(){
    translate([-x_Box/2+Wall,-y_Box/2+Wall,z_Box-Wall-tol])cube([x_Box+2*Wall,y_Box+2*Wall,Wall]);
}
module Logo(){
    translate([-x_Box/2+5,y_Box/2-45,z_Box-Wall/2])rotate([0,0,-90])scale([0.175,0.175,1])import("C:/Users/Maxime/Desktop/Badenlab_logo.stl");
}
module LED(){
    translate([-x_Box/2+17.9,y_Box/2-6.7,z_Box-Wall-tol])cylinder(r=r_LED,h=Wall+tol,$fn=Smoothness);
    
}if(Lid==1){translate([0,0,sep]){
    difference(){
        Lid();
        Logo();
        LED();
    }
}}


module Regulator(){
    color([1,0,1])translate([100,100,0])cube([x_Reg,y_Reg,z_Reg]);
}
if (Regulator==1)Regulator();
    
module Solenoid(){
    color([1,0,1])translate([12,-48,28])cube([x_Sol,y_Sol,z_Sol]);
}
if (Solenoid==1)Solenoid();
    
module PCB(){
    color([0.5,1,0.5])translate([-x_Box/2+2*Wall+TOL,-y_Box/2+2*Wall+TOL,pos_z_PCB-z_PCB])difference(){
        cube([x_PCB+2*tol,y_PCB+2*tol,z_PCB]);
        cylinder(r=r_M6,h=z_PCB,$fn=Smoothness);
        translate([x_PCB+2*tol,0,0])cylinder(r=r_M6,h=z_PCB,$fn=Smoothness);
        
    }
}
if (PCB==1)PCB();
    



