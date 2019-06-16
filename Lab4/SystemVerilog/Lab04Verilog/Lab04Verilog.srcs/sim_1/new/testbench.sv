`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2019 02:10:06 PM
// Design Name: 
// Module Name: testbench
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


module testbench();
    logic clk;
    logic reset;
    
    logic [31:0] writedata, dataadr, pc, instr;
    logic memwrite;
    logic sw_input;
	logic clear;
	     
    logic [3:0] AN;
	logic [6:0] C;
	logic       DP;
    
    // instantiate device to be tested
    top dut (clk, reset, writedata, dataadr, memwrite, pc, instr, sw_input, clear, AN, C, DP);
    
    // initialize test
    initial
        begin
            reset <= 1; # 20; reset <= 0;
        end
        
    // generate clock to sequence tests
    always
        begin
            sw_input <= 1; clear <= 0;
            clk <= 1; # 5; clk <= 0; # 5;
        end

endmodule
