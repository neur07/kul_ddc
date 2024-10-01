# Digital Design Concepts - Lab 1

## Half-adder

### Code

```verilog
module half_adder(
    input wire iA, iB,
    output wire oSum, oCarry
);

// Half-adder logic
assign oSum = iA ^ iB;    // XOR gate for Sum
assign oCarry = iA & iB;  // AND gate for Carry

endmodule
```

### TestBench

```verilog
module half_adder_TB(
    reg r_iA, r_iB,
    wire w_oSum, w_oCarry
)

half_adder half_adder_inst(
    .iA(r_iA), .iB(r_iB), .oSum(w_oSum), .oCarry(w_oCarry)
);

initial
begin

r_iA = 0; r_iB = 0;
# 50;
if(w_oSum = 0 && w_oCarry = 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 0; r_iB = 1;
# 50;
if(w_oSum = 1 && w_oCarry = 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 1; r_iB = 0;
# 50;
if(w_oSum = 1 && w_oCarry = 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 1; r_iB = 1;
# 50;
if(w_oSum = 0 && w_oCarry = 1) $display("Test passed!!");
else $display("Test failed!!");

end
```

## Full-adder

### Code

```verilog
module full_adder(
    input wire iA, iB, iCarry,
    output wire oSum, oCarry
);

// Full-adder logic
assign oSum = iA ^ iB ^ iCarry;
assign oCarry = (iA & iB) | (iCarry & (iA ^ iB));

endmodule
```

### TestBench

```verilog
module full_adder_TB(
    reg r_iA, r_iB, r_iCarry
    wire w_oSum, w_oCarry
)

full_adder full_adder_inst(
    .iA(r_iA), .iB(r_iB), .iCarry(r_iCarry), .oSum(w_oSum), .oCarry(w_oCarry)
);

initial
begin

r_iA = 0; r_iB = 0; r_iCarry = 0;
# 50;
if(w_oSum = 0 && w_oCarry = 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 0; r_iB = 1; r_iCarry = 0;
# 50;
if(w_oSum = 1 && w_oCarry = 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 1; r_iB = 0; r_iCarry = 0;
# 50;
if(w_oSum = 1 && w_oCarry = 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 1; r_iB = 1; r_iCarry = 0;
# 50;
if(w_oSum = 0 && w_oCarry = 1) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 0; r_iB = 0; r_iCarry = 1;
# 50;
if(w_oSum = 1 && w_oCarry = 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 0; r_iB = 1; r_iCarry = 1;
# 50;
if(w_oSum = 0 && w_oCarry = 1) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 1; r_iB = 0; r_iCarry = 1;
# 50;
if(w_oSum = 0 && w_oCarry = 1) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 1; r_iB = 1; r_iCarry = 1;
# 50;
if(w_oSum = 1 && w_oCarry = 1) $display("Test passed!!");
else $display("Test failed!!");

end
```

## Ripple Carry-adder

### Code

```verilog
module half_adder(
    input wire iA, iB,
    output wire oSum, oCarry
);

// Half-adder logic
assign oSum = iA ^ iB;
assign oCarry = iA & iB;

endmodule
```
