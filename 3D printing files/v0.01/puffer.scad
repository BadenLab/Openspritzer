use <GoodBox.scad>;
tol = 0.2;

//Regulator- these are measurements taken from the regulator
RegHeight = 50.1;
RegWidth = 50.1;
RegLength = 52.75;
RegKnobDiam = 35.8 + tol;//35.7;
AirHoseInDiameter = 13.3 + tol;
AirHoseInYOffset = (36.95 + 48.05)/2 + .4;
AirHoseOutDiameter = 10.3 + tol;
//AirHoseOutYOffset = (15.78 + 5.72)/2; // (this one is port 1)
AirHoseOutYOffset = (13.49 + 19.18)/2; // (this one is port 2)
GaugeDiameter = 9.8 + tol;
GaugeYOffset = (13.2 + 22.72)/2 +.3;
CollarHeight = 9;

//solenoid - measurements taken from the solenoid.
SolLength=88.6;
SolBodyLength = 73.2;
SolWidth = 32.5;
SolHeight = 10.1;
SolRetWidth = 4;
SolRetOffsetX = 6.5;//5;
SolShelfDepth = 4;

// basic box params - size of the box and screw holes. Smoothness of corners etc.
Thickness = 1.5;
CornerR = 4;
XLen = 110; //external sizes
YLen = SolLength + 2*Thickness + 2*CornerR;
ZLen = RegHeight + Thickness;
Smoothness = 60;
HeadR = 2; 
HeadD = Thickness;
NutD =  ZLen/2;
NutR =  7/2; //6.5/2 too small;  //5 wayyy to big.
ScrewR = 1.6;
ScrewD = ZLen;

// control where lid appears relative to box. Probably best to leave as is because
// holes might not move in same way as lid.
LidOffset = 50;
SideBySide= false;
Centering= true;

// switch on lid and box independently.
Lid = false;
Box = true;

// sol derived quantities
SolYPosition = -YLen/2 + 2*CornerR;
SolShelfHeight  = ZLen - Thickness - 2 * SolHeight;
SolRetHeight = SolShelfHeight + SolHeight;

//Circuit board position and screw stand offs.
BoardYPosition = SolYPosition + SolShelfDepth + 2;
BoardEdgeX = 4.2;
BoardEdgeY = 4.2;
MountPointWidth = 38;//(36.34 + 38.5)/2;//(37.29 + 39.10)/2;
MountPointLength = (48.93 + 51.2)/2;//(54.82 + 56.78)/2;
MountPointHeight = 5;
MountPointInnerDiameter = 1.5;
MountPointOuterDiameter = 4;


// spacing betweeen holes
HoleSpacing = 7; // side panel
HoleSpacingFront = (XLen - Thickness - RegWidth/2 - RegKnobDiam/2)/3; // front panel

// Define cable hole sizes
USBHeight = 3.8 + tol;
USBWidth = 7.6 + tol;
USBWidth2 = 6.5 + tol;
BNCDiam = 9.3 + tol;
BNCFlatDiam = 8 + tol;
BNCFlatbitOffset = BNCDiam - BNCFlatDiam;
PotDiam = 9.8 + tol;
PotFlatDiam = 8.72 + tol;
PotFlatbitOffset = BNCDiam - BNCFlatDiam;
ToggleSwitchDiam = 6.1 + tol;
TogSwitchWidth = 11.5 + tol;
TogSwitchHeight = 12.8 + tol;

PowerJackWidth = 8.9 + tol;  //9
PowerJackHeight = 11.15 + tol; //11.25
PowerJackSupportDepth = 8.3 - Thickness;
PowerJackSupportHoleDiam = 2.1 + tol;
FootSwitchHoleDiam = 5.8 + tol;
LEDDiameter = 4.4 + tol;

// determine the position of the cables on the size panel.

// Z-Y offset of the USB hole from it's position relative to the circuit board.
USBYOffset = 22.31;//(11.62 + 13.74 + 26.87 + 29.01)/4//  (18.99 + 9.64)/2;//(18.99 + 9.64)/2; //measured from the mount point nearest arduino. controls the Y position of the four cable holes on the side panel.
USBZOffset = 17.2; // was (18.01 + 14.01)/2 // controls Z position of four cable holes on the size panel

// Y position of the center of the USB socket including its offset and position relative to circuit board
USBYPosition = BoardYPosition + BoardEdgeY + MountPointLength - USBYOffset + USBWidth/2;

// the position of the other cable holes in the side panel relative to the USB socket
BNCYPosition = USBYPosition + USBWidth/2 + HoleSpacing + BNCDiam/2;
PowerJackYPosition = SolYPosition + SolBodyLength + PowerJackWidth/2; 
FootswitchYPosition = USBYPosition - USBWidth/2 - HoleSpacing - BNCDiam/2;


//Regulator Y Position
RegYPosition = YLen/2 - 6.8;
RegSpacerDepth = YLen/2 - RegYPosition;
RegSpacerWidth = 6;

// call the function build the box
PicoSpritz();

// first the bits to add, then the bits to subtract.
module PicoSpritz()
{
    difference(){
        PicoSpritz_add();
        PicoSpritz_sub();
    }
      
}

// all the components to add
module PicoSpritz_add() {

    // Set up the basic good box
    GoodBox(XLen, YLen, ZLen, Thickness, CornerR, Smoothness, HeadR, HeadD, NutR, NutD, ScrewR, ScrewD, LidOffset, SideBySide, Centering, Lid, Box);
    
    if (Box==true) {
        // Regulator Spacer
        translate([-XLen/2 + Thickness + RegWidth, RegYPosition + RegSpacerDepth/2, Thickness/2]) cube([RegSpacerWidth, RegSpacerDepth, ZLen - Thickness], true);

        // Solenoid Shelf Back
        translate([XLen/2 - Thickness - SolWidth/2, SolYPosition + SolShelfDepth/2, -ZLen/2 + Thickness + SolShelfHeight/2]) cube([SolWidth, SolShelfDepth, SolShelfHeight], true);
        
        // Solenoid rear Retainer
        translate([XLen/2 - Thickness - SolWidth - SolRetWidth/2, SolYPosition + SolShelfDepth/2, -ZLen/2 + Thickness + SolRetHeight/2]) cube([SolRetWidth, SolShelfDepth, SolRetHeight], true);

        // Solenoid Shelf Front
        translate([XLen/2 - Thickness - SolWidth/2, SolYPosition + SolBodyLength - SolShelfDepth/2, -ZLen/2 + Thickness + SolShelfHeight/2]) cube([SolWidth, SolShelfDepth, SolShelfHeight], true);

        // Solenoid Front Retainer1
        translate([XLen/2 - Thickness - SolWidth - SolRetWidth/2 + SolRetOffsetX, SolYPosition + SolBodyLength + SolRetWidth/2, -ZLen/2 + Thickness + SolRetHeight/2]) cube([SolRetWidth , SolRetWidth, SolRetHeight], true);
        
        // Solenoid Front Retainer2
        translate([XLen/2 - Thickness - SolWidth - SolRetWidth/2, SolYPosition + SolBodyLength - SolShelfDepth/2, -ZLen/2 + Thickness + SolRetHeight/2]) cube([SolRetWidth, SolShelfDepth, SolRetHeight], true);
        
        // MountingPoints 
        // Rear Right
        translate([XLen/2 - Thickness - BoardEdgeX, BoardYPosition + BoardEdgeY, -ZLen/2 + Thickness + MountPointHeight/2]) cylinder(MountPointHeight, MountPointOuterDiameter/2, MountPointOuterDiameter/2, $fn=Smoothness, true);
        
        // Rear Left
        translate([XLen/2 - Thickness - BoardEdgeX - MountPointWidth, BoardYPosition + BoardEdgeY, -ZLen/2 + Thickness + MountPointHeight/2]) cylinder(MountPointHeight, MountPointOuterDiameter/2, MountPointOuterDiameter/2, $fn=Smoothness, true);

        // Front Right
        translate([XLen/2 - Thickness - BoardEdgeX, BoardYPosition + BoardEdgeY + MountPointLength, -ZLen/2 + Thickness + MountPointHeight/2]) cylinder(MountPointHeight, MountPointOuterDiameter/2, MountPointOuterDiameter/2, $fn=Smoothness, true);

        // Front Left
        translate([XLen/2 - Thickness - BoardEdgeX - MountPointWidth, BoardYPosition + BoardEdgeY + MountPointLength, -ZLen/2 + Thickness + MountPointHeight/2]) cylinder(MountPointHeight, MountPointOuterDiameter/2, MountPointOuterDiameter/2, $fn=Smoothness, true);

        // Power Jack Support vertical
        translate([XLen/2 - Thickness/2 - PowerJackSupportDepth/2, PowerJackYPosition - PowerJackWidth/2 - Thickness/2, -ZLen/2 + Thickness + MountPointHeight + USBZOffset ] ) 
        cube([PowerJackSupportDepth, Thickness, PowerJackHeight], true);
        
        // Power Jack Support Horiz
        translate([XLen/2 - Thickness/2 - PowerJackSupportDepth/2, PowerJackYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset - PowerJackHeight/2 - Thickness/2] ) 
        cube([PowerJackSupportDepth, PowerJackWidth, Thickness], true);
    }
    
    if (Lid==true) {
        // Lid Blocks for solenoid
        translate([XLen/2 - Thickness - SolWidth/2, SolYPosition + SolShelfDepth/2, LidOffset - SolHeight/2 - Thickness/2]) cube([SolWidth, SolShelfDepth, SolHeight], true);

        translate([XLen/2 - Thickness - SolWidth/2, SolYPosition + 3*SolBodyLength/4 - SolShelfDepth/2, LidOffset - SolHeight/2 - Thickness/2]) cube([SolWidth, SolShelfDepth, SolHeight], true);
    }        
}

// all the holes
module PicoSpritz_sub() {
    
    // Solenoid Lid Block trimming to allow Sol Retainer
    //translate([XLen/2 - Thickness - SolWidth - SolRetWidth/2 + SolRetOffsetX, SolYPosition + SolBodyLength + SolRetWidth/2, LidOffset - SolRetHeight/2 - Thickness/2]) cube([SolRetWidth , SolRetWidth, SolRetHeight], true);
    
    // Regulator Hole
    translate([-XLen/2 + Thickness + RegWidth/2, YLen/2 - Thickness/2, -ZLen/2 + Thickness + RegHeight/2])
    rotate(90, [1, 0, 0])
    cylinder(2*CollarHeight, RegKnobDiam/2, RegKnobDiam/2, $fn=Smoothness, true);
    
    // Regulator Block Simulator (Remove Space Size of Regulator.  Purpose is to chops off Corner to right depth...
    translate([-XLen/2 + Thickness + RegWidth/2, RegYPosition - RegLength/2, -ZLen/2 + Thickness + RegHeight/2])
    cube([RegWidth, RegLength, RegHeight], true );
    
    // Gauge Hole
    translate([-XLen/2 + Thickness + RegWidth/2, RegYPosition - GaugeYOffset, LidOffset] ) cylinder(Thickness, GaugeDiameter/2, GaugeDiameter/2, $fn=Smoothness, true);
    
    // LED Hole    
    translate([+XLen/2 - Thickness - RegWidth/2, RegYPosition - GaugeYOffset, LidOffset] ) cylinder(Thickness, LEDDiameter/2, LEDDiameter/2, $fn=Smoothness, true);

    // Input Airhose Hole
    translate([-XLen/2 + Thickness/2, RegYPosition - AirHoseInYOffset, -ZLen/2 + Thickness + RegHeight/2] ) 
    rotate(90,[0,1,0])
    cylinder(2*Thickness, AirHoseInDiameter/2, AirHoseInDiameter/2, $fn=Smoothness, true);


    // Potentiometer
    difference() {
        // POT Main Hole
        translate([-XLen/2 + Thickness + RegWidth/2 + RegKnobDiam/2 + HoleSpacingFront, YLen/2 - Thickness/2, -ZLen/2 + Thickness + RegHeight/2])
        rotate(90, [1, 0, 0])
        cylinder(Thickness+1, PotDiam/2, PotDiam/2, $fn=Smoothness, true);

        // Pot flat bit
        translate([-XLen/2 + Thickness + RegWidth/2 + RegKnobDiam/2 + HoleSpacingFront + PotDiam/2 + PotDiam/8 - PotFlatbitOffset/2, YLen/2 - Thickness/2, -ZLen/2 + Thickness + RegHeight/2])
        cube([PotDiam/4, Thickness, PotDiam], $fn=Smoothness, true);    

        // Pot flat bit
        translate([-XLen/2 + Thickness + RegWidth/2 + RegKnobDiam/2 + HoleSpacingFront - PotDiam/2 - PotDiam/8 + PotFlatbitOffset/2, YLen/2 - Thickness/2, -ZLen/2 + Thickness + RegHeight/2])
        cube([PotDiam/4, Thickness, PotDiam], $fn=Smoothness, true);    
    }

    // toggle switch
    translate([-XLen/2 + Thickness + RegWidth/2 + RegKnobDiam/2 + HoleSpacingFront + HoleSpacingFront, YLen/2 - Thickness/2, -ZLen/2 + Thickness + RegHeight/2])
        rotate(90, [1, 0, 0])
        cylinder(Thickness, ToggleSwitchDiam/2, ToggleSwitchDiam/2, $fn=Smoothness, true);

    // cube to allow switch to be installed. Y position solenoid shelf front.
    translate([-XLen/2 + Thickness + RegWidth/2 + RegKnobDiam/2 + HoleSpacingFront + HoleSpacingFront - TogSwitchWidth/2, SolYPosition + SolBodyLength - SolShelfDepth, -ZLen/2 + Thickness + RegHeight/2 - TogSwitchHeight/2])
        cube(TogSwitchWidth, SolShelfDepth, TogSwitchHeight, $fn=Smoothness, true);



    // powerJackHole
    translate([XLen/2 - Thickness/2, PowerJackYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset ] ) 
    cube([2*Thickness, PowerJackWidth, PowerJackHeight], true);

    // BNC TTL Switch 
    difference() {
        // BNC switch hole
        translate([XLen/2 - Thickness/2, BNCYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset])
        rotate(90, [0, 1, 0])
        cylinder(Thickness + 1, BNCDiam/2, BNCDiam/2, $fn=Smoothness, true);
        
        // BNC flat bit
        translate([XLen/2 - Thickness/2, BNCYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset + BNCDiam/2 + BNCDiam/8 - BNCFlatbitOffset/2])
        cube([Thickness, BNCDiam,  BNCDiam/4], $fn=Smoothness, true);    

        // BNC flat bit
        translate([XLen/2 - Thickness/2, BNCYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset - BNCDiam/2 - BNCDiam/8 + BNCFlatbitOffset/2])
        cube([Thickness, BNCDiam, BNCDiam/4], $fn=Smoothness, true);        
    }    
    
    // miniUSB Hole
    translate([XLen/2 - Thickness/2, USBYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset + USBHeight/4] ) 
    cube([Thickness, USBWidth, USBHeight/2], true);
    translate([XLen/2 - Thickness/2, USBYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset - USBHeight/4] ) 
    cube([Thickness, USBWidth2, USBHeight/2], true);

    // powerJackHole
    translate([XLen/2 - Thickness/2, PowerJackYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset ] ) 
    cube([2*Thickness, PowerJackWidth, PowerJackHeight], true);

    // Power Jack Support Horiz Hole
    translate([XLen/2 - Thickness/2 - PowerJackSupportDepth/2, PowerJackYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset - PowerJackHeight/2 - Thickness/2] ) 
    cylinder(Thickness, PowerJackSupportHoleDiam/2, PowerJackSupportHoleDiam/2, $fn = Smoothness, true);

    // Output Airhose hole
    translate([XLen/2 - Thickness/2, SolYPosition + AirHoseOutYOffset, -ZLen/2 + Thickness + SolShelfHeight + SolHeight/2] ) 
    rotate(90,[0,1,0])
    cylinder(2*Thickness, AirHoseOutDiameter/2, AirHoseOutDiameter/2, $fn=Smoothness, true);

    //Footswitch BNC
    difference() {
        // BNC switch hole
        translate([XLen/2 - Thickness/2, FootswitchYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset])
        rotate(90, [0, 1, 0])
        cylinder(Thickness + 1, BNCDiam/2, BNCDiam/2, $fn=Smoothness, true);
        
        // BNC flat bit
        translate([XLen/2 - Thickness/2, FootswitchYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset + BNCDiam/2 + BNCDiam/8 - BNCFlatbitOffset/2])
        cube([Thickness, BNCDiam,  BNCDiam/4], $fn=Smoothness, true);    

        // BNC flat bit
        translate([XLen/2 - Thickness/2, FootswitchYPosition, -ZLen/2 + Thickness + MountPointHeight + USBZOffset - BNCDiam/2 - BNCDiam/8 + BNCFlatbitOffset/2])
        cube([Thickness, BNCDiam, BNCDiam/4], $fn=Smoothness, true);        
    }    


  
   // MountingPoints 
    // Rear Right
    translate([XLen/2 - Thickness - BoardEdgeX, BoardYPosition + BoardEdgeY, -ZLen/2 + Thickness + MountPointHeight/2]) cylinder(MountPointHeight, MountPointInnerDiameter/2, MountPointInnerDiameter/2, $fn=Smoothness, true);
    
    // Rear Left
    translate([XLen/2 - Thickness - BoardEdgeX - MountPointWidth, BoardYPosition + BoardEdgeY, -ZLen/2 + Thickness + MountPointHeight/2]) cylinder(MountPointHeight, MountPointInnerDiameter/2, MountPointInnerDiameter/2, $fn=Smoothness, true);

    // Front Right
    translate([XLen/2 - Thickness - BoardEdgeX, BoardYPosition + BoardEdgeY + MountPointLength, -ZLen/2 + Thickness + MountPointHeight/2]) cylinder(MountPointHeight, MountPointInnerDiameter/2, MountPointInnerDiameter/2, $fn=Smoothness, true);

    // Front Left
    translate([XLen/2 - Thickness - BoardEdgeX - MountPointWidth, BoardYPosition + BoardEdgeY + MountPointLength, -ZLen/2 + Thickness + MountPointHeight/2]) cylinder(MountPointHeight, MountPointInnerDiameter/2, MountPointInnerDiameter/2, $fn=Smoothness, true);    

}
