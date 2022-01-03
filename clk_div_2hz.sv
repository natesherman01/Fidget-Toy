module clk_div_2hz #(parameter COUNT = 23999999)(
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

Four Hz Clock Divider: clk_div_4hz.sv

module clk_div_4hz #(parameter COUNT = 11999999)(
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
