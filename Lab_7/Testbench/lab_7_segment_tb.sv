`timescale 1ns / 1ps

module lab_7_segment_tb;
    logic clk, reset, write;
    logic [3:0] num;
    logic [2:0] sel;
    logic [6:0] segments;
    logic [7:0] anode;
    
    lab_7_segment uut (
        .clk(clk),
        .reset(reset),
        .write(write),
        .num(num),
        .sel(sel),
        .segments(segments),
        .anode(anode)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        reset = 1;
        write = 0;
        num = 4'b0000;
        sel = 3'b000;
        
        #20 reset = 0;
        
        #10 write = 1; sel = 3'b000; num = 4'h1; #10 write = 0;
        #10 write = 1; sel = 3'b001; num = 4'h2; #10 write = 0;
        #10 write = 1; sel = 3'b010; num = 4'h3; #10 write = 0;
        #10 write = 1; sel = 3'b011; num = 4'h4; #10 write = 0;
        #10 write = 1; sel = 3'b100; num = 4'h5; #10 write = 0;
        #10 write = 1; sel = 3'b101; num = 4'h6; #10 write = 0;
        #10 write = 1; sel = 3'b110; num = 4'h7; #10 write = 0;
        #10 write = 1; sel = 3'b111; num = 4'hF; #10 write = 0;
        
        #10 sel = 3'b000; #10;
        #10 sel = 3'b001; #10;
        #10 sel = 3'b010; #10;
        #10 sel = 3'b011; #10;
        #10 sel = 3'b100; #10;
        #10 sel = 3'b101; #10;
        #10 sel = 3'b110; #10;
        #10 sel = 3'b111; #10;
        
        #10 reset = 1; #10 reset = 0;
        
        $stop;
    end
endmodule
