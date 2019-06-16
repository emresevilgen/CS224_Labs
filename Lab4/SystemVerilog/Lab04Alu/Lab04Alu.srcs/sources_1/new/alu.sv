`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 08:47:58 AM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(input  logic [31:0] a, b, 
           input  logic [2:0]  alucont, 
           output logic [31:0] result,
           output logic zero);

    always_comb 
    case (alucont)
        3'b000: assign result = a&b;
        3'b001: assign result = a|b;
        3'b010: assign result = a+b;
        3'b110: assign result = a-b;
        3'b111: assign result = (a < b) ? 1 : 0;
    endcase
    assign zero = result ? 0:1;

endmodule
