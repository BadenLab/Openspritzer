module GoodBox(XLen, YLen, ZLen, Thickness, Corner, Smoothness, HeadR, HeadD, NutR, NutD, ScrewR, ScrewD, LidOffset, SideBySide, Centering, Lid, Box) {

    // set the Lid Position
    LidXPos = SideBySide ? (Centering ? 0 : XLen/2) : (Centering ? 0 : XLen/2) ;
    LidYPos = SideBySide ? (Centering ? LidOffset + YLen : YLen/2 + YLen + LidOffset) : (Centering ? 0 : YLen/2) ;
    LidZPos = SideBySide ? (Centering ? 0 : Thickness/2) : (Centering ? LidOffset : Thickness/2 + LidOffset);

    // set box position
    BaseXPos = Centering ? 0 : XLen/2;
    BaseYPos = Centering ? 0 : YLen/2; 
    BaseZPos = Centering ? 0 : ZLen/2; 

    // produce the goods as requested!
    if (Box==true) {
        translate([BaseXPos, BaseYPos, BaseZPos])
        difference(){
            GoodBoxBase_add(XLen, YLen, ZLen, Thickness, Corner, Smoothness);
            GoodBoxBase_sub(XLen, YLen, Corner, Smoothness, NutR, NutD, ScrewR, ScrewD);
        }
    }
    
    if (Lid==true) {
        translate([LidXPos, LidYPos, LidZPos])
        difference(){
            GoodBoxLid_add(XLen,YLen, Thickness, Corner, Smoothness);
            GoodBoxLid_sub(XLen, YLen, Corner, ScrewR, Thickness, HeadR, HeadD, Smoothness);
        }
    }
}

module GoodBoxBase_add(XLen, YLen, ZLen, Thickness, Corner, Smoothness) {
        BasicBox( XLen,
                  YLen, 
                  ZLen, 
                  Thickness, Corner, Smoothness);

        CornerCylinder(-XLen/2 + Corner, -YLen/2 + Corner, ZLen, Corner, Smoothness);
        CornerCylinder(-XLen/2 + Corner,  YLen/2 - Corner, ZLen, Corner, Smoothness);
        CornerCylinder( XLen/2 - Corner, -YLen/2 + Corner, ZLen, Corner, Smoothness);
        CornerCylinder( XLen/2 - Corner,  YLen/2 - Corner, ZLen, Corner, Smoothness);
}


module GoodBoxBase_sub(XLen, YLen, Corner, Smoothness, NutR, NutD, ScrewR, ScrewD) {
      // Four corner screw holes
        ScrewHoleHex( -XLen/2 + Corner,
                      -YLen/2 + Corner,
                       0,
                       NutR, NutD, ScrewR, ScrewD, Smoothness);

        ScrewHoleHex( -XLen/2 + Corner,
                       YLen/2 - Corner,
                       0,
                       NutR, NutD, ScrewR, ScrewD, Smoothness);

        ScrewHoleHex(  XLen/2 - Corner,
                      -YLen/2 + Corner,
                       0,
                       NutR, NutD, ScrewR, ScrewD, Smoothness);


        ScrewHoleHex(  XLen/2 - Corner,
                       YLen/2 - Corner,
                       0,
                       NutR, NutD, ScrewR, ScrewD, Smoothness);
}

module GoodBoxLid_add(XLen,YLen, ZLen, Corner, Smoothness) {
        minkowski(){
            cube([ XLen - 2 * Corner, 
                   YLen - 2 * Corner, 
                   ZLen/2], true);
            cylinder(ZLen/2, Corner, Corner, true, $fn=Smoothness); 
    }
}

module GoodBoxLid_sub(XLen, YLen, Corner, ScrewR, ScrewD, HeadR, HeadD, Smoothness) {
      // Four corner screw holes
        ScrewHole(-XLen/2 + Corner,
                  -YLen/2 + Corner,
                   0,
                   ScrewR, ScrewD, HeadR, HeadD, Smoothness);

        ScrewHole(-XLen/2 + Corner,
                   YLen/2 - Corner,
                   0,
                   ScrewR, ScrewD, HeadR, HeadD, Smoothness);

        ScrewHole( XLen/2 - Corner,
                  -YLen/2 + Corner,
                   0,
                   ScrewR, ScrewD, HeadR, HeadD, Smoothness);

        ScrewHole( XLen/2 - Corner,
                   YLen/2 - Corner,
                   0,
                   ScrewR, ScrewD, HeadR, HeadD, Smoothness);
}

// x, y and z specify outer dimensions
module BasicBox(x, y, z, thickness, corner, smoothness) {
    translate([corner - x/2, corner - y/2, - z/2])
    difference() {
        $fn=smoothness;
        minkowski(){
            cube( [x-2*corner, y-2*corner, z-thickness], false );
            cylinder( thickness, corner, corner, false);
        }
        
        translate( [thickness, thickness, thickness] ) 
        minkowski(){
            cube( [x - 2*corner - 2*thickness, y - 2*corner - 2*thickness, z-thickness], false);
            cylinder(thickness, corner, corner, false);
        }
    }
}

module CornerCylinder(x, y, ZLen, Corner, Smoothness) {
        translate( [x, y , 0])
        cylinder(ZLen, Corner, Corner, true, $fn=Smoothness);
}

module ScrewHole( x, y, z, screwR, screwD, headR, headD, smoothness ){
    translate( [x, y, z]) 
    cylinder( screwD, screwR, screwR, true, $fn=smoothness );
    translate( [x, y, z + screwD/2 - headD/2]) 
    cylinder( headD, headR, headR, true, $fn=smoothness );
}

module ScrewHoleHex( x, y, z, nutR, nutD, screwR, screwD, smoothness){
    translate( [x, y, z]) 
    cylinder(screwD, screwR, screwR, true, $fn=smoothness);

    translate( [x, y, z - screwD/2 + nutD/2])
    cylinder(nutD, nutR, nutR, true, $fn=6);
}