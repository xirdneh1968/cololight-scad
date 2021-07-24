include <cololight_tribute_header.scad>

/*
diffuser definition
*/

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
                linear_extrude(height = diffuser_edge_thickness, center = false, convexity = 10, twist = 0){
                    circle(r=hex_incir_rad-(edge_thickness+diffuser_clip_wall_thickness), $fn=6);
                }

            }
        }
    }   
      
    
    }
}

                color("red")
                linear_extrude(height = diffuser_thickness*2, center = false, convexity = 10, twist = 0){
                    circle(r=hex_incir_rad-(edge_thickness-diffuser_lip_width), $fn=6);
                }