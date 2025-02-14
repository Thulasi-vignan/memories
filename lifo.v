`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2025 09:53:30 PM
// Design Name: 
// Module Name: lifo
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


module lifo #(parameter DEPTH = 16, DATA_WIDTH = 16)(
    input clk , rst, push, pop,
    input [DATA_WIDTH -1 :0]data_in,
    output reg [DATA_WIDTH -1 :0]data_out,
    output reg full, empty

    );
    
    reg [DATA_WIDTH - 1 : 0]lifo_mem[0:DEPTH-1];
    reg [$clog2(DATA_WIDTH - 1):0]sp;
    
    always@(posedge clk)begin 
    if (rst)begin 
        sp<=0;
        full <= 0;
        empty <= 1;
    end 
     else begin 
        if (push && !full)begin 
            lifo_mem[sp] <= data_in;
            sp<=sp+1;
            empty <=0;
            if(sp == DEPTH-1)
                full <= 1;
         end 
         else
            if(pop && !empty)begin
            sp <= sp-1; 
            data_out <= lifo_mem[sp-1];
            full <= 0;
            if (sp == 1)
                empty <= 1;
            end 
      end 
    end 

endmodule
