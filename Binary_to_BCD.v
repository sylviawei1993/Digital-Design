module Binary_to_BCD(
    input [7:0] binary,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones
);
    integer i;
    reg [19:0] bcd;
    always @(binary) begin
        bcd = 20'd0;
        bcd[7:0] = binary;
        for (i=0; i<8; i=i+1) begin
            if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
            if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
            if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 3;
            bcd = bcd << 1;
        end
        hundreds = bcd[19:16];
        tens     = bcd[15:12];
        ones     = bcd[11:8];
    end
endmodule
