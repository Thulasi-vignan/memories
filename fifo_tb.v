`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2025 05:09:02 PM
// Design Name: 
// Module Name: fifo_tb
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


module sync_fifo_tb#(parameter DATA_WIDTH = 8, DEPTH = 16)();
reg clk ,rst,rd_en,wr_en;
reg [DATA_WIDTH - 1 :0]data_in;
wire full , empty;
wire [DATA_WIDTH - 1 : 0]data_out;

sync_fifo #(.DATA_WIDTH(DATA_WIDTH),.DEPTH(DEPTH)) uut (.clk(clk),.rst(rst),.rd_en(rd_en),.wr_en(wr_en),.data_in(data_in),.full(full),.empty(empty),.data_out(data_out));
always#5 clk = ~clk;

initial begin 
clk = 0;

rst = 1 ;wr_en = 0 ; rd_en = 0 ; data_in = 0 ;
#10 rst = 0;

repeat(5)begin 
@(posedge clk)
    wr_en = 1 ; rd_en = 0 ;
    data_in = $random %256;
   end 
 wr_en = 0 ;
 
 repeat(5)begin 
 @(posedge clk)
 wr_en = 0; rd_en = 1;
 end 
 rd_en = 0;
 #10 $finish;
 end    

endmodule

