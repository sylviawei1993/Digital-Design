//-------------------------------------------------------------
// Title : DAC Control with 7-Segment & LCD Display (XC6SLX75)
// Board : XCS75FGGA484-1 (SeoulTech FPGA Lab Board)
// DAC   : AD7302 8-bit DAC (dual output A/B)
// Author: (위사경)
//-------------------------------------------------------------

module DAC_7SEG_LCD_XCS75(
    input clk,               // Main Clock (50MHz)
    input rst_n,             // Reset (Active Low)
    input [11:0] key,        // Button Switches SM_1 ~ SM_12
    output reg [7:0] DAC_D,  // DAC Data Pins
    output reg DAC_WRN,      // DAC Write Control (Active Low)
    output reg DAC_A_B,      // Output Select (A=0, B=1)
    output [6:0] seg,        // Segment a~g
    output [7:0] seg_sel,    // Segment select S0~S7
    output [7:0] lcd_data,   // LCD Data D0~D7
    output lcd_rs, lcd_rw, lcd_e // LCD Control
);

    //---------------------------------------------------------
    // 1. DAC Digital Input Value Control by Buttons
    //---------------------------------------------------------
    reg [7:0] dac_input;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            dac_input <= 8'd0;
        else begin
            if(key[1]) dac_input <= dac_input - 1;   // SM_1 : -1
            if(key[3]) dac_input <= dac_input + 1;   // SM_3 : +1
            if(key[4]) dac_input <= dac_input - 2;   // SM_4 : -2
            if(key[6]) dac_input <= dac_input + 2;   // SM_6 : +2
            if(key[7]) dac_input <= dac_input - 8;   // SM_7 : -8
            if(key[9]) dac_input <= dac_input + 8;   // SM_9 : +8
        end
    end

    //---------------------------------------------------------
    // 2. DAC Control Signals (WRN pulse)
    //---------------------------------------------------------
    reg [15:0] cnt;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            DAC_WRN <= 1'b1;
            DAC_D   <= 8'd0;
            cnt <= 0;
        end else begin
            cnt <= cnt + 1;
            if(cnt == 16'd1000) begin
                DAC_D   <= dac_input;
                DAC_WRN <= 1'b0;     // write active
            end else if(cnt == 16'd2000) begin
                DAC_WRN <= 1'b1;     // release
