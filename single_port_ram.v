`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2025 11:04:33 PM
// Design Name: 
// Module Name: single_port_ram
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


module single_port_ram #(parameter DATA_WIDTH =8 , ADDR_WIDTH =4)(
input clk , en ,
input [DATA_WIDTH -1 : 0]data_in,
input [ADDR_WIDTH - 1 : 0]addr,
output reg [DATA_WIDTH-1 : 0]data
    
); 
reg [DATA_WIDTH - 1 : 0] mem [2**ADDR_WIDTH -1 :0];

always@(posedge clk)begin 
if(en)
    mem[addr]<=data_in;
else
    data <= mem[addr];
    
    end     



endmodule
