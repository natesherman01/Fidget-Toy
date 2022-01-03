module clk_div_8hz #(parameter COUNT = 5999999)(
    input CLK,
    output logic SCLK = 0
    );
    
    logic [31:0] count = 0;
    always_ff @ (posedge CLK)
    begin
        if (count == COUNT -1 )
        begin
            SCLK <= ~SCLK;
            count <= 0;
        end
        else
            count <= count + 1;
    end
        
endmodule
