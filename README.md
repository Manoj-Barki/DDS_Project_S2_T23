# 4-digit number lock system

<!-- First Section -->
## Team Details
<details>
  <summary>Detail</summary>

  > Semester: 3rd Sem B. Tech. CSE

  > Section: S1

  > Member-1: Manoj Basappa Barki, 231CS233, manojbarki.231cs233@nitk.edu.in

  > Member-2: Chinmay R, 231CS218, chinmay.231cs218@nitk.edu.in

  > Member-3: Asish Puli Joy, 231CS244, asishpulijoy.231cs244@nitk.edu.in
</details>

<!-- Second Section -->
## Abstract
<details>
  <summary>Detail</summary>
  
   > Motivation: Now a days, lock systems are being digitalized. Most of them are
 software based which require microprocessors to implement the compilers and
 power supply can also act as a problem in the upcoming future. Microprocessors
 are made up of Silicon, Quartz and other chemicals which are getting depleted
 day by day. That’s why we have thought of an idea to make the locks completely
 out of hardware components like integrated circuits and logic gates.
> 
   > Problem Statement:  The project mainly focuses on the betterment of the environment
>  which is being depleted day by day and might not be there for our future
 generations to use. Since many precious substances like Silicon, Quartz are being
 depleted by the uprising technological era as everything around us is digitalizing.
 So, we are thinking of a design which might reduce the depletion of precious sub
stances as stated above. The usage of mostly hardware components and reducing
 the usage of complex programs that requires microprocessors and compilers to
 run.
  
   > Features:
   We are thinking of using 4 sets of 10 keys that represent every single
 digit decimal number and input them to 4 decimal to BCD converters which will
 be implemented using an encoder. the resulting set of inputs is then compared
 to a 16 bit number which is basically a BCD number that represents the correct
 password to crack the lock. A comparator is used in this deed and the lock opens
 when the given input is equal to the correct password.

</details>

<!-- Third Section -->
## Block Diagram
<details>
  <summary>Detail</summary>
  <img alt="S2-T23" src="https://github.com/user-attachments/assets/8af5dcde-2d99-46a1-8d1f-dbcb584847a9"></img>
</details>

<!-- Fourth Section -->
## Working
<details>
  <summary>Detail</summary>

  > Explain the working of your model with the help of a functional table (compulsory) followed by the flowchart.
</details>

<!-- Fifth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>
  <img alt="Logisim" src="![image](https://github.com/user-attachments/assets/9cb8b8e2-b737-4ad4-9b78-f4663a121b7c)"></img>


  
</details>

<!-- Sixth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>
  >module comp_1bit(a,b,lt,eq,gt); input a,b;
    output lt,gt,eq; 
    wire abar,bbar; 
    assign abar = ~a; 
    assign bbar = ~b;
    assign lt = abar & b; 
    assign gt = bbar & a; 
    assign eq = ~(lt|gt); 
endmodule

module comparator4(A,B,LT1,GT1,EQ1,LT2,GT2,EQ2); 
    input [3:0] A,B;
    input LT1,GT1,EQ1;
    output LT2,GT2,EQ2; 

    wire x30,x31,x32,x20,x21,x22,x10,x11,x12,x00,x01,x02; 
    wire x40,x41,x42,x50,x51,x52,x61,x62;
    comp_1bit c3(A[3],B[3],x30,x31,x32);
    comp_1bit c2(A[2],B[2],x20,x21,x22);
    comp_1bit c1(A[1],B[1],x10,x11,x12);
    comp_1bit c0(A[0],B[0],x00,x01,x02); 
    assign x40 = x31 & x20;
    assign x41 = x31 & x21 & x10; 
    assign x42 = x31 & x21 & x11 & x00; 
    assign x50 = x31 & x22;
    assign x51 = x31 & x21 & x12; 
    assign x52 = x31 & x21 & x11 & x02; 
    assign EQ = (x31 & x21 & x11 & x01); 
    assign EQ2 = EQ & EQ1;
    assign x61 = EQ & LT1; 
    assign x62 = EQ & GT1;
    assign LT2 = (x30 | x40 | x41 | x42) | x61; 
    assign GT2 = (x32 | x50 | x51 | x52) | x62; 
endmodule

module comp16(a,b,lt1,gt1,eq1); 
    input [15:0] a,b;
    output lt1,gt1,eq1; 
    parameter eq =1'b1; 
    parameter lt=1'b0; 
    parameter gt=1'b0;

    wire t11,t12,t13,t21,t22,t23,t31,t32,t33; comparator4 c1(a[3:0],b[3:0],lt,gt,eq,t11,t12,t13);
    comparator4 c2(a[7:4],b[7:4],t11,t12,t13,t21,t22,t23); 
    comparator4 c3(a[11:8],b[11:8],t21,t22,t23,t31,t32,t33); 
    comparator4 c4(a[15:12],b[15:12],t31,t32,t33,lt1,gt1,eq1); 
endmodule


module main; 
    reg [15:0] a,b; 
    wire lt1,gt1,eq1;
    comp16 test(a,b,lt1,gt1,eq1); 
    initial begin
        $monitor("%b %b %b %b %b",a,b,lt1,gt1,eq1);
        #10 a = 16'b0000111100001111; b = 16'b0011001100110011;
        #10 a = 16'b0000000000000000; b = 16'b0000000000000000;
    end
endmodule


module comparator(a,b,eq,gt,ls); 
    input [15:0]a,b;
    output reg eq,gt,ls; 
    always @(a,b) begin

        if(a==b)begin 
            eq=1; 
            gt=0; 
            ls=0;
        end


        else if(a>b) begin
            eq=0; 
            gt=1; 
            ls=0; 
        end


        else begin 
            eq=0; 
            gt=0; 
            ls=1;
        end

    end 
endmodule


  
</details>

## Verilog Test bench file

<details>
  <summary>Detail</summary>
  >
  module comparator_tb(); reg [15:0] a,b;
    wire eq,ls,gt;
    comparator m1(a,b,eq,gt,ls);
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,comparator_tb);
    end
    initial begin
        a=16'b0000000000000000; b=16'b0000000000000000;
        #10 a=16'b1000000000000000; b=16'b0000000000000001;
        #10 a=16'b0000000000000001; b=16'b1111111111111111;

    end 
endmodule

  
</details>
