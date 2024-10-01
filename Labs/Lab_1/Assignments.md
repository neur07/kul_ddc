# Digital Design Concepts - Lab 1

## Half-adder

### Code

```verilog
module half_adder(
    input wire iA, iB
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
    reg r_iA, r_iB
    wire w_oSum, w_oCarr
)

half_adder half_adder_inst(
    .iA(r_iA), .iB(r_iB), .oSum(w_oSum), .oCarry(w_oCarry)
);

initial begin

r_iA = 0; r_iB = 0;
# 50;
if(w_oSum == 0 && w_oCarry == 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 0; r_iB = 1;
# 50;
if(w_oSum == 1 && w_oCarry == 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 1; r_iB = 0;
# 50;
if(w_oSum == 1 && w_oCarry == 0) $display("Test passed!!");
else $display("Test failed!!");

r_iA = 1; r_iB = 1;
# 50;
if(w_oSum == 0 && w_oCarry == 1) $display("Test passed!!");
else $display("Test failed!!");

end
```

## Full-adder

### Code

```verilog
module full_adder(
    input wire iA, iB, iCarry
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

end
```

## Ripple-Carry Adder

### Code

```verilog
module ripple_carry_adder_4bit(
    input wire [3:0] iA, iB,
    input wire iCarry,
    output wire [3:0] oSum,
    output wire oCarry
);

    wire carry1, carry2, carry3;

    full_adder fa0 (.iA(iA[0]), .iB(iB[0]), .iCarry(iCarry), .oSum(oSum[0]), .oCarry(carry1));
    full_adder fa1 (.iA(iA[1]), .iB(iB[1]), .iCarry(carry1), .oSum(oSum[1]), .oCarry(carry2));
    full_adder fa2 (.iA(iA[2]), .iB(iB[2]), .iCarry(carry2), .oSum(oSum[2]), .oCarry(carry3));
    full_adder fa3 (.iA(iA[3]), .iB(iB[3]), .iCarry(carry3), .oSum(oSum[3]), .oCarry(oCarry));

endmodule
```

### TestBench

```verilog
module ripple_carry_adder_TB;

    reg [3:0] r_iA, r_iB;
    reg r_iCarry;
    wire [3:0] w_oSum;
    wire w_oCarry;

    ripple_carry_adder_4bit rca_inst(
        .iA(r_iA),
        .iB(r_iB),
        .iCarry(r_iCarry),
        .oSum(w_oSum),
        .oCarry(w_oCarry)
    );

    initial begin

        r_iA = 4'b0000; r_iB = 4'b0000; r_iCarry = 0;
        #50;
        if (w_oSum == 4'b0000 && w_oCarry == 0) $display("Test Case 1 Passed");
        else $display("Test Case 1 Failed");

        r_iA = 4'b0011; r_iB = 4'b0101; r_iCarry = 0;
        #50;
        if (w_oSum == 4'b1000 && w_oCarry == 0) $display("Test Case 2 Passed");
        else $display("Test Case 2 Failed");

        // Test overflow
        r_iA = 4'b1111; r_iB = 4'b0001; r_iCarry = 0;
        #50;
        if (w_oSum == 4'b0000 && w_oCarry == 1) $display("Test Case 3 Passed");
        else $display("Test Case 3 Failed");

        r_iA = 4'b1001; r_iB = 4'b0110; r_iCarry = 0;
        #50;
        if (w_oSum == 4'b1111 && w_oCarry == 0) $display("Test Case 4 Passed");
        else $display("Test Case 4 Failed");

        // Test overflow
        r_iA = 4'b1111; r_iB = 4'b1111; r_iCarry = 0;
        #50;
        if (w_oSum == 4'b1110 && w_oCarry == 1) $display("Test Case 5 Passed");
        else $display("Test Case 5 Failed");
    end

endmodule
```
