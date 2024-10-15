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
> The motivation behind this project is to address the performance bottlenecks
faced by software implementations of the SHA-256 hash function, especially in resource-
constrained environments like embedded systems and IoT devices. By implementing SHA-
256 in hardware, we aim to achieve significant improvements in processing speed and power
efficiency, which are critical for optimizing security and performance in these applications.
  
   > ## Problem Statement:
> Traditional software implementations of SHA-256 can suffer from performance
limitations, particularly in systems with strict timing and power requirements. This
creates challenges for applications that require both robust security and efficient performance,
highlighting the need for a more effective solution.
  
   > ## Features:
> <br>• Hardware implementation of the SHA-256 algorithm.
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

><img alt="Main Module" src="https://github.com/user-attachments/assets/ebbba9e2-6b5f-4b04-b7c7-65efed04a990"><img/>



><img alt="Padding" src="https://github.com/user-attachments/assets/3696e794-8b66-4613-8aec-90f647cca45e"><img/>



><img alt="Ws" src="https://github.com/user-attachments/assets/6d092195-e13e-492d-8fee-1431882cda03"><img/>



><img alt="Small Sigma Function" src="https://github.com/user-attachments/assets/52955470-6dff-4340-9a25-753681596404"><img/>



><img alt="Upcounter" src="https://github.com/user-attachments/assets/705511ca-8e32-4a50-a426-46a967f6f5ac"><img/>



><img alt="Hash Generator" src="https://github.com/user-attachments/assets/e0e0dd9a-05d3-4a97-8c2c-b655835bbf9c"><img/>


><img alt="Sigma 0" src="https://github.com/user-attachments/assets/40d1ea6e-ce96-4abe-9c6d-5904d353d935"><img/>

><img alt="Sigma 1" src="https://github.com/user-attachments/assets/46ea875a-3dbd-4a7d-9b21-b01484237720"><img/>


><img alt="T1" src="https://github.com/user-attachments/assets/ff9e220e-3c0a-485d-81fe-1301544b6d4a"><img/>



><img alt="T2" src="https://github.com/user-attachments/assets/63b652c3-aee4-48ee-b07f-d5f4285d4580"><img/>


><img alt="Last Upcounter" src="https://github.com/user-attachments/assets/edb18203-5406-4726-a2ac-80e78187a23d"><img/>


><img alt="Last Upcounter" src="https://github.com/user-attachments/assets/125535f4-8cba-43f7-8cef-202d5b2fbfb6"><img/>




</details>

<!-- Sixth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>

  > Neatly update the Verilog code in code style only.
</details>


