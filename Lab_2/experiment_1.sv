`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2025 07:06:08 PM
// Design Name: 
// Module Name: experiment_1
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


module experiment_1(
       input logic a,
       input logic b,
       input logic c,
       output logic x,
       output logic y
                );
       logic xor_out;
       logic or_out;
       logic nand_out;

       
    assign or_out = a | b;
    assign nand_out = ~(a & b);
    assign xor_out = nand_out ^ or_out;
    assign x = (~c) ^ or_out;
    assign y = or_out & xor_out;
      
endmodule
