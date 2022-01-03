module Mux4_1 #(parameter WIDTH = 1)(
    input [WIDTH - 1:0] A, B, C, D,
    input [1:0] SEL,
    output logic [WIDTH - 1:0] mux_out
    );
      
    always_comb
    begin
    case(SEL)
        4'd0: mux_out = A;
        4'd1: mux_out = B;
        4'd2: mux_out = C;
        4'd3: mux_out = D;

        default: mux_out = 0;
    endcase
    end
endmodule
