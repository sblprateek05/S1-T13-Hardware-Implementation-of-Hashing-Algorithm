module tb_MainModule;

    
    reg [7:0] in0;
    reg [7:0] in1;
    reg [7:0] in2;
    reg [7:0] in3;
    reg [7:0] in4;
    reg [7:0] in5;

    
    wire [15:0] a_out;
    wire [15:0] b_out;
    wire [15:0] c_out;
    wire [15:0] d_out;

    
    MainModule uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .in5(in5),
        .a_out(a_out),
        .b_out(b_out),
        .c_out(c_out),
        .d_out(d_out)
    );

    initial begin
        
        in0 = 8'b01000001; //A
        in1 = 8'b01000010; //B
        in2 = 8'b01000011; //C
        in3 = 8'b01000100; //D
        in4 = 8'b01000101; //E
        in5 = 8'b01000110; //F
        
        
        #10;
        
        
        $display("a_out: %b", a_out);
        $display("b_out: %b", b_out);
        $display("c_out: %b", c_out);
        $display("d_out: %b", d_out);
        
        
        #10;
        $finish;
    end

endmodule
