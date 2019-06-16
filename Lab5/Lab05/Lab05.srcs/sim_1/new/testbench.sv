`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2019 01:58:36 PM
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
    logic reset;
    logic clk;
      
    logic[31:0]  PCF;
    logic[31:0]  aluout, resultW;
    logic[31:0]  instrOut, WriteDataM;
    logic StallD, StallF;
    
    logic memwrite, regwrite, DP;
    logic [6:0] C;
    logic [3:0] AN;
    logic clkButton;
    
    
    
    // instantiate device to be tested
    mips dut(clk, reset, PCF, aluout, resultW, instrOut, WriteDataM, StallD, StallF,
            memwrite, regwrite, DP, C, AN, clkButton);
    
    // initialize test
    initial
        begin
            reset <= 1; # 20; reset <= 0;
        end
        
    // generate clock to sequence tests
    always
        begin
            clk <= 1; # 5; clk <= 0; # 5;
        end


endmodule
