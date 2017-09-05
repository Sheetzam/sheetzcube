$fn=100;
fudge = -0.05;
rod_radius=4;
mirror([0,0,0]){
    difference(){
        translate([-10,-9,-10]){
            minkowski(){
                cube([26,18,18]);
                sphere(1);
            }
            pulley_mount_top();
            pulley_mount_bottom();
            motor_mount_bottom();
        }
        horizontal_rod();
        smooth_rod();
//        motor_mount_screw_hole();
    }
}
module horizontal_rod(){
    translate([0,0,-8]){
        color("blue",1)cube([1,30,10],true);
    }
    translate([0,-30,0]){
        rotate([-90,0,0]){
            color("blue",1)cylinder(h=60, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
}
module smooth_rod(){
    translate([rod_radius+5,0,-rod_radius+4]){
        rotate([180,0,0]){
            translate([0,-0.5,0])color("green",1)cube([30,1,30]);
            color("green",1)cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
}
module pulley_mount_top(){
    translate([0,4,-15]){
        difference(){
            cube([9,10,15]);
            translate([-0.5,2.5,-0.5]){
                cube([11,5,16]);
            }
            rotate([90,0,0])
                translate([4.5,4.5,-11])
                    cylinder(h=22,r=1.4);
        }
    }
}
module pulley_mount_bottom(){
    translate([-15,4,0]){
        difference(){
            cube([15,10,19]);
            translate([-0.5,2.5,-0.5]){
                cube([20,5,20]);
            }
            rotate([90,0,0])
                translate([4.5,4.5,-11])
                    cylinder(h=22,r=1.4);
        }
    }
}
module motor_mount_bottom(){
    translate([-60,18,0]){
        difference(){
            union(){
                cube([65,2,19]);
                translate([0,-18,0]){
                    cube([8,18,19]);
                }
                translate([33,-18,0]){
                    cube([8,18,19]);
                }
                translate([0,-20,9]){
                    cube([65,2,10]);
                }
            }
            rotate([90,0,0]){
                translate([20,12,-22]){
                    cylinder(h=40,r=6);
                }
            }
            rotate([0,90,0]){
                translate([-12,-9,-22]){
                    cylinder(h=80,r=6);
                }
            }
            rotate([90,0,0]){
                translate([37.2,3,-20]){
                    cylinder(h=21,r=1.4);
                }
            }
            rotate([90,0,0]){
                translate([3.2,3,-10]){
                    cylinder(h=21,r=1.4);
                }
            }
        }
    }
}
//motor_mount_screw_hole();
module motor_mount_screw_hole(){
    rotate([90,0,0]){
        translate([-4.8,-7,-20]){
            cylinder(h=21,r=1.4);
        }
    }
};