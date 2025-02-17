`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 09:48:30 PM
// Design Name: 
// Module Name: Lab_3
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


module Lab_3(
    input logic a,
    input logic b,
    input logic c,
    output logic sum,
    output logic carry
);
    assign sum = (a ^ b) ^ c;  
    assign carry = (a & b) | (c & (a ^ b));  
endmodule


