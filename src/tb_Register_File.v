

module tb_Register_File; 

	parameter WIDTH = 32;
	parameter BITS = 5;

	reg clk = 0;
	reg reset;
	reg Reg_Write;
	reg  [BITS-1:0]  Write_Register;
	reg  [BITS-1:0]  Read_Register_1;
	reg  [BITS-1:0]  Read_Register_2;
	reg  [WIDTH-1:0] Write_Data;
	wire [WIDTH-1:0] Read_Data_1;
	wire [WIDTH-1:0] Read_Data_2;
  
Wrapper_Register_File #(.WIDTH(32)) UUT (.rs(Write_Register), .rt(Read_Register_1),
			.rd(Read_Register_2), .R_rd(Write_Data), .clock(clk), .reset(reset),
			.Reg_Write_i(Reg_Write), .R_rs(Read_Data_1), .R_rt(Read_Data_2));
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk = !clk;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset = 0;
	#5 reset = 1;
end

initial begin
	#0  Reg_Write = 0;
	#5  Reg_Write = 5;
	#10 Reg_Write = 0;
	#20 Reg_Write = 1;
		
end


initial begin
	#0  Read_Register_1 =  0;
	#4  Read_Register_1 =  0;
	#70 Read_Register_1 =  2;
	#10 Read_Register_1 =  4;
	#10 Read_Register_1 = 25;
	#10 Read_Register_1 = 31;

end


initial begin
	#0  Read_Register_2 =  0;
	#4  Read_Register_2 =  0;
	#70 Read_Register_2 =  2;
	#10 Read_Register_2 =  4;
	#10 Read_Register_2 = 25;
	#10 Read_Register_2 = 31;

end

initial begin
	#0  Write_Register =  0;
	#4  Write_Register =  0;
	#10 Write_Register =  2;
	#10 Write_Register =  4;
	#10 Write_Register = 25;
	#10 Write_Register = 31;

end

/*********************************************************/
initial begin // reset generator
	#0  Write_Data =  3;
	#4  Write_Data =  3;
	#10 Write_Data =  7;
	#10 Write_Data = 20;
	#10 Write_Data =  6;
	#10 Write_Data = 78;
end

/*********************************************************/
endmodule