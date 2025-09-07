// 2-bit Logic Gate Verilog 코드 (한글 주석 포함)
// 입력: DIP1, DIP2, DIP3 (핀 Y1, W3, U2)
// 출력: LED1 ~ LED5 (핀 L4, M4, M2, N7, M7)
// 논리: AND, OR, XOR, NOR, NAND

module logic_gates(
    input wire DIP1,   // DIP 스위치 1 (Y1)
    input wire DIP2,   // DIP 스위치 2 (W3)
    input wire DIP3,   // DIP 스위치 3 (U2)
    output wire LED1,  // AND 출력 (L4)
    output wire LED2,  // OR 출력 (M4)
    output wire LED3,  // XOR 출력 (M2)
    output wire LED4,  // NOR 출력 (N7)
    output wire LED5   // NAND 출력 (M7)
);

// 2개의 입력으로 AND, OR, XOR, NOR, NAND 계산
assign LED1 = DIP1 & DIP2;            // AND
assign LED2 = DIP1 | DIP2;            // OR
assign LED3 = DIP1 ^ DIP2;            // XOR
assign LED4 = ~(DIP1 | DIP2);         // NOR
assign LED5 = ~(DIP1 & DIP2);         // NAND

endmodule
