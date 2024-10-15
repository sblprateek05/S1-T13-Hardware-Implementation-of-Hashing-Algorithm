//Main Module

module MainModule (
    input [7:0] in0,
    input [7:0] in1,
    input [7:0] in2,
    input [7:0] in3,
    input [7:0] in4,
    input [7:0] in5,
    output reg [15:0] a_out,
    output reg [15:0] b_out,
    output reg [15:0] c_out,
    output reg [15:0] d_out
);
    wire [15:0] W [0:7];

    reg [15:0] a = 16'b0110101000001001;
    reg [15:0] b = 16'b1011101101100111;
    reg [15:0] c = 16'b0011110001101110;
    reg [15:0] d = 16'b1010010101001111;

    reg [15:0] K [0:7] = {
        16'b0100001010001010,
        16'b0111000100110111,
        16'b1011010111000000,
        16'b1110100110110101,
        16'b0011100101010110,
        16'b0101100111110001,
        16'b1001001000111111,
        16'b1010101100011100
    };

    reg [2:0] num_non_zero_inputs;
    reg [15:0] M0, M1, M2, M3;
    reg [15:0] temp_a, temp_b, temp_c, temp_d;
    integer i;

    always @* begin
        num_non_zero_inputs = 0;

        if (in0 != 8'b00000000) num_non_zero_inputs = num_non_zero_inputs + 1;
        if (in1 != 8'b00000000) num_non_zero_inputs = num_non_zero_inputs + 1;
        if (in2 != 8'b00000000) num_non_zero_inputs = num_non_zero_inputs + 1;
        if (in3 != 8'b00000000) num_non_zero_inputs = num_non_zero_inputs + 1;
        if (in4 != 8'b00000000) num_non_zero_inputs = num_non_zero_inputs + 1;
        if (in5 != 8'b00000000) num_non_zero_inputs = num_non_zero_inputs + 1;

        M0 = {in0, in1};
        M1 = {in2, in3};
        M2 = {in4, in5};
        M3 = {13'b0, num_non_zero_inputs};
    end

    module_Ws ws_inst (
        .M0(M0),
        .M1(M1),
        .M2(M2),
        .M3(M3),
        .W0(W[0]),
        .W1(W[1]),
        .W2(W[2]),
        .W3(W[3]),
        .W4(W[4]),
        .W5(W[5]),
        .W6(W[6]),
        .W7(W[7])
    );

    always @* begin
        temp_a = a;
        temp_b = b;
        temp_c = c;
        temp_d = d;

        for (i = 0; i < 8; i = i + 1) begin
            
            HashGenerator hash_gen_inst (
                .a(temp_a),
                .b(temp_b),
                .c(temp_c),
                .d(temp_d),
                .K(K[i]),
                .W(W[i]),
                .a_out(temp_a),
                .b_out(temp_b),
                .c_out(temp_c),
                .d_out(temp_d)
            );
        end

        a_out = temp_a;
        b_out = temp_b;
        c_out = temp_c;
        d_out = temp_d;
    end
endmodule


// Small Sigma Function

module small_sigma(input [15:0] x, output [15:0] sigma_out);
    wire [15:0] b, s7, s3;

    assign b  = {x[13:0], x[15:14]};
    assign s7 = {x[8:0], x[15:9]};
    assign s3 = x >> 3;

    assign sigma_out = b ^ s7 ^ s3;
endmodule



// Ws Module

module module_Ws(
    input  [15:0] M0, M1, M2, M3,
    output [15:0] W0, W1, W2, W3, W4, W5, W6, W7
);
    wire [15:0] sig_W1, sig_W2, sig_W3, sig_W4;

    assign W0 = M0;
    assign W1 = M1;
    assign W2 = M2;
    assign W3 = M3;

    small_sigma u1 (.x(W1), .sigma_out(sig_W1));
    small_sigma u2 (.x(W2), .sigma_out(sig_W2));
    small_sigma u3 (.x(W3), .sigma_out(sig_W3));

    assign W4 = sig_W1 + W3; // Compute W4 first
    small_sigma u4 (.x(W4), .sigma_out(sig_W4));

    assign W5 = sig_W2 + W4;
    assign W6 = sig_W3 + W5;
    assign W7 = sig_W4 + W6;
endmodule








// Sigma 0 
  
module Sigma0 (
    input [15:0] a,
    output [15:0] sigma_out
);
    wire [15:0] rot5, rot11;
    wire [15:0] sum;

    assign rot5 = {a[10:0], a[15:11]};
    assign rot11 = {a[4:0], a[15:5]};
    assign sum = rot5 + rot11;
    assign sigma_out = sum;
endmodule





//  Sigma 1

module Sigma1 (
    input [15:0] c,
    output [15:0] sigma1_out
);
    wire [15:0] rot2, rot7;

    assign rot2 = {c[13:0], c[15:14]};
    assign rot7 = {c[8:0], c[15:9]};
    assign sigma1_out = rot2 + rot7;

endmodule







// T2

module T2 (
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    output [15:0] t2_out
);
    wire [15:0] sigma0_a;
    wire [15:0] and_ab, and_bc, and_ca;
    
    Sigma0 sigma0_inst (
        .a(a),
        .sigma_out(sigma0_a)
    );

    assign and_ab = a & b;
    assign and_bc = b & c;
    assign and_ca = c & a;

    
    assign t2_out = and_ab | and_bc | and_ca | sigma0_a;
endmodule








// T1

module T1 (
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,
    input [15:0] K,
    input [15:0] W,
    output [15:0] T1_out
);
    wire [15:0] sigma1_c;
    wire [15:0] choose_out;
    wire [15:0] and_bc, not_b, and_not_bd;

    Sigma1 sigma1_inst (
        .c(c),
        .sigma1_out(sigma1_c)
    );

    assign and_bc = b & c;
    assign not_b = ~b;
    assign and_not_bd = not_b & d;
    assign choose_out = and_bc | and_not_bd;

    assign T1_out = sigma1_c ^ choose_out ^ (d & K) ^ W;

endmodule





// Hashgenetor 

module HashGenerator (
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,
    input [15:0] K,
    input [15:0] W,
    output reg [15:0] a_out,
    output reg [15:0] b_out,
    output reg [15:0] c_out,
    output reg [15:0] d_out
);

    wire [15:0] T1_out;
    wire [15:0] T2_out;

    T1 t1_inst (
        .b(b),
        .c(c),
        .d(d),
        .K(K),
        .W(W),
        .T1_out(T1_out)
    );

    T2 t2_inst (
        .a(a),
        .b(b),
        .c(c),
        .t2_out(T2_out)
    );

    integer i;
    reg [15:0] temp_a, temp_b, temp_c, temp_d;

    always @(*) begin
        temp_a = a;
        temp_b = b;
        temp_c = c;
        temp_d = d;

        for (i = 0; i < 7; i = i + 1) begin
            temp_a = T1_out + T2_out;
            temp_b = temp_a;
            temp_c = temp_b + T1_out;
            temp_d = temp_c;
        end

        a_out = temp_a;
        b_out = temp_b;
        c_out = temp_c;
        d_out = temp_d;
    end

endmodule
