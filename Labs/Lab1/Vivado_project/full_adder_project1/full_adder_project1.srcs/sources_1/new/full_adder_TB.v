`timescale 1ns / 1ps

module full_adder_TB;
    reg r_iA, r_iB, r_iCarry;
    wire w_oSum, w_oCarry;


full_adder full_adder_inst
   ( .iA(r_iA), .iB(r_iB), .iCarry(r_iCarry), .oSum(w_oSum), .oCarry(w_oCarry) );
initial
begin

//test vector 1
r_iA = 0; r_iB = 0; r_iCarry = 0;
# 50;
if(w_oSum == 0 && w_oCarry == 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 0; r_iB = 1; r_iCarry = 0;
# 50;
if(w_oSum == 1 && w_oCarry == 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 1; r_iB = 0; r_iCarry = 0;
# 50;
if(w_oSum == 1 && w_oCarry == 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 1; r_iB = 1; r_iCarry = 0;
# 50;
if(w_oSum == 0 && w_oCarry == 1) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 0; r_iB = 0; r_iCarry = 1;
# 50;
if(w_oSum == 1 && w_oCarry == 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 0; r_iB = 1; r_iCarry = 1;
# 50;
if(w_oSum == 0 && w_oCarry == 1) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 1; r_iB = 0; r_iCarry = 1;
# 50;
if(w_oSum == 0 && w_oCarry == 1) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 1; r_iB = 1; r_iCarry = 1;
# 50;
if(w_oSum == 1 && w_oCarry == 1) $display("Test passed!!");
else $display("Test failed!!");

$stop;

end

endmodule