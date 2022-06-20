`timescale 1ns/1ns
module FSM_Testbench();

wire [0:0] z;
reg w;
reg rst;
reg clk;
parameter inputsequence0 = 32'b11010001101110100110111010011001;
parameter inputsequence1 = 32'b11010011010111010011011101001101;
parameter inputsequence2 = 32'b11010011011101001101111101001101;
parameter inputsequence3 = 32'b00110100110111010011011101001101;
parameter inputsequence4 = 32'b01101001101011010011011101001101;
integer i;

FSM fsm(z, w, clk, rst);

initial begin
    $dumpfile("TimingDiagram.vcd");
    $dumpvars(0, z, w, rst, clk, fsm);
    
    rst = 1;
    w = 0;
    #30;
    rst = 0;
    
    for (i=31; i>=0; i--) begin
        w = inputsequence0[i];
        #40;
    end
	
	    
	rst = 1;
    w = 0;
    #30;
    rst = 0;
    
    for (i=31; i>=0; i--) begin
        w = inputsequence1[i];
        #40;
    end
	
	    
	rst = 1;
    w = 0;
    #30;
    rst = 0;
    
    for (i=31; i>=0; i--) begin
        w = inputsequence2[i];
        #40;
    end
	
	    
	rst = 1;
    w = 0;
    #30;
    rst = 0;
    
    for (i=31; i>=0; i--) begin
        w = inputsequence3[i];
        #40;
    end
	
	    
	rst = 1;
    w = 0;
    #30;
    rst = 0;
    
    for (i=31; i>=0; i--) begin
        w = inputsequence4[i];
        #40;
    end
    
    $finish;
end

always begin	
	clk = 0;
	#20;
	clk = 1;
	#20;
end

endmodule
