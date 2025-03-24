`timescale 1ns / 1ps


module lab_7_segment (
    input logic clk, reset, write, 
    input logic [2:0] sel, 
    input logic [3:0] num, 
    output logic [6:0] segments,
    output logic [7:0] anode
);
logic slow_clk;
logic [17:0] count;

always_ff @(posedge clk or posedge reset) begin
     if (reset)
         count <= 0;
     else
         count <= count + 1;
end

always_ff @(posedge clk or posedge reset) begin
    if (reset)
        slow_clk <= 0;
    else
        slow_clk <= count[19];
end

logic [2:0] display_sel;
always_ff @(posedge slow_clk or posedge reset) begin
     if (reset)
         display_sel <= 3'b000;
     else
         display_sel <= display_sel + 1;
end

assign anode = ~(8'b00000001 << display_sel);

logic [3:0] memory [7:0];
always_ff @(posedge clk or posedge reset) begin
    if (reset)
        memory <= '{default:4'b0000}; 
    else if (write)
        memory[sel] <= num;  
end

assign segments = segment(memory[display_sel]);

function logic [6:0] segment(input logic [3:0] value);
    case (value)
        4'h0: segment = 7'b1000000; 
        4'h1: segment = 7'b1111001; 
        4'h2: segment = 7'b0100100; 
        4'h3: segment = 7'b0110000; 
        4'h4: segment = 7'b0011001;
        4'h5: segment = 7'b0010010;
        4'h6: segment = 7'b0000010; 
        4'h7: segment = 7'b1111000; 
        4'h8: segment = 7'b0000000; 
        4'h9: segment = 7'b0010000; 
        4'hA: segment = 7'b0001000;
        4'hB: segment = 7'b0000011; 
        4'hC: segment = 7'b1000110;
        4'hD: segment = 7'b0100001; 
        4'hE: segment = 7'b0000110; 
        4'hF: segment = 7'b0001110;
        default: segment = 7'b1111111;
    endcase
endfunction
endmodule
