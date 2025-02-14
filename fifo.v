`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2024 04:00:44 PM
// Design Name: 
// Module Name: fifo
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

module sync_fifo #(parameter DATA_WIDTH = 8,DEPTH = 16)(
input clk ,rd_en ,wr_en,rst,
input [DATA_WIDTH -1 : 0]data_in,
output reg[DATA_WIDTH - 1 : 0]data_out,
output reg full,empty 
);

reg [DATA_WIDTH - 1 : 0] fifo_mem[0 :DEPTH - 1];
reg [$clog2(DATA_WIDTH):0]rd_ptr;
reg [$clog2(DATA_WIDTH):0]wr_ptr;
reg [$clog2(DATA_WIDTH):0]count;

always@(posedge clk)begin 
if(rst) begin 
    wr_ptr <= 0;
    rd_ptr<=0;
    data_out<=0;
    count<=0;
    full<=0;
    empty <=1;
    end 
    
    else 
        begin
       
         if(wr_en && !full)begin 
            fifo_mem[wr_ptr]<= data_in;
            wr_ptr <= wr_ptr+1;
            count <= count+1;  
         end    
        if(rd_en && !empty) begin 
            data_out <= fifo_mem[rd_ptr];
            rd_ptr <= rd_ptr+1;
            count <= count-1;
         end      
       full <= (count == DEPTH);
       empty <=(count == 0);
     end 
end 
     
     
endmodule
     

