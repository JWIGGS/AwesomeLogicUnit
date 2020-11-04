/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_adder_6 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] result,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  reg [15:0] sum;
  
  reg xb;
  
  always @* begin
    
    case (alufn[0+0-:1])
      1'h1: begin
        sum = a - b;
      end
      default: begin
        sum = a + b;
      end
    endcase
    result = sum;
    z = (~|sum);
    xb = b[15+0-:1] ^ alufn[0+0-:1];
    v = ((a[15+0-:1] & xb & ~sum[15+0-:1]) | (~a[15+0-:1] & ~xb & sum[15+0-:1]));
    n = sum[15+0-:1];
  end
endmodule
