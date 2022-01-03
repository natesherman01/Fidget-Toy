module Mux3_1 #(parameter WIDTH = 1)(
    input [WIDTH - 1:0] A, B, C,
    input BTN1,
    input BTN2,
    input BTN3,
    output logic [WIDTH - 1:0] mux_out
    );
      
    always_comb
    begin
    if (BTN1)
        mux_out = A;
    else if (BTN2)
        mux_out = B;
    else if (BTN3)
        mux_out = C; 
    else
        mux_out = 0;
    
    end
endmodule
