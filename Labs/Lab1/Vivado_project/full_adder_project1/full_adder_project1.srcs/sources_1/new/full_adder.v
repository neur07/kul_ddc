module full_adder(
    input wire iA, iB, iCarry,
    output wire oSum, oCarry
);

// Full-adder logic
assign oSum = iA ^ iB ^ iCarry;
assign oCarry = (iA & iB) | (iCarry & (iA ^ iB));

endmodule