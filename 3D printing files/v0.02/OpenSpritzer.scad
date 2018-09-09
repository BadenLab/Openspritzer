Smoothness = 20;
tol = 0.15;
Wall = 2;
TOL = 1;




// // // // // // // // // // // // //
// // // // // Switches // // // // //
// // // // // // // // // // // // //

Puffer = 1;

Regulator = 10;
Solenoid = 10;
PCB = 1;

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
RegKnobDiam = 35.8 + tol;
AirHoseInDiameter = 13.3 + tol;
AirHoseInYOffset = (36.95 + 48.05)/2 + .4;
AirHoseOutDiameter = 10.3 + tol;

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
pos_z_PCB = 25;

// DPDT switch
pos_y_DPDT = 20;
h_DPDT = 9.14/2+0.51;
r_DPDT = 4.75/2;

// Potentiometer
pos_y_Pot = 41.25;
h_Pot = 1;
r_Pot = 2;


x_Box = 75+2*TOL;
y_Box = 125 +2*TOL;
z_Box = z_Reg + Wall;
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
                    
        // DPDT
        translate([x_Box/2+2*Wall-TOL,-y_Box/2+2*Wall+TOL+pos_y_DPDT,pos_z_PCB+h_DPDT])rotate([0,90,0])cylinder(r=r_DPDT,h=2*Wall+TOL,$fn=Smoothness);
        
        // Potentiometer
        translate([x_Box/2+2*Wall-TOL,-y_Box/2+2*Wall+TOL+pos_y_Pot,pos_z_PCB+h_Pot])rotate([0,90,0])cylinder(r=r_Pot
        ,h=2*Wall+TOL,$fn=Smoothness);        
        
        difference(){translate([-x_Box/2+2*Wall,-y_Box/2+2*Wall,Wall])cube([x_Box,y_Box,z_Box]);
           
            

            
//            // Regulator Spacer
//            #translate([-x_Box/2 + Wall + x_Reg, RegYPosition + RegSpacerDepth/2, Wall/2+z_Box/2]) cube([RegSpacerWidth, RegSpacerDepth, z_Box - Wall], true);

//            // Solenoid Shelf Back
//            translate([x_Box/2 - Wall - x_Sol/2, SolYPosition + SolShelfDepth/2,Wall + SolShelfHeight/2]) cube([x_Sol, SolShelfDepth, SolShelfHeight], true);
        
//            // Solenoid rear Retainer
//            translate([x_Box/2 - Wall - x_Sol - x_SolRet/2, SolYPosition + SolShelfDepth/2,Wall + SolRetHeight/2]) cube([x_SolRet, SolShelfDepth, SolRetHeight], true);
//
//            // Solenoid Shelf Front
//            translate([x_Box/2 - Wall - x_Sol/2, SolYPosition + y_SolBody - SolShelfDepth/2, Wall + SolShelfHeight/2]) cube([x_Sol, SolShelfDepth, SolShelfHeight], true);

//            // Solenoid Front Retainer1
//            translate([x_Box/2 - Wall - x_Sol - x_SolRet/2 + SolRetOffsetX, SolYPosition + y_SolBody + x_SolRet/2,Wall + SolRetHeight/2]) cube([x_SolRet , x_SolRet, SolRetHeight], true);
//        
//            // Solenoid Front Retainer2
//            translate([x_Box/2 - Wall - x_Sol - x_SolRet/2, SolYPosition + y_SolBody - SolShelfDepth/2, Wall + SolRetHeight/2]) cube([x_SolRet, SolShelfDepth, SolRetHeight], true);
        
//            // MountingPoints 
//            // Rear Right
//            translate([XLen/2 - Thickness - BoardEdgeX, BoardYPosition + BoardEdgeY, -ZLen/2 + Thickness + MountPointHeight/2]) cylinder(MountPointHeight, MountPointOuterDiameter/2, MountPointOuterDiameter/2, $fn=Smoothness, true);
//        
//            // Rear Left
//            translate([XLen/2 - Thickness - BoardEdgeX - MountPointWidth, BoardYPosition + BoardEdgeY, -ZLen/2 + Thickness + MountPointHeight/2]) cylinder(MountPointHeight, MountPointOuterDiameter/2, MountPointOuterDiameter/2, $fn=Smoothness, true);
//
//            // Front Right
//            translate([XLen/2 - Thickness - BoardEdgeX, BoardYPosition + BoardEdgeY + MountPointLength, -ZLen/2 + Thickness + MountPointHeight/2]) cylinder(MountPointHeight, MountPointOuterDiameter/2, MountPointOuterDiameter/2, $fn=Smoothness, true);
//
//            // Front Left
//            translate([XLen/2 - Thickness - BoardEdgeX - MountPointWidth, BoardYPosition + BoardEdgeY + MountPointLength, -ZLen/2 + Thickness + MountPointHeight/2]) cylinder(MountPointHeight, MountPointOuterDiameter/2, MountPointOuterDiameter/2, $fn=Smoothness, true);

//            // Power Jack Support vertical
//            translate([XLen/2 - Thickness/2 - PowerJackSupportDepth/2, PowerJackYPosition - PowerJackWidth/2 - Thickness/2, -ZLen/2 + Thickness + MountPointHeight + USBZOffset ] ) 
//        cube([PowerJackSupportDepth, Thickness, PowerJackHeight], true);
//        
//            // Power Jack Support Horiz
//            translate([XLen/2 - Thickness/2 - PowerJackSupportDepth/2, PowerJackYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset - PowerJackHeight/2 - Thickness/2] ) 
//        cube([PowerJackSupportDepth, PowerJackWidth, Thickness], true);
    }
        
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

module Puffer(){
    Box();
    Screw();
}
if(Puffer==1)Puffer();
    

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
    



