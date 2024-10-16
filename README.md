# Hardware Implementation of Hashing Algorithm

<!-- First Section -->
## Team Details
<details>
  <summary>Detail</summary>

  > Semester: 3rd Sem B. Tech. CSE

  > Section: S1

  > Member-1: A R Sharan Kumar, 231CS101, arsharankumar.231cs101@nitk.edu.in

  > Member-2: Ashutosh Kumar, 231CS113, ashutoshkumar.231cs113@nitk.edu.in

  > Member-3: S B L Prateek, 231CS149, sblprateek.231cs149@nitk.edu.in
</details>

<!-- Second Section -->
## Abstract
<details>
  <summary>Detail</summary>
  
   > ## Motivation:
 The motivation behind this project is to address the performance bottlenecks
faced by software implementations of the SHA-256 hash function, especially in resource-
constrained environments like embedded systems and IoT devices. By implementing SHA-
256 in hardware, we aim to achieve significant improvements in processing speed and power
efficiency, which are critical for optimizing security and performance in these applications.
  
   > ## Problem Statement:
 Traditional software implementations of SHA-256 can suffer from performance
limitations, particularly in systems with strict timing and power requirements. This
creates challenges for applications that require both robust security and efficient performance,
highlighting the need for a more effective solution.
  
   > ## Features:
  <br>• Hardware implementation of the SHA-256 algorithm.
  <br>• Significant improvements in processing speed and power efficiency compared to software solutions.
  <br>• Optimization for small inputs and a considerable number of hashing functions.
  <br>• Viability for applications that require enhanced security and performance optimization.
  <br>• SHA-256 enable parallel data block processing, enhancing hash computation speed, especially in hardware implementations.

</details>

<!-- Third Section -->
## Functional Block Diagram
<details>
  <summary>Detail</summary>

<img alt="S1-T13" src="https://github.com/user-attachments/assets/bda8a19e-dd27-4588-94f4-a7eaa28837fc"><img/>


</details>


<!-- Fourth Section -->
## Working
<details>
  <summary>Detail</summary>

<img alt="Flow Chart" src="https://github.com/user-attachments/assets/c9d7b562-1c4b-480a-a3c9-5185efe4e7bd"><img/>


> ## 1.	Input Handling:
<br>•	The system takes 6 ASCII values, each 8 bits long. These values are paired to form 16-bit message blocks:
<br> M0 = {in0, in1}
<br> M1 = {in2, in3}
<br> M2 = {in4, in5}
<br>•	A fourth block, M3, holds the number of non-zero inputs to define the length of the message.
<br>•	The blocks M0, M1, M2, and M3 form the input message.

> ## 2.	Message Expansion:
<br>•	The input message blocks are expanded into 8 words (W0 to W7) using the following equations:
<br> –	For W0 to W3:
<br> W(t) = M(t) for 0 <= t <= 3.
<br >This means W0 = M0, W1 = M1, W2 = M2, and W3 = M3.
<br> –	For W4 to W7:
<br> W(t) = small sigma(W(t-3)) + W(t-1) for 4 <= t <= 7. The small sigma function is defined as:
<br> small sigma(x) = ROT11(x) ˆ ROT7(x) ˆ RSH3(x), where:
<br> ∗ ROT11(x) is a rotation of x by 11 bits,
<br> ∗ ROT7(x) is a rotation by 7 bits,
<br> ∗ RSH3(x) is a right shift by 3 bits.

> ## 3.	Initial Hash Values (a, b, c, d):
<br>•	The initial hash values a, b, c, and d are constants derived from the first 16 bits of the decimal part of the square roots of the first 4 prime numbers:
<br> – a = 0110101000001001 (square root of 2),
<br> – b = 1011101101100111 (square root of 3),
<br> – c = 0011110001101110 (square root of 5),
<br> – d = 1010010101001111 (square root of 7).


> ## 4.	Round Constants (K[0] to K[7]):
<br> •	Predefined constants K[0] to K[7] are used during the hash generation to introduce complexity. These constants are the first 16 bits of the decimal part of the cube roots of the first 8 prime numbers. Specifically:
<br>– K[0] = 0100001010001010 (cube root of 2),
<br>– K[1] = 0111000100110111 (cube root of 3),
<br>– K[2] = 1011010111000000 (cube root of 5),
<br>– K[3] = 1110100110110101 (cube root of 7),
<br>– K[4] = 0011100101010110 (cube root of 11),
<br>– K[5] = 0101100111110001 (cube root of 13),
<br>– K[6] = 1001001000111111 (cube root of 17),
<br>– K[7] = 1010101100011100 (cube root of 19).

> ## 5.	Hash Computation:
<br>•	The algorithm performs 8 rounds of computation, transforming the values of a, b, c, and d using two main operations: 
<br>	-T1 Calculation:
<br>T1 = Sigma1(c) + CH(b, c, d) + W(t) + K(t) + d where Sigma1(x) :
<br>Sigma1(x) = ROT2(x) + ROT7(x)
<br> –T2 Calculation:
<br>T2 = Sigma0(a) + MAJ(a, b, c) where Sigma0(x) :
<br>Sigma0(x) = ROT5(x) + ROT11(x)
<br>•	These transformations are applied for each of the 8 words (W0 to W7), updating the values of a, b, c, and d in each round as shown below :
<br>•	d = c
<br>•	c = b+T1
<br>•	b = a
<br>•	a= T1 + T2

> ## 6.	Final Hash Value:
<br>•	After completing the 8 rounds, the final values of a, b, c, and d are combined to form the 64-bit hash.
<br>•	This 64-bit hash is converted into ASCII format for output display.

<img alt="S1-T13" src="https://github.com/user-attachments/assets/609ed5a3-643e-47c2-8d9a-046a5b99929e"><img/>

> ## Operational Steps:
<br>1.	Click Refresh:
<br>•	This clears the output screen, resets the message blocks to zero, and sets all counters to zero.
<br>2.	Clock Pulse 1:
<br>•	Apply Clock Pulse 1 until all input characters are read, or click until Counter Display 1 reaches 7.
<br>3.	Clock Pulse 2:
<br>•	Apply Clock Pulse 2 until Counter Display 2 reaches 7, indicating that the words are ready.
<br>4.	Clock Pulse 3:
<br>•	Apply Clock Pulse 3 until Counter Display 3 reaches 8, showing the final 8 characters of the 64-bit hash on the output screen.

</details>

<!-- Fifth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>

  ## How To Use Logisim S1-T13.circ 
  <br> 1. Click refresh once.
  <br> 2. Enter your input string (max length: 6).
  <br> 3. Keep applying clock pulse 1 until all the characters are read from the input, or just keep clicking the button until the counter display 1 stops at a number (stops at 7).
  <br> 4. Keep applying clock pulse 2 until the counter display 2 stops at a number (stops at 7).
  <br> 5. Keep applying clock pulse 3 until the counter display 3 stops at a number (stops at 8), or just keep applying the clock pulse until you see 8 characters in the output screen.

>## Main Module
<br>The main module takes input string of max length 6. It operates through the diagram as shown below. Finally, output is a 8 character(64 bit) hash. The output length is always fixed regardless of the length of input string.

><img alt="Main Module" src="https://github.com/user-attachments/assets/80dcd7b3-6702-4f2c-96c8-d6a72f02e66b"><img/>



>## Padding Module
<br>The input in the main module is passed to the Padding module. The Padding module gives 4 16-bit outputs M0, M1, M2 and M3. M0, M1 and M2 correspond to the ASCII values of the input string characters(in case of shortage of characters, 0 is put), and M3 represents the number of input characters, in a 16 bit format.
><img alt="Padding" src="https://github.com/user-attachments/assets/3696e794-8b66-4613-8aec-90f647cca45e"><img/>



>## Ws Module
<br>This module takes 4 inputs, M0, M1, M2 and M3, and produces 8 outputs, W0 to W7. Values of W0 to W3 are the same as M0 to M3, respectively. The latter Ws are calculated using the former Ws and the small sigma function.
><img alt="Ws" src="https://github.com/user-attachments/assets/6d092195-e13e-492d-8fee-1431882cda03"><img/>



>## Small Sigma Function
<br>This module takes a 16 bit input, performs bitwise rotations(7 and 11 times), a right shift and the output is the XOR od these 3 values.
><img alt="Small Sigma Function" src="https://github.com/user-attachments/assets/52955470-6dff-4340-9a25-753681596404"><img/>



>## Upcounter Module
<br>This module uses an upcounter but with some modifications. After the counter reaches 7, counter doesn’t increase on further clock pulses, further clock pulses applied no longer work on the circuits where the clock pulse signal is passed, unless refresh is clicked. The refresh button resets the counter to 0 and allows the clock pulses to work on the circuits to which it is passed, till the counter reaches 7. Then the same thing repeats.
><img alt="Upcounter" src="https://github.com/user-attachments/assets/705511ca-8e32-4a50-a426-46a967f6f5ac"><img/>



>## Hash Generator Module
<br>Generates hash values a, b, c and d for each round 7 times. For the first round, constant values are used as a, b, c and d. For the rest of the rounds, the newly obtained a, b, c and d are used. T1 and T2 modules are used to perform the operations. After all the rounds, the values a, b, c and d obtained are sent as ouput which are sent to the Characters module.
><img alt="Hash Generator" src="https://github.com/user-attachments/assets/e0e0dd9a-05d3-4a97-8c2c-b655835bbf9c"><img/>


>## Last Upcounter Module
<br>This module is the same as upcounter, with the only differ- ence being that the counter stops at 8 instead of 7. This is to make sure that all the 8 characters of the hash are displayed in the output.
><img alt="Last Upcounter" src="https://github.com/user-attachments/assets/edb18203-5406-4726-a2ac-80e78187a23d"><img/>



>## Sigma 0 Module
<br>Takes a 16 bit input, performs bitwise operations: left rotations 5 and 11 times, and returns their sum as output.
><img alt="Sigma 0" src="https://github.com/user-attachments/assets/40d1ea6e-ce96-4abe-9c6d-5904d353d935"><img/>

>## Sigma 1 Module
<br>Takes a 16 bit input, performs bitwise operations: left rotations 2 and 7 times, and returns their sum as output.
><img alt="Sigma 1" src="https://github.com/user-attachments/assets/46ea875a-3dbd-4a7d-9b21-b01484237720"><img/>


>## T1 Module
<br>Sigma1 module is used here. ’c’ is passed into the Sigma1 module and the output obtained is XORed with Choose(b,c,d), the product of d and K(t), and W(t) to give a 16 bit output.
><img alt="T1" src="https://github.com/user-attachments/assets/ff9e220e-3c0a-485d-81fe-1301544b6d4a"><img/>



>## T2 Module
<br>Uses Sigma0 function. ’a’ is passed into Sigma0 function to obtain an output which is added with the sum of pairwise products of a, b and c(i.e., MAJ(a, b, c)) to produce the output for T2 module.
><img alt="T2" src="https://github.com/user-attachments/assets/63b652c3-aee4-48ee-b07f-d5f4285d4580"><img/>



>## Characters Module
<br>This module is just used as an aid to display the output hash values as characters. The built-in tty output takes a 7 bit binay number and displays corresponding ASCII character for each clock pulse applied. To send 7 bits to the tty, Characters module is used, where 7 bits of data in sent for each clock pulse with the help of splitters.
><img alt="Characters" src="https://github.com/user-attachments/assets/125535f4-8cba-43f7-8cef-202d5b2fbfb6"><img/>




</details>

<!-- Sixth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>

> ## Main Module
  ``` 
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

```

>## Small Sigma Function Module

```
// Small Sigma Function

module small_sigma(input [15:0] x, output [15:0] sigma_out);
    wire [15:0] b, s7, s3;

    assign b  = {x[13:0], x[15:14]};
    assign s7 = {x[8:0], x[15:9]};
    assign s3 = x >> 3;

    assign sigma_out = b ^ s7 ^ s3;
endmodule
```

>## Ws Module

```
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
```
>## Sigma0 Function Module
```
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
```

>## Sigma1 Function Module

```
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
```

>## T2 Module

```
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
```
>## T1 Module
```
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
```
>## Hash Generator Module
```
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
```
>## Test Bench

```
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

```



</details>

<!-- Seventh Section -->
 ## References
 <details>
  <summary>Detail</summary>

[1] Simplilearn : https://www.simplilearn.com/tutorials/cyber-security-tutorial/sha-256-algorithm

[2] Tutorial Point : https://www.tutorialspoint.com/cryptography/sha256algorithm.htm

[3] Youtube : https://www.youtube.com/watch?v=orIgy2MjqrA

[4] SSL Dragon : https://www.ssldragon.com/blog/sha-256-algorithm/

[5] Youtube : https://www.youtube.com/watch?v=PbFVTb7Pndct=726s



 

</details>
