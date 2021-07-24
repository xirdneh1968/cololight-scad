/* 
Cololight like hexagon lights
*/

include <cololight_tribute_header.scad>

/*
hex_height=25;
hex_lon_d=86;
hex_short_d=74.478;
hex_incir_rad=43;
diffuser_thickness=2;
base_thickness=1;
edge_thickness=2;
pin_header_width=8;
pin_header_height=2.5;
clip_mouth_width=12;
clip_mouth_length=6.5;
clip_edge_offset=4.3;

clip_width=12;
clip_length=(2*clip_mouth_length)+(2*edge_thickness);
clip_height=8+base_thickness;
*/

/*
hexagonal light housing
*/

difference() {
    
    difference() {
    
        difference() {
            linear_extrude(height = hex_height, center = true, convexity = 10, twist = 0){
            circle(r=hex_incir_rad, $fn=6);
            }
            translate([0,0,base_thickness]){
                linear_extrude(height = hex_height, center = true, convexity = 10, twist = 0){
                    circle(r=hex_incir_rad-edge_thickness, $fn=6);
                }
            }
        }
        
        translate([0,0,(hex_height/2)]){
            linear_extrude(height = diffuser_thickness-(edge_thickness-diffuser_lip_width), center = true, convexity = 10, twist = 0){
                circle(r=hex_incir_rad-1, $fn=6);
            }
        }
    }
    
    
    for(a=[0:1:5]){
        rotate([0,0,a*60]) translate([0,hex_incir_rad-clip_mouth_length-clip_edge_offset
    ,0]) {
            cube( size=[clip_mouth_width,clip_mouth_length,hex_height*2], center=true);
        }    
    }    


    
}