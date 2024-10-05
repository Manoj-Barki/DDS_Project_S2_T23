# SMART RING WITH BODY VITAL SENSORS

<!-- First Section -->
## Team Details
<details>
  <summary>Detail</summary>

  > Semester: 3rd Sem B. Tech. CSE

  > Section: S2

  > Member-1: Manoj Basappa Barki , 231CS233 , manojbarki.231cs233@nitk.com 

  > member-2: Chinmay R , 231CS233 , chinmay.231cs218@nitk.edu.in

  > Member-3: Puli Asish Joy , 231CS244 , puliasishjoy.231cs244@nitk.edu.in
</details>

<!-- Second Section -->
## Abstract
<details>
  <summary>Detail</summary>
  
  1. Motivation: Now a days, lock systems are being digitalized. Most of them are
 software based which require microprocessors to implement the compilers and
 power supply can also act as a problem in the upcoming future. Microprocessors
 are made up of Silicon, Quartz and other chemicals which are getting depleted
 day by day. That’s why we have thought of an idea to make the locks completely
 out of hardware components like integrated circuits and logic gates.
 2. Problem Statement: The project mainly focuses on the betterment of the envi
ronment which is being depleted day by day and might not be there for our future
 generations to use. Since many precious substances like Silicon, Quartz are being
 depleted by the uprising technological era as everything around us is digitalizing.
 So, we are thinking of a design which might reduce the depletion of precious sub
stances as stated above. The usage of mostly hardware components and reducing
 the usage of complex programs that requires microprocessors and compilers to
 run.
 3. Features: We are thinking of using 4 sets of 10 keys that represent every single
 digit decimal number and input them to 4 decimal to BCD converters which will
 be implemented using an encoder. the resulting set of inputs is then compared
 to a 16 bit number which is basically a BCD number that represents the correct
 password to crack the lock. A comparator is used in this deed and the lock opens
 when the given input is equal to the correct password
</details>

<!-- Third Section -->
## Working
<details>
  <summary>Detail</summary>

   ### DESCRIPTION
The Smart Ring with Body Vital Sensors can be a very useful gadget as it can easily detect any chances of an heart attack and find the accurate oxygen levels required by the patient which is very vital to know to supply the right amount.
In our project, we are using the following components as listed below:
⦁ Three 8-bit comparator – Compare the 8-bit binary numbers with the fixed limits specified.

The following is the Verilog code for an 8-bit comparator:



⦁ One 8-bit Subtractor – To find the difference in the oxygen level and release 
                                       only the required amount of oxygen.

The Verilog code as follows:


⦁ 1 OR Gate                                                   

⦁ 1 AND GATE

In this project, A, B, C are inputs given by sensors that are being used, F1, F2, F3 and F4 are fixed limits (minimum or the maximum level for the respective reading) specified by us. Comparator C1 compares input A and fixed limit F1.
If its higher than the fixed limit it will show 1 else 0. Similarly Comparator C2 compares input B and fixed limit F2 and Comparator C3 compares input from subtractor with fixed limit F4 and gives the output 1 or 0. The 8-bit subtractor finds difference between input C and fixed limit F3. The outputs of C1 and C2 are connected to an OR Gate and the output from the OR Gate and the output from C3 gives us the final output which helps to detect the possibility of having heart attack, the major vitals which occur are body temperature, pulse rate or heart rate and body oxygen level. For sensing these body vitals, we use a temperature sensor, heart rate sensor and readings from an oxy-meter. We have fixed some limiting values which are the minimum or maximum levels for that reading. For temperature, the fixed limit is 37 degrees (0011011). For heart rate, it is 72 BPM (0110010). For oxygen level, the limiting value is 95 spo2 (10010101). Our main aim is to find any chances of heart attack and also provide emergency oxygen supply in order to give an extra crucial time for the health care to reach the patient.








---

### DESIGN:

The circuit works in the following manner:
1)	Start: The process initiates, aiming to compare two 8-bit binary numbers 
    input A and B.
2)	Input A and B: The values of the two binary numbers are provided as input    
   for the comparison process.
3)	Comparators 1 and 2: Both A and B undergo individual comparisons to  
   determine their relative magnitudes using two distinct comparators.
4) OR Gate: The results from the first two  
   comparators are then combined using an OR gate, generating a single output representing their comparative relationship.
5) Subtractor: The two 8-bit numbers, A and B, are utilized in an 8-bit 
   subtractor to find their numerical difference.
6) Comparator 3: The output of the subtractor 
   undergoes comparison with 0, 
   allowing an assessment of the relationship between A and B based on their 
   subtraction result.
7) AND Gate: The outputs of the OR gate and the third comparator are directed 
   to an AND gate, which performs a logical conjunction operation.
8) Output: The ultimate output from the AND gate represents the result of the 
   comparison operation, indicating the relationship between the two 8-bit 
   binary numbers A and B.
9) End: The process concludes, signifying the completion of the comparison 
  operation between the two 8-bit binary numbers.

This flowchart demonstrates a systematic process for comparing two 8-bit binary numbers, incorporating multiple stages of comparison and logical operations to produce the final comparison output.

### Flowchart
 ![image](https://github.com/Dhanush0804/DDS_Project_S2-T21/assets/148981102/888bfe17-be4e-4482-9e79-23abc042f4a2)

 ![image](https://github.com/Dhanush0804/DDS_Project_S2-T21/assets/148981102/d06069f7-10f6-4e73-83e3-853ef3290335)


 ---

### Truth Table:

#### Truth table for subtractor


 


#### Truth table for AND Gate           
|A 	 |B	|Output |
|----|--|---------| 
|   0	 |  0	|   0        |
|   0	 |  1	|   0        | 
|   1	 |  0	|   0        |
|   1	 |  1	|   1        |

#### Truth table for OR Gate
|A 	 |B	|Output |
|----|--|---------| 
|   0	 |  0	|   0        |
|   0	 |  1	|   1      | 
|   1	 |  0	|   1        |
|   1	 |  1	|   1        |


#### Truth table for comparator
|A1| A0 | B1 | B0 | 'A<B' |	'A=B' | 'A>B' |
|--|----|----|----|-------|-------|-------|
|0|	0	| 0|	 0|	  0|	     1|	     0
|0|	0	|0|	1|	1|	0|	0|
|0|	0|	1|	0|	1|	0|	0|
|0|	0|	1|	1|	1|	0|	0|
|0	|1	|0	|0	|0|	0|	1|
|0|	1|	0|	1|	0|	1|	0|
|0	|1	|1	|0	|1	|0	|0|
|0|	1|	1|	1|	1|	0|	0|
|1	|0	|0	|0	|0	|0	|1|
|1|	0|	0|	1|	0|	0|	1|
|1|	0|	1|	0|	0|	1|	0|
|1|	0|	1|	1|	1|	0|	0|
|1|	1|	0|	0|	0|	0|	1|


</details>

<!-- Fourth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>


 ![image](https://github.com/Dhanush0804/DDS_Project_S2-T21/assets/148981102/baf65af7-ca39-42ab-9e08-de3cc02dfb19)


  

</details>

<!-- Fifth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>

	// SMART RING WITH BODY VITAL SENSORS
	//S2_T21
	//1. 221CS217 , Dhanush V , dhanushv.221cs217@nitk.edu.in , 9353241312
	//2. 221CS222 , Harsha J Gundapalli , harshajgundapalli.221cs222@nitk.edu.in ,8792251009
	//3. 221CS226 , Isiri Dinesh S , isiridineshs.221cs226@nitk.edu.in , 7349437557
	
	module magComp (   //Module for an 8-bit comparator
	input [7:0] In1,
	input [7:0] In2,
	output Gt,
	);
	
	reg Gt;
	
	always @ (In1 or In2) // Check the state of the input lines
	begin
	Gt <= (In1 > In2) ? 1’b1 : 1’b0; // Check for greater than condition
	end module
	
	module full_adder(output cout, s , input a, b, cin); // Module for full_adder
	  assign S = a ^ b ^ cin;
	  assign Cout = (a & b) | (b & cin) | (a & cin);
	end module
	
	module subtractor(  //Module for 8-bit adder subtractor circuit
	    output cout,    //MSB, determines if answer is positive or negative
	    output [7:0] s,
	    input [7:0] a,
	    input [7:0] b,
	    input cin // if cin = 1, subtract, if cin = 0, add. 
	    );
	    
	    wire [7:0] bin; // bin XOR'ed with cin to get its compliment 
	    assign bin[0] = b[0]^cin;
	    assign bin[1] = b[1]^cin;
	    assign bin[2] = b[2]^cin;
	    assign bin[3] = b[3]^cin;
	    assign bin[4] = b[4]^cin;                          
	    assign bin[5] = b[5]^cin;
	    assign bin[6] = b[6]^cin;
	    assign bin[7] = b[7]^cin;
	    
	      
	    wire [8:1] carry; // subtraction using full adders
	     full_adder FA0(carry[1],s[0],a[0],bin[0],cin);
	     full_adder FA1(carry[2],s[1],a[1],bin[1],carry[1]);
	     full_adder FA2(carry[3],s[2],a[2],bin[2],carry[2]);
	     full_adder FA3(carry[4],s[3],a[3],bin[3],carry[3]);
	     full_adder FA4(carry[5],s[4],a[4],bin[4],carry[4]);
	     full_adder FA5(carry[6],s[5],a[5],bin[5],carry[5]);
	     full_adder FA6(carry[7],s[6],a[6],bin[6],carry[6]);
	     full_adder FA7(carry[8],s[7],a[7],bin[7],carry[7]);
	     
	     assign cout = cin^carry[8];// Final carry over 
	   
		end module

	module S2_T21(A,B,C,F1,F2,F3,F4,X,D,E)  // Final Module for the circuit 
		input [0:7] A; // Inputs given from the sensors
		input [0:7] B;
		input [0:7] C;
		input [0:7] F1; // Fixed inputs specified in advance
		input [0:7] F2;
		input [0:7] F3;
		input [0:7] F4;
		input X;
		output [0:7] D; // Gives us the amount of oxygen given out
		output E; // Tells us if it is an emergency or not 
  
	wire [0:5] w;
	magComp C1(A,F1,w[0]); // Check the temperature readings 
	magComp C2(B,F2,w[1]); // Check the heart rate readings
	subtractor S1(w[2],D,C,F3,X); // Difference in the oxygen level
	magComp C3(D,F4,w[3]); // Check with the critical limit
	OR O1(w[4],w[0],w[1]);
	AND A1(E,w[3],w[4]); // Tells is it an emergency or not 

	end module

---
### Test bench File
	// SMART RING WITH BODY VITAL SENSORS
	//S2_T21
	//1. 221CS217 , Dhanush V , dhanushv.221cs217@nitk.edu.in , 9353241312
	//2. 221CS222 , Harsha J Gundapalli , harshajgundapalli.221cs222@nitk.edu.in ,8792251009
	//3. 221CS226 , Isiri Dinesh S , isiridineshs.221cs226@nitk.edu.in , 7349437557
	
 	module S2_T21_tb;
	reg [0:7] A; // Inputs given from the sensors
	reg [0:7] B;
	reg [0:7] C;
	reg [0:7] F1; // Fixed inputs specified in advance
	reg [0:7] F2;
	reg [0:7] F3;
	reg [0:7] F4;
	reg X;
	wire [0:7] D; // Gives us the amount of oxygen given out
	wire E; // Tells us if it is an emergency or not 
	int i;
        
	S2_T21 M1(A,B,C,F1,F2,F3,F4,X,D,E);
	initial 
	begin
		$dumpfile("S2_T21.vcd");
		$dumpvars(0, S2_T21_tb);
	end 

	initial
	begin 

		$display("|                S2_T21                                                                                                                               
                                                                                                   |");
		$display("----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
		$display("|   Input                                                                                                                                                                                                
                                        | Output-1                                              | Output-2  |");
			
	$display("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
		$display("| A[0] | A[1] | A[2] | A[3] | A[4] | A[5] | A[6] | A[7] | B[0] | B[1] | B[2] | B[3] | B[4] | B[5] | B[6] | B[7] | C[0] | C[1] | C[2] | C[3] | C[4] | C[5] | C[6] | C[7] | D[0] | D[1] | D[2] | D[3] | D[4] | D[5] | D[6] | D[7] |     E     |");
		$display("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
		$monitor("| %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b | %b |", A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], B[0], B[1], B[2], B[3], B[4], B[5], B[6], B[7], C[0], C[1], C[2], C[3], C[4], C[5], C[6], C[7], D[0], D[1], D[2], D[3], D[4], D[5], D[6], D[7], E);
		

	A = 8'b00000000;
	B = 8'b00000000;
	C = 8'b00000000;
	F1 = 8'b00110111;
	F2 = 8'b01110010;
	F3 = 8'b10010101;
	F4 = 8'b00011000;
	for(i=1;i=255;i++)
	{
		#10 A = A + 8'b00000001;
		#10 B = B + 8'b00000001;
		#10 C = C + 8'b00000001;
	}
	end
	
	initial #300 $finish;
 	endmodule

 </details>

 ## References
 <details>
  <summary>Detail</summary>

 [1]	Hwang, Limsui, Zhao, “Wireless Heart Attack Detector with GPS”, ECE445. University of Illinois, Fall 2004, https://courses.ece.uiuc.edu/ece445/cgi-bin/view_project.pl?fall2004_24  
  
[2]	National Heart, Lung, and Blood Institute, Disease and Condition Index, “What Is Coronary Artery  Disease?”, August 2003, http://www.nhlbi.nih.gov/health/dci/Diseases/Cad/CAD_WhatIs.html  
  
[3]	ECG Library. 2002. http://www.ecglibrary.com/ecghome.html  
  
[4]	Wikipedia, the Free Encyclopedia, “RS-232”, April 30, 2005,  http://en.wikipedia.org/wiki/RS-232



 

</details>

