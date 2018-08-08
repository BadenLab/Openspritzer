Smoothness = 20;
tol = 0.15;
Wall = 2;




// // // // // // // // // // // // //
// // // // // Switches // // // // //
// // // // // // // // // // // // //

Puffer = 1;

Regulator = 1;
Solenoid = 1;
PCB = 1;

// // // // // // // // // // // // //
// // // Components Parameters / // // 
// // // // // // // // // // // // //

//Hardware measurements
r_M3 = 3/2; //M3 screw radius 
r_M3_nut = 6/2; //M3 nut radius
h_M3_nut = Wall; //M3 nut heigh

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
x_PCB = 32.5;
y_PCB = 66;
z_PCB = 1;


x_Box = 100;
y_Box = y_Sol + 2*Wall + 2*(r_M3+Wall/2);
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



module Box(){
    difference(){
        minkowski(){
            translate([-x_Box/2+Wall,-y_Box/2+Wall,0])cube([x_Box-2*Wall,y_Box-2*Wall,z_Box-Wall]);
            cylinder(r1=Wall, h=Wall, $fn=Smoothness);
        }
        
        difference(){
            minkowski(){
                translate([-x_Box/2+2*Wall,-y_Box/2+2*Wall,Wall])cube([x_Box-4*Wall,y_Box-4*Wall,z_Box-2*Wall]);
                cylinder(r1=Wall, r2=Wall, h=Wall, $fn=Smoothness);
            }
            // Regulator Spacer
            translate([-x_Box/2 + Wall + x_Reg, RegYPosition + RegSpacerDepth/2, Wall/2+z_Box/2]) cube([RegSpacerWidth, RegSpacerDepth, z_Box - Wall], true);

            // Solenoid Shelf Back
            translate([x_Box/2 - Wall - x_Sol/2, SolYPosition + SolShelfDepth/2,Wall + SolShelfHeight/2]) cube([x_Sol, SolShelfDepth, SolShelfHeight], true);
        
            // Solenoid rear Retainer
            translate([x_Box/2 - Wall - x_Sol - x_SolRet/2, SolYPosition + SolShelfDepth/2,Wall + SolRetHeight/2]) cube([x_SolRet, SolShelfDepth, SolRetHeight], true);

            // Solenoid Shelf Front
            translate([x_Box/2 - Wall - x_Sol/2, SolYPosition + y_SolBody - SolShelfDepth/2, Wall + SolShelfHeight/2]) cube([x_Sol, SolShelfDepth, SolShelfHeight], true);

            // Solenoid Front Retainer1
            translate([x_Box/2 - Wall - x_Sol - x_SolRet/2 + SolRetOffsetX, SolYPosition + y_SolBody + x_SolRet/2,Wall + SolRetHeight/2]) cube([x_SolRet , x_SolRet, SolRetHeight], true);
        
            // Solenoid Front Retainer2
            translate([x_Box/2 - Wall - x_Sol - x_SolRet/2, SolYPosition + y_SolBody - SolShelfDepth/2, Wall + SolRetHeight/2]) cube([x_SolRet, SolShelfDepth, SolRetHeight], true);
        
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
        
        translate([-x_Box/2+2*Wall,-y_Box/2+2*Wall,0])cylinder(r=r_M3_nut+tol,h=h_M3_nut,$fn=6);
        translate([-x_Box/2+2*Wall,y_Box/2-2*Wall,0])cylinder(r=r_M3_nut+tol,h=h_M3_nut,$fn=6);
        translate([x_Box/2-2*Wall,-y_Box/2+2*Wall,0])cylinder(r=r_M3_nut+tol,h=h_M3_nut,$fn=6);
        translate([x_Box/2-2*Wall,y_Box/2-2*Wall,0])cylinder(r=r_M3_nut+tol,h=h_M3_nut,$fn=6);
        
        PCB();
    }
}

module Screw(){
    difference(){
        union(){
            translate([-x_Box/2+2*Wall,-y_Box/2+2*Wall,h_M3_nut])cylinder(r=r_M3+Wall/2,h=z_Box-h_M3_nut,$fn=Smoothness);
            translate([-x_Box/2+2*Wall,y_Box/2-2*Wall,h_M3_nut])cylinder(r=r_M3+Wall/2,h=z_Box-h_M3_nut,$fn=Smoothness);
            translate([x_Box/2-2*Wall,-y_Box/2+2*Wall,h_M3_nut])cylinder(r=r_M3+Wall/2,h=z_Box-h_M3_nut,$fn=Smoothness);
            translate([x_Box/2-2*Wall,y_Box/2-2*Wall,h_M3_nut])cylinder(r=r_M3+Wall/2,h=z_Box-h_M3_nut,$fn=Smoothness);
            translate([-x_Box/2+2*Wall,-y_Box/2+2*Wall,Wall])cylinder(r1=r_M3+Wall,r2=r_M3+Wall/2,h=4*Wall,$fn=Smoothness);
            translate([-x_Box/2+2*Wall,y_Box/2-2*Wall,Wall])cylinder(r1=r_M3+Wall,r2=r_M3+Wall/2,h=4*Wall,$fn=Smoothness);
            translate([x_Box/2-2*Wall,-y_Box/2+2*Wall,Wall])cylinder(r1=r_M3+Wall,r2=r_M3+Wall/2,h=4*Wall,$fn=Smoothness);
            translate([x_Box/2-2*Wall,y_Box/2-2*Wall,Wall])cylinder(r1=r_M3+Wall,r2=r_M3+Wall/2,h=4*Wall,$fn=Smoothness);
        }
        
        translate([-x_Box/2+2*Wall,-y_Box/2+2*Wall,0])cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
        translate([-x_Box/2+2*Wall,y_Box/2-2*Wall,0])cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
        translate([x_Box/2-2*Wall,-y_Box/2+2*Wall,0])cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
        translate([x_Box/2-2*Wall,y_Box/2-2*Wall,0])cylinder(r=r_M3+tol,h=z_Box,$fn=Smoothness);
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
    color([1,0,1])translate([15.1-5,-39,Wall+h_Screw])cube([x_PCB+2*tol+5,y_PCB+10*tol,z_PCB+5*tol]);
}
if (PCB==10)PCB();
    



