/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module test_manager_5 (
    input clk,
    input rst,
    input test_paused,
    output reg [15:0] valueA,
    output reg [15:0] valueB,
    output reg [5:0] alufn,
    output reg [15:0] result,
    output reg t,
    output reg z,
    output reg v,
    output reg n,
    output reg [5:0] current_case
  );
  
  
  
  localparam TEST_CASE_INOUT = 1056'h00aa00ff01a940004000800000aa00ffffab7530d8f09c40aaaacccc8888aaaacccceeeeaaaacccc6666aaaaccccaaaaaaaaaaaa0001aaaaaaa800000001400000014000000100004000400000014000000100000f0f000378780f0f000301e10f0f000301e18f0f0003f1e100aa00cc87787530d8f09c417530d8f08000aaaacccc0000;
  
  localparam TEST_CASE_ALUFN = 132'h00004161e59acf3d75df78218e3881058;
  
  localparam TEST_CASE_TZVN = 88'h8b9b000000000000000bc0;
  
  localparam TEST_CASE_DELAY_TIME = 5'h1c;
  
  reg [27:0] M_test_case_delay_d, M_test_case_delay_q = 1'h0;
  
  reg [5:0] M_current_test_d, M_current_test_q = 1'h0;
  
  always @* begin
    M_test_case_delay_d = M_test_case_delay_q;
    M_current_test_d = M_current_test_q;
    
    if (~test_paused) begin
      M_test_case_delay_d = M_test_case_delay_q + 1'h1;
      if (M_test_case_delay_q[27+0-:1]) begin
        M_test_case_delay_d = 1'h0;
        if (M_current_test_q + 1'h1 >= 5'h16) begin
          M_current_test_d = 1'h0;
        end else begin
          M_current_test_d = M_current_test_q + 1'h1;
        end
      end
    end
    valueA = TEST_CASE_INOUT[(M_current_test_q)*48+32+15-:16];
    valueB = TEST_CASE_INOUT[(M_current_test_q)*48+16+15-:16];
    result = TEST_CASE_INOUT[(M_current_test_q)*48+0+15-:16];
    alufn = TEST_CASE_ALUFN[(M_current_test_q)*6+0+5-:6];
    t = TEST_CASE_TZVN[(M_current_test_q)*4+3+0-:1];
    z = TEST_CASE_TZVN[(M_current_test_q)*4+2+0-:1];
    v = TEST_CASE_TZVN[(M_current_test_q)*4+1+0-:1];
    n = TEST_CASE_TZVN[(M_current_test_q)*4+0+0-:1];
    current_case = M_current_test_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_test_case_delay_q <= 1'h0;
    end else begin
      M_test_case_delay_q <= M_test_case_delay_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_current_test_q <= 1'h0;
    end else begin
      M_current_test_q <= M_current_test_d;
    end
  end
  
endmodule
