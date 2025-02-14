`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2025 11:42:25 PM
// Design Name: 
// Module Name: single_port_ram_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module single_port_ram_tb#(parameter DATA_WIDTH = 8 , ADDR_WIDTH = 4)();
reg clk,en;
reg [DATA_WIDTH -1 : 0]data_in;
reg [ADDR_WIDTH -1 :0]addr;
wire [DATA_WIDTH -1 : 0]data;

single_port_ram # (.DATA_WIDTH(DATA_WIDTH) , .ADDR_WIDTH(ADDR_WIDTH)) uut (.clk(clk),.en(en),.data_in(data_in),.addr(addr),.data(data));
always #5 clk = ~ clk;

initial begin 
clk = 0; 

en = 1;
for(integer i = 0 ; i < 5 ; i = i + 1)begin 
    addr <= i; 
    data_in <= $random;
    #10;
   end 
   en = 0;
   for(integer i = 5 ; i >0 ; i = i - 1)begin 
    addr <= i;
    #10;
   end   
   
#20 $finish;
end
endmodule
