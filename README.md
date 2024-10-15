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


<img alt="S1-T13" src="https://github.com/user-attachments/assets/609ed5a3-643e-47c2-8d9a-046a5b99929e"><img/>

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
><img alt="Main Module" src="https://github.com/user-attachments/assets/80dcd7b3-6702-4f2c-96c8-d6a72f02e66b"><img/>



>## Padding Module
><img alt="Padding" src="https://github.com/user-attachments/assets/3696e794-8b66-4613-8aec-90f647cca45e"><img/>



>## Ws Module
><img alt="Ws" src="https://github.com/user-attachments/assets/6d092195-e13e-492d-8fee-1431882cda03"><img/>



>## Small Sigma Function
><img alt="Small Sigma Function" src="https://github.com/user-attachments/assets/52955470-6dff-4340-9a25-753681596404"><img/>



>## Upcounter Module
><img alt="Upcounter" src="https://github.com/user-attachments/assets/705511ca-8e32-4a50-a426-46a967f6f5ac"><img/>



>## Hash Generator Module
><img alt="Hash Generator" src="https://github.com/user-attachments/assets/e0e0dd9a-05d3-4a97-8c2c-b655835bbf9c"><img/>


>## Last Upcounter Module
><img alt="Last Upcounter" src="https://github.com/user-attachments/assets/edb18203-5406-4726-a2ac-80e78187a23d"><img/>



>## Sigma 0 Module
><img alt="Sigma 0" src="https://github.com/user-attachments/assets/40d1ea6e-ce96-4abe-9c6d-5904d353d935"><img/>

>## Sigma 1 Module
><img alt="Sigma 1" src="https://github.com/user-attachments/assets/46ea875a-3dbd-4a7d-9b21-b01484237720"><img/>


>## T1 Module
><img alt="T1" src="https://github.com/user-attachments/assets/ff9e220e-3c0a-485d-81fe-1301544b6d4a"><img/>



>## T2 Module
><img alt="T2" src="https://github.com/user-attachments/assets/63b652c3-aee4-48ee-b07f-d5f4285d4580"><img/>



>## Characters Module
><img alt="Characters" src="https://github.com/user-attachments/assets/125535f4-8cba-43f7-8cef-202d5b2fbfb6"><img/>




</details>

<!-- Sixth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>

> ## Main Module
  ``` 
// The MainModule handles input processing by combining six 8-bit ASCII values into message blocks.
// It initializes hash values and manages the overall hashing procedure through eight rounds of computation using helper modules.
module MainModule (
    input [7:0] in0,
    input [7:0] in1,
    input [7:0] in2,
    input [7:0] in3,
    input [7:0] in4,
    input [7:0] in5,
    output reg [15:0] a_out,   // Output for hash value a
    output reg [15:0] b_out,   // Output for hash value b
    output reg [15:0] c_out,   // Output for hash value c
    output reg [15:0] d_out     // Output for hash value d
);

// Define internal wires and registers
wire [15:0] W [0:7];           // Message schedule array
reg [15:0] a = 16'b0110101000001001;  // Initial hash value a
reg [15:0] b = 16'b1011101101100111;  // Initial hash value b
reg [15:0] c = 16'b0011110001101110;  // Initial hash value c
reg [15:0] d = 16'b1010010101001111;  // Initial hash value d

// Define constant K values for the hash function
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

reg [2:0] num_non_zero_inputs;  // Count of non-zero inputs
reg [15:0] M0, M1, M2, M3;       // Message blocks
reg [15:0] temp_a, temp_b, temp_c, temp_d;  // Temporary variables for hash values
integer i;

// Always block to process inputs and prepare message blocks
always @* begin
    num_non_zero_inputs = 0;  // Initialize count of non-zero inputs

    // Count non-zero inputs
    if (in0 != 8'b00000000) num_non_zero_inputs = num_non_zero_inputs + 1;
    if (in1 != 8'b00000000) num_non_zero_inputs = num_non_zero_inputs + 1;
    if (in2 != 8'b00000000) num_non_zero_inputs = num_non_zero_inputs + 1;
    if (in3 != 8'b00000000) num_non_zero_inputs = num_non_zero_inputs + 1;
    if (in4 != 8'b00000000) num_non_zero_inputs = num_non_zero_inputs + 1;
    if (in5 != 8'b00000000) num_non_zero_inputs = num_non_zero_inputs + 1;

    // Create message blocks from inputs
    M0 = {in0, in1};
    M1 = {in2, in3};
    M2 = {in4, in5};
    M3 = {13'b0, num_non_zero_inputs}; // Include non-zero count in M3
end

// Instantiate the Ws module to process message blocks into W values
module Ws ws_inst (
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

// Always block to execute the hashing process
always @* begin
    temp_a = a; // Store current hash value a
    temp_b = b; // Store current hash value b
    temp_c = c; // Store current hash value c
    temp_d = d; // Store current hash value d

    // Loop through 8 rounds of hashing
    for (i = 0; i < 8; i = i + 1) begin
        // Instantiate the HashGenerator module for each round
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

    // Update output hash values after processing
    a_out = temp_a;
    b_out = temp_b;
    c_out = temp_c;
    d_out = temp_d;
end
endmodule
```

>## Small Sigma Function Module

```
// This module computes the small sigma function, which is used in the message expansion process.
// It performs bitwise rotations and a right shift to generate a new value from the input.
module small_sigma(input [15:0] x, output [15:0] sigma_out);
    wire [15:0] b, s7, s3;

    assign b = {x[13:0], x[15:14]}; // Rotate x left by 2
    assign s7 = {x[8:0], x[15:9]};  // Rotate x left by 7
    assign s3 = x >> 3;             // Right shift x by 3

    assign sigma_out = b ^ s7 ^ s3; // XOR the rotated and shifted values
endmodule
```

>## Ws Module

```
// The module Ws expands the input message blocks (M0 to M3) into eight 16-bit words (W0 to W7).
// It utilizes the small sigma function to generate the last four words based on the earlier ones.
module Ws(
    input [15:0] M0, M1, M2, M3,
    output [15:0] W0, W1, W2, W3, W4, W5, W6, W7
);
    wire [15:0] sig_W1, sig_W2, sig_W3, sig_W4;

    assign W0 = M0;  // Assign M0 to W0
    assign W1 = M1;  // Assign M1 to W1
    assign W2 = M2;  // Assign M2 to W2
    assign W3 = M3;  // Assign M3 to W3

    // Compute small sigma for W1, W2, and W3
    small_sigma u1 (.x(W1), .sigma_out(sig_W1)); 
    small_sigma u2 (.x(W2), .sigma_out(sig_W2)); 
    small_sigma u3 (.x(W3), .sigma_out(sig_W3)); 

    // Compute W4 based on small sigma and previous W values
    assign W4 = sig_W1 + W3; 

    // Compute small sigma for W4
    small_sigma u4 (.x(W4), .sigma_out(sig_W4)); 

    // Compute W5, W6, and W7 based on previous W values
    assign W5 = sig_W2 + W4;
    assign W6 = sig_W3 + W5; 
    assign W7 = sig_W4 + W6; 
endmodule
```
>## Sigma0 Function Module
```
// Sigma0 calculates a transformation used in hash computations.
// It involves bitwise rotations of the input and outputs the sum of these rotations.
module Sigma0 (
    input [15:0] a,
    output [15:0] sigma_out
);
    wire [15:0] rot5, rot11; 
    wire [15:0] sum;

    assign rot5 = {a[10:0], a[15:11]}; // Rotate a left by 5
    assign rot11 = {a[4:0], a[15:5]};  // Rotate a left by 11
    assign sum = rot5 + rot11;        // Sum the rotated values
    assign sigma_out = sum;            // Output the sum
endmodule
```

>## Sigma1 Function Module

```
// This module computes the Sigma1 function, which is a part of the hash generation process.
// It involves rotating the input value and summing the results to create a transformed output.
module Sigma1 (
    input [15:0] c,
    output [15:0] sigma1_out
);
    wire [15:0] rot2, rot7;

    assign rot2 = {c[13:0], c[15:14]}; // Rotate c left by 2
    assign rot7 = {c[8:0], c[15:9]};   // Rotate c left by 7
    assign sigma1_out = rot2 + rot7;   // Output the sum of the rotated values
endmodule
```

>## T2 Module

```
// T2 combines the output of the Sigma0 function with a majority function to produce a value used in hash calculations.
// It evaluates conditions based on inputs a, b, and c.
module T2 (
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    output [15:0] t2_out
);
    wire [15:0] sigma0_a;  // Output from Sigma0
    wire [15:0] and_ab, and_bc, and_ca; // Intermediate values

    // Instantiate Sigma0 to get sigma0_a
    Sigma0 sigma0_inst (
        .a(a),
        .sigma_out(sigma0_a)
    );

    // Compute bitwise ANDs for the majority function
    assign and_ab = a & b; 
    assign and_bc = b & c; 
    assign and_ca = c & a;

    // Compute the output as a combination of the ANDs and sigma0_a
    assign t2_out = and_ab | and_bc | and_ca | sigma0_a; 
endmodule
```
>## T1 Module
```
// T1 calculates a value used in the hash function that incorporates the Sigma1 function and a choice function based on the inputs b, c, d, and K.
// It performs bitwise operations to derive the result.
module T1 (
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,
    input [15:0] K,
    input [15:0] W,
    output [15:0] T1_out
);
    wire [15:0] sigma1_c;      // Output from Sigma1
    wire [15:0] choose_out;     // Output from the choice function
    wire [15:0] and_bc, not_b, and_not_bd; 

    // Instantiate Sigma1 to get sigma1_c
    Sigma1 sigma1_inst (
        .c(c),
        .sigma1_out(sigma1_c)
    );

    // Compute bitwise ANDs and negations for choice function
    assign and_bc = b & c; 
    assign not_b = ~b;
    assign and_not_bd = not_b & d;

    // Compute the choice function
    assign choose_out = and_bc | and_not_bd;

    // Compute the output using XOR of the components
    assign T1_out = sigma1_c ^ choose_out ^ (d & K) ^ W; 
endmodule
```
>## Hash Generator Module
```
// The HashGenerator executes the hashing operations for each round by updating the hash values (a, b, c, d) based on T1 and T2 outputs.
// It iterates through the calculations to refine the hash state.
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
    wire [15:0] T1_out; // Output from T1
    wire [15:0] T2_out; // Output from T2

    // Instantiate T1 and T2 modules
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

    integer i; // Loop counter
    reg [15:0] temp_a, temp_b, temp_c, temp_d; // Temporary variables for hash values

    // Always block for executing the hash generation process
    always @(*) begin
        temp_a = a; // Store current value of a
        temp_b = b; // Store current value of b
        temp_c = c; // Store current value of c
        temp_d = d; // Store current value of d

        // Loop through 7 iterations to refine the hash values
        for (i = 0; i < 7; i = i + 1) begin
            temp_a = T1_out + T2_out; // Update temp_a
            temp_b = temp_a;           // Update temp_b
            temp_c = temp_b + T1_out; // Update temp_c
            temp_d = temp_c;          // Update temp_d
        end

        // Assign final computed values to outputs
        a_out = temp_a;
        b_out = temp_b;
        c_out = temp_c;
        d_out = temp_d;
    end
endmodule
```
>## Test Bench

```
// This testbench code instantiates the MainModule and applies six 8-bit input values, representing the ASCII characters ’A’ to ’F’.
// It then observes four 16-bit output signals (a_out, b_out, c_out, d_out). After a 10-time unit delay, it displays the output values in binary format and terminates the simulation.
// The goal is to verify how the module processes these inputs.
module tb_MainModule;
    reg [7:0] in0; // Input register for ASCII A
    reg [7:0] in1; // Input register for ASCII B
    reg [7:0] in2; // Input register for ASCII C
    reg [7:0] in3; // Input register for ASCII D
    reg [7:0] in4; // Input register for ASCII E
    reg [7:0] in5; // Input register for ASCII F

    wire [15:0] a_out; // Output wire for hash value a
    wire [15:0] b_out; // Output wire for hash value b
    wire [15:0] c_out; // Output wire for hash value c
    wire [15:0] d_out; // Output wire for hash value d

    // Instantiate the MainModule under test (uut)
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
        // Initialize inputs with ASCII values for 'A' to 'F'
        in0 = 8'b01000001; // A
        in1 = 8'b01000010; // B
        in2 = 8'b01000011; // C
        in3 = 8'b01000100; // D
        in4 = 8'b01000101; // E
        in5 = 8'b01000110; // F

        #10; // Wait for 10 time units
        // Display output values
        $display("a_out: %b", a_out);
        $display("b_out: %b", b_out);
        $display("c_out: %b", c_out);
        $display("d_out: %b", d_out);
    end

    #10; // Additional wait before finishing
    $finish; // End the simulation
endmodule
```



</details>

