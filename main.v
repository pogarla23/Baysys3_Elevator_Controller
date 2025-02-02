`timescale 1ns/1ps
 module main(clk, F, Fout);
    input clk;
    input [0:3] F; // call floor 1, call floor 2, call floor 3, blocked opposite
    output reg [0:3] Fout; // at floor1, at floor 2, at floor 3, door_state //oppos
    parameter [0:3]
        F1 =  4'b0000,
        F1O = 4'b0001,
        F1C = 4'b0010,
        F2 =  4'b0011,
        F2O = 4'b0100,
        F2C = 4'b0101,
        F3 =  4'b0110,
        F3O = 4'b0111,
        F3C = 4'b1000,
        F13 = 4'b1001,
        F31 = 4'b1010,
        F2T = 4'b1011;
     reg [0:3] floor_state = F1C, next_state, prev_state; //changed it to 0000
     
     
    always @(posedge clk)
        begin
            floor_state <= next_state;
        end
            
            
     always @(*) begin
        case(floor_state)
        F1:
            begin 
                next_state <= F1O;
            end 
        F1O:
            begin
                casex (F)
                    4'bxxx1: next_state <= F1O; //handels door blocked
                   // 4'b0xx1: // if (door_timer == 0) //maybe make it xxx1
                    
                    default: next_state <= F1C;
                    //default: next_state <= 4'bxxxx;     
                
                endcase
            end
        
        F1C:
            begin
                casex(F)
                    //4'b0000: next_state <= F1C;
                    4'b1xxx: next_state <= F1; //last update was when
                    4'b01xx: next_state <= F2; 
                    4'b0010: next_state <= F13;
                    default: next_state <= F1C;
                endcase
            end
        F2:
            next_state <= F2O; //changed it from 1010 
            
        F2O:
            begin
                casex(F)
                    4'bxxx1: next_state <= F2O;
                    //4'b0010: // if (door_timer == 0)
                    default: next_state <= F2C;
                   // default: next_state <= 4'bxxxx;
                endcase
            end
        F2C:
            begin
                casex(F)
                   // 4'b0000: next_state <= F2C;
                    4'bx1xx: next_state <= F2; 
                    4'b1xxx: next_state <= F1;
                    4'b001x: next_state <= F3;
                    default: next_state <= F2C;
                endcase
            end
        F3:
            begin
            //begin
                //case (F)
                   // 4'bx1xx: 
                    next_state <= F3O;
                    //default: next_state <= 4'bxxxx;
               // endcase
            
            end 
        F3O:
            begin
                casex(F)
                    4'bxxx1: next_state <= F3O;
                    //4'b0100:  //if (door_timer == 0)
                        default:    next_state <= F3C;
                    //default: next_state <= 4'bxxxx;
                endcase
            end
            
            
        F3C:
            begin
                casex(F)
                  //  4'b0000: next_state <= F3C;
                    4'bxx1x: next_state <= F3;
                    4'bx1xx: next_state <= F2;   
                    4'b1000: next_state <= F31;
                    default: next_state <= F3C;
                endcase
            end
        F13: 
            begin 
                next_state <= F3;   //changed from F2T to F2C
                prev_state = 1; //isimilar to f31 add 0001
            end
        F31:  
            begin
                next_state <= F1;
                prev_state = 3; //might want to handle case for 1010 like add it
            end
        F2T:
            begin
                casex(F)
                    4'b1000:
                        begin
                            if (prev_state == 1)
                                next_state <= F1;
                        end
                    4'b0010:
                        begin
                            if (prev_state == 3) 
                            next_state <= F3;
                        end
                endcase
                next_state = 0;
            end
        endcase
     end
     always@(floor_state)
        case(floor_state)
            F1C: Fout = 4'b1000;
            F1O, F1: Fout = 4'b1001;
            F2C : Fout = 4'b0100;
            //F2: Fout = 4'b0010;
            //F2T: Fout = 4'b0100;
            F2O, F2: Fout = 4'b0101;
            F3C: Fout = 4'b0010;
            F3O, F3: Fout = 4'b0011;
            F13, F31: Fout = 4'b0100;
            default: Fout = 4'bxxxx;
        endcase
 endmodule
                
                   
             