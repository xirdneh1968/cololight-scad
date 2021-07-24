/* 
Cololight like hexagon lights
*/

include <cololight_tribute_header.scad>

/*
hexagonal light housing
*/

color("grey") 
group() {
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
                linear_extrude(height = diffuser_thickness, center = true, convexity = 10, twist = 0){
                    circle(r=hex_incir_rad-(edge_thickness-diffuser_lip_width), $fn=6);
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
}

/*
another housing tranlsated in space to show clip interaction
*/

translate([0,hex_short_d,0]){
color("grey", 0.5) 
group() {
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
                linear_extrude(height = diffuser_thickness, center = true, convexity = 10, twist = 0){
                    circle(r=hex_incir_rad-(edge_thickness-diffuser_lip_width), $fn=6);
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
}
}
/*
translate([0,hex_short_d/2,+30.5]){
    cube( size=[clip_width,clip_length,clip_height], center=true);
}
*/

    
/* 
clip definition
*/
    
// uncomment following and curly to move into place
//translate([0,hex_short_d/2,-11.75]){
translate([0,hex_short_d/2,-17.75]){
color("grey")
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
}

/*
diffuser definition
*/
rotate([180,0,0]){
translate([0,-hex_short_d,-35]){
color("white")
    
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
}