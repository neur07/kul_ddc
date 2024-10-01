`timescale 1ns / 1ps

module half_adder_tb;
reg r_iA, r_iB;
wire w_oSum, w_oCarry;

half_adder half_adder_inst
( .iA(r_iA), .iB(r_iB), .oSum(w_oSum), .oCarry(w_oCarry) );

initial 
begin

//test vector 1
r_iA = 0; r_iB = 0;
# 50;
if(w_oCarry != 0 && w_oSum != 0) $display("test vector 1 failed"); 
else                            $display("test vector 1 passed");
//test vector 2
r_iA = 0; r_iB = 1;
# 50;
if(w_oCarry != 0 && w_oSum != 1) $display("test vector 2 failed"); 
else                            $display("test vector 2 passed");
//test vector 3
r_iA = 1; r_iB = 0;
# 50;
if(w_oCarry != 0 && w_oSum != 1) $display("test vector 3 failed"); 
else                            $display("test vector 3 passed");
//test vector 4
r_iA = 1; r_iB = 1;
# 50;
if(w_oCarry != 1 && w_oSum != 1) $display("test vector 4 failed"); 
else                            $display("test vector 4 passed");

$stop;

end
   
endmodule
