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
