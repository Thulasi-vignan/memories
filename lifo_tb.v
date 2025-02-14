`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2025 10:08:31 PM
// Design Name: 
// Module Name: lifo_tb
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


module lifo_tb#(parameter DATA_WIDTH = 8 , DEPTH =16)();
reg clk , rst ,push , pop;
reg [DATA_WIDTH -1 :0]data_in;
wire full,empty;
wire [DATA_WIDTH -1 :0]data_out;

lifo #(.DATA_WIDTH(DATA_WIDTH),.DEPTH(DEPTH)) uut (.clk(clk),.rst(rst),.push(push),.pop(pop),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty));

always #5 clk = ~ clk;

initial begin 
    clk = 0;
    rst = 1; push = 0; pop = 0; data_in = 0;
    
    #10 rst = 0 ;
     push = 1;
     for (integer i = 0 ; i < 5 ; i = i + 1)begin 
        data_in <= i;
      #10;
      end 
      
      push = 0 ;
      
      pop = 1;
     #100
      pop = 0;
    
     #10 $finish;
end 


endmodule
