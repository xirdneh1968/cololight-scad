/*
cololight tribute hexagonal light clip
*/

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
clip definition
*/
    

//translate([0,hex_short_d/2,-11.75]){
group() {
    difference(){
        difference(){
            cube( size=[clip_width,clip_length,clip_height], center=true);

            translate([0,0,edge_thickness]){
                cube( size=[clip_width-edge_thickness,clip_length-edge_thickness,clip_height], center=true);
            }
        }
        
        translate([0,0,base_thickness+pin_header_height]){
            cube( size=[clip_width+2,edge_thickness*2,clip_height], center=true);
            }
            }
            
}
//}