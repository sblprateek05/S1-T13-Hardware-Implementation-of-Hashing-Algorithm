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
  
   > Motivation: The motivation behind this project is to address the performance bottlenecks
faced by software implementations of the SHA-256 hash function, especially in resource-
constrained environments like embedded systems and IoT devices. By implementing SHA-
256 in hardware, we aim to achieve significant improvements in processing speed and power
efficiency, which are critical for optimizing security and performance in these applications.
  
   > Problem Statement: Traditional software implementations of SHA-256 can suffer from performance
limitations, particularly in systems with strict timing and power requirements. This
creates challenges for applications that require both robust security and efficient performance,
highlighting the need for a more effective solution.
  
   > Features:
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

> 1.	Input Handling:
<br>•	The system takes 6 ASCII values, each 8 bits long. These values are paired to form 16-bit message blocks:
> M0 = {in0, in1}
> M1 = {in2, in3}
> M2 = {in4, in5}
<br>•	A fourth block, M3, holds the number of non-zero inputs to define the length of the message.
<br>•	The blocks M0, M1, M2, and M3 form the input message.

> 2.	Message Expansion:
•	The input message blocks are expanded into 8 words (W0 to W7) using the following equations:
–	For W0 to W3:
W(t) = M(t) for 0 <= t <= 3.
This means W0 = M0, W1 = M1, W2 = M2, and W3 = M3.
–	For W4 to W7:
W(t) = small sigma(W(t-3)) + W(t-1) for 4 <= t <= 7. The small sigma function is defined as:
small sigma(x) = ROT11(x) ˆ ROT7(x) ˆ RSH3(x), where:
∗ ROT11(x) is a rotation of x by 11 bits,
∗ ROT7(x) is a rotation by 7 bits,
∗ RSH3(x) is a right shift by 3 bits.

> 3.	Initial Hash Values (a, b, c, d):
•	The initial hash values a, b, c, and d are constants derived from the first 16 bits of the decimal part of the square roots of the first 4 prime numbers:
– a = 0110101000001001 (square root of 2),
– b = 1011101101100111 (square root of 3),
– c = 0011110001101110 (square root of 5),
– d = 1010010101001111 (square root of 7).


> 4.	Round Constants (K[0] to K[7]):
•	Predefined constants K[0] to K[7] are used during the hash generation to introduce com- plexity. These constants are the first 16 bits of the decimal part of the cube roots of the first 8 prime numbers. Specifically:
– K[0] = 0100001010001010 (cube root of 2),
– K[1] = 0111000100110111 (cube root of 3),
– K[2] = 1011010111000000 (cube root of 5),
– K[3] = 1110100110110101 (cube root of 7),
– K[4] = 0011100101010110 (cube root of 11),
– K[5] = 0101100111110001 (cube root of 13),
– K[6] = 1001001000111111 (cube root of 17),
– K[7] = 1010101100011100 (cube root of 19).

> 5.	Hash Computation:
•	The algorithm performs 8 rounds of computation, transforming the values of a, b, c, and d using two main operations:
 
–	T1 Calculation:
T1 = Sigma1(c) + CH(b, c, d) + W(t) + K(t) + d where Sigma1(x) :
Sigma1(x) = ROT2(x) + ROT7(x)
–	T2 Calculation:
T2 = Sigma0(a) + MAJ(a, b, c) where Sigma0(x) :
Sigma0(x) = ROT5(x) + ROT11(x)
•	These transformations are applied for each of the 8 words (W0 to W7), updating the values of a, b, c, and d in each round as shown below :
•	d = c
•	c = b+T1
•	b = a
•	a= T1 + T2
> 6.	Final Hash Value:
•	After completing the 8 rounds, the final values of a, b, c, and d are combined to form the
64-bit hash.
•	This 64-bit hash is converted into ASCII format for output display.
>Operational Steps:
1.	Click Refresh:
•	This clears the output screen, resets the message blocks to zero, and sets all counters to zero.
2.	Clock Pulse 1:
•	Apply Clock Pulse 1 until all input characters are read, or click until Counter Display 1 reaches 7.
3.	Clock Pulse 2:
•	Apply Clock Pulse 2 until Counter Display 2 reaches 7, indicating that the words are ready.
4.	Clock Pulse 3:
•	Apply Clock Pulse 3 until Counter Display 3 reaches 8, showing the final 8 characters of the 64-bit hash on the output screen.

</details>

<!-- Fifth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>

  > Update a neat logisim circuit diagram
</details>

<!-- Sixth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>

  > Neatly update the Verilog code in code style only.
</details>


