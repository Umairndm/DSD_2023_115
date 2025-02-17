`timescale 1ns / 1ps


module rgb (
    input logic [1:0] a,  
    input logic [1:0] b,  
    output logic red,     
    output logic green,   
    output logic blue     
);

    logic a1, ao, b1, bo;
    assign a1 = a[1];
    assign ao = a[0];
    assign b1 = b[1];
    assign bo = b[0];
    assign red = (~b1 & ~bo) | (ao & ~b1) | (a1 & ~b1) | (a1 & ao) | (a1 & ~bo);
    assign green = (~a1 & ~ao) | (b1 & bo) | (~a1 & bo) | (~a1 & b1) | (~ao & b1);
    assign blue = (a1 ^ b1) | (ao ^ bo);

endmodule
