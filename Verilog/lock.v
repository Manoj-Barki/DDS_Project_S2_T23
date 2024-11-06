module comp_1bit(a,b,lt,eq,gt); input a,b;
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
