/* 
Cololight like hexagon lights
*/

// include <cololight_tribute_header.scad>

/* 
variable definitions
*/

hex_height=25;
hex_lon_d=86;
hex_short_d=74.478;
hex_incir_rad=43;
hex_lip_depth=1;
diffuser_thickness=2;
diffuser_lip_width=0;
diffuser_edge_thickness=1;
diffuser_clip_thickness=4;
diffuser_clip_wall_thickness=1;
base_thickness=1;
edge_thickness=2;
pin_header_width=8;
pin_header_height=2.5;
clip_mouth_width=14;
clip_mouth_length=6.5;
clip_edge_offset=4.3;
clip_height_constant=8;
//clip_width=22;
clip_length=(2*clip_mouth_length)+(2*edge_thickness);
clip_height=clip_height_constant+base_thickness;


 /*
hexagonal light housing
*/

module hex_light_module(module_height=hex_height, module_radius=hex_incir_rad, module_color="yellow", module_edge_thickness=edge_thickness, module_base_thickness=base_thickness, module_diffuser_thickness=diffuser_thickness, module_diffuser_lip_width=diffuser_lip_width, module_clip_mouth_width=clip_mouth_width, module_clip_mouth_length=clip_mouth_length, module_clip_edge_offset=clip_edge_offset, module_short_d=hex_short_d) {
    
    color(module_color)
   
    difference() {
        
        difference() {
        
            difference() {
                linear_extrude(height = module_height, center = true, convexity = 10, twist = 0){
                circle(r=module_radius, $fn=6);
                }
                translate([0,0,module_base_thickness]){
                    linear_extrude(height = module_height, center = true, convexity = 10, twist = 0){
                        circle(r=module_radius-module_edge_thickness, $fn=6);
                    }
                }
            }
            
            translate([0,0,(module_height/2)]){
                linear_extrude(height = module_diffuser_thickness-(module_edge_thickness-module_diffuser_lip_width), center = true, convexity = 10, twist = 0){
                    circle(r=module_radius-1, $fn=6);
                }
            }
        }
         
       
        for(a=[0:1:5]){
            rotate([0,0,a*60]) translate([0,module_radius-module_clip_mouth_length-module_clip_edge_offset
        ,0]) {
                cube( size=[module_clip_mouth_width, module_clip_mouth_length, module_height*2], center=true);
            }    
        }    
       

        
    }
}

/*
diffuser definition
*/

module diffuser_module(module_height=hex_height, module_radius=hex_incir_rad, diffuser_color="white", module_edge_thickness=edge_thickness, module_base_thickness=base_thickness, module_diffuser_thickness=diffuser_thickness, module_diffuser_lip_width=diffuser_lip_width, module_clip_mouth_width=clip_mouth_width, module_clip_mouth_length=clip_mouth_length, module_clip_edge_offset=clip_edge_offset) {
    
    color(diffuser_color)
    group() {
        difference() {
        
            color("green")
            linear_extrude(height = diffuser_thickness, center = false, convexity = 10, twist = 0){
                circle(r=hex_incir_rad, $fn=6);
            }
        
        /* 
        diffuser cutting tool definition
        */
            
        translate([0,0,diffuser_edge_thickness]){
            group(){
              
                difference(){
                    color("blue")
                    linear_extrude(height = diffuser_thickness*2, center = false, convexity = 10, twist = 0){
                        circle(r=hex_incir_rad, $fn=6);
                    }
                    color("red")
                    linear_extrude(height = diffuser_thickness*2, center = false, convexity = 10, twist = 0){
                        circle(r=hex_incir_rad-(edge_thickness-diffuser_lip_width), $fn=6);
                    }
                }
            }
        }   
          
        
        }
    }
}

/*
cololight tribute hexagonal light clip
*/

module clip_module(module_height=hex_height, module_radius=hex_incir_rad, clip_color="white", module_edge_thickness=edge_thickness, module_base_thickness=base_thickness, module_diffuser_thickness=diffuser_thickness, module_diffuser_lip_width=diffuser_lip_width, module_clip_mouth_width=clip_mouth_width, module_clip_mouth_length=clip_mouth_length, module_clip_edge_offset=clip_edge_offset) {
    
    color(clip_color)
    group() {
        difference(){
            difference(){
                cube( size=[clip_mouth_width,clip_length,clip_height], center=true);
    
                translate([0,0,edge_thickness]){
                    cube( size=[clip_mouth_width-module_edge_thickness,clip_length-module_edge_thickness,clip_height], center=true);
                }
            }
            
            translate([0,0,base_thickness+pin_header_height]){
                cube( size=[clip_mouth_width+2,edge_thickness*2,clip_height], center=true);
                }
                }
                
    }
}

hex_light_module(module_color="green");
for(a=[0:1:5]){
    rotate([0,0,a*60]) translate([0,hex_short_d,0]) {
        hex_light_module(module_color=[1,0,0,.5]);
    }
}
translate([0,0,25])
rotate([180,0,0])
diffuser_module(diffuser_color=[0,0,1,.5]);
translate([0,0,-((hex_height/2)+5)])
for(a=[0:1:5]){
            rotate([0,0,a*60]) translate([0,hex_short_d/2,0]) {
    clip_module(clip_color=[0.1,0.1,0.1,.5]);
        }
    }