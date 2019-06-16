`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 08:49:53 AM
// Design Name: 
// Module Name: aluTestbench
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


module aluTestbench();
    logic [31:0] a, b; 
    logic [2:0]  alucont; 
    logic [31:0] result;
    logic zero;
    alu dut( a, b, alucont, result, zero);
    
    initial begin
        a = 7; b = 3; 
        alucont = 3'b000; #10;
        alucont = 3'b001; #10;
        alucont = 3'b010; #10;
        alucont = 3'b110; #10;
        alucont = 3'b111; #10;
        a = 3; b = 7;
        alucont = 3'b000; #10;
        alucont = 3'b001; #10;
        alucont = 3'b010; #10;
        alucont = 3'b110; #10;
        alucont = 3'b111; #10;
    end
    
endmodule
