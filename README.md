# 2-bit Logic Gates Verilog Module

This repository contains a simple Verilog module implementing basic 2-bit logic gates: **AND, OR, XOR, NOR, NAND**.

## Module Interface

| Port | Direction | Description |
|------|-----------|-------------|
| a    | input     | First input |
| b    | input     | Second input |
| x1   | output    | AND output |
| x2   | output    | OR output |
| x3   | output    | XOR output |
| x4   | output    | NOR output |
| x5   | output    | NAND output |

## Verilog Code

```verilog
module logic_gate(a,b,x1,x2,x3,x4,x5);

input a,b; 
output x1,x2,x3,x4,x5;

wire x1,x2,x3,x4,x5;

// AND gate
assign x1 = a & b;
// OR gate
assign x2 = a | b;
// XOR gate
assign x3 = a ^ b;
// NOR gate
assign x4 = ~(a | b);
// NAND gate
assign x5 = ~(a & b);

endmodule
