module FinalProject(
    input [1:0] sel,
    input CLK,
    input btn1,
    input btn2,
    input btn3,
    output [7:0] seg,
    output [3:0] an
    );
    
    logic two;
    logic four;
    logic eight;
    logic sixteen;
    logic t1;
    logic [7:0] fsm_seg1;
    logic [7:0] fsm_seg2;
    logic [7:0] fsm_seg3;
    logic [3:0] fsm_an1;
    logic [3:0] fsm_an2;
    logic [3:0] fsm_an3;
    
    clk_div_2hz clock2hz( .CLK(CLK), .SCLK(two));
    clk_div_4hz clock4hz( .CLK(CLK), .SCLK(four));
    clk_div_8hz clock8hz( .CLK(CLK), .SCLK(eight));
    clk_div_16hz clock16hz( .CLK(CLK), .SCLK(sixteen));
    
    Mux4_1 #(1) clk_mux( .A(two), .B(four), .C(eight), .D(sixteen), .SEL(sel), .mux_out(t1));
    
    Pattern pattern_display( .CLK(t1), .seg(fsm_seg1), .an(fsm_an1));
    Pattern2 pattern_display2( .CLK(t1), .seg(fsm_seg2), .an(fsm_an2));
    Pattern3 pattern_display3( .CLK(t1), .seg(fsm_seg3), .an(fsm_an3));
    
    Mux3_1 #(8) seg_mux( .A(fsm_seg1), .B(fsm_seg2), .C(fsm_seg3), .BTN1(btn1), .BTN2(btn2), .BTN3(btn3), .mux_out(seg));
    
    Mux3_1 #(4) an_mux( .A(fsm_an1), .B(fsm_an2), .C(fsm_an3), .BTN1(btn1), .BTN2(btn2), .BTN3(btn3), .mux_out(an));
    
endmodule
