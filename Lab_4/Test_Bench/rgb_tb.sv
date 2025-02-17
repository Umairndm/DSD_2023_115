`timescale 1ns / 1ps

module rgb_tb();
    logic [1:0] a;
    logic [1:0] b;
    logic red, green, blue;

    rgb uut( 
        .a(a),
        .b(b),
        .red(red),
        .green(green),
        .blue(blue)
    );

    task driver(input logic [1:0] A = $random, input logic [1:0] B = $random);
        begin
            a = A;
            b = B;
            #10;
        end
    endtask

    task direct_test(input logic [1:0] A, input logic [1:0] B);
        begin
            driver(A, B);
            monitor();
        end
    endtask

    task random_test(input int n);
        begin
            for (int i = 0; i < n; i++) begin
                driver();
                monitor();
            end
        end
    endtask  

   task monitor();
        logic expected_red, expected_green, expected_blue;

        begin
            expected_red = (~b[1] & ~b[0]) | (a[0] & ~b[1]) | (a[1] & ~b[1]) | (a[1] & a[0]) | (a[1] & ~b[0]);
            expected_green = (~a[1] & ~a[0]) | (b[1] & b[0]) | (~a[1] & b[0]) | (~a[1] & b[1]) | (~a[0] & b[1]);
            expected_blue = (a[1] ^ b[1]) | (a[0] ^ b[0]);

            if (red !== expected_red || green !== expected_green || blue !== expected_blue) begin
                $display("ERROR: a=%b, b=%b , Expected: R=%b G=%b B=%b , Got: R=%b G=%b B=%b , Time=%t", 
                         a, b, expected_red, expected_green, expected_blue, red, green, blue, $time);
                $finish;
            end else begin
                $display("PASS: a=%b, b=%b , R=%b G=%b B=%b , Time=%t", 
                         a, b, red, green, blue, $time);
            end    
        end
    endtask

    initial begin
        $display("Starting RGB Self-Testing Testbench...\n");

        direct_test(2'b10, 2'b01);
        direct_test(2'b01, 2'b10);
        direct_test(2'b11, 2'b00);
        direct_test(2'b00, 2'b11);

        random_test(5);

        $display("\n All tests passed successfully!");
        $finish;    
    end    
endmodule    
