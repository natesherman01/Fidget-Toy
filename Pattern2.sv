module Pattern2(
    input CLK, 
    output logic [7:0] seg,
    output logic [3:0] an
    );
    
 typedef enum {one_top, two_top, three_top, four_top, four_TR, 
               four_mid, three_mid, two_mid, one_mid, one_BL, 
               one_bot, two_bot, three_bot, four_bot, four_BR, 
               four_mid2, three_mid2, two_mid2, one_mid2, one_TL} STATES;
 STATES NS;
 STATES PS = one_top;
       
always_ff @ (posedge CLK)
begin
       PS <= NS;
end

always_comb 
begin
    //initialize all outputs to zero
    case (PS)
    
        //FIRST DISPLAY
        one_top: begin
                NS = two_top;
                seg = 8'b01111111;
                an = 4'b1110;
        end
        two_top: begin
                NS = three_top;
                seg = 8'b01111111;
                an = 4'b1101;
        end
        three_top: begin
                NS = four_top;
                seg = 8'b01111111;
                an = 4'b1011;
        end
        four_top: begin
                NS = four_TR;
                seg = 8'b01111111;
                an = 4'b0111;
        end
        four_TR: begin
                NS = four_mid;
                seg = 8'b10111111;
                an = 4'b0111;
        end
        four_mid: begin
                NS = three_mid;
                seg = 8'b11111101;
                an = 4'b0111;
        end
        three_mid: begin
                NS = two_mid;
                seg = 8'b11111101;
                an = 4'b1011;
        end
        two_mid: begin
                NS = one_mid;
                seg = 8'b11111101;
                an = 4'b1101;
        end
        one_mid: begin
                NS = one_BL;
                seg = 8'b11111101;
                an = 4'b1110;
        end
        one_BL: begin
                NS = one_bot;
                seg = 8'b11110111;
                an = 4'b1110;
        end
        one_bot: begin
                NS = two_bot;
                seg = 8'b11101111;
                an = 4'b1110;
        end
        two_bot: begin
                NS = three_bot;
                seg = 8'b11101111;
                an = 4'b1101;
        end
        three_bot: begin
                NS = four_bot;
                seg = 8'b11101111;
                an = 4'b1011;
        end
        four_bot: begin
                NS = four_BR;
                seg = 8'b11101111;
                an = 4'b0111;
        end
        four_BR: begin
                NS = four_mid2;
                seg = 8'b11011111;
                an = 4'b0111;
        end
        four_mid2: begin
                NS = three_mid2;
                seg = 8'b11111101;
                an = 4'b0111;
        end
        three_mid2: begin
                NS = two_mid2;
                seg = 8'b11111101;
                an = 4'b1011;
        end
        two_mid2: begin
                NS = one_mid2;
                seg = 8'b11111101;
                an = 4'b1101;
        end
        one_mid2: begin
                NS = one_TL;
                seg = 8'b11111101;
                an = 4'b1110;
        end
        one_TL: begin
                NS = one_top;
                seg = 8'b11111011;
                an = 4'b1110;
        end
         
        
        
        //DEFAULT
        default: begin
            NS = one_top; 
            seg = 8'b01111111; 
            an = 4'b1110;    
            end     
    endcase
end
            
       
endmodule
