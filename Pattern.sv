module Pattern(
    input CLK, 
    output logic [7:0] seg,
    output logic [3:0] an
    );
    
 typedef enum {S_top, S_topR, S_botR, S_bot, S_botL, S_topL, S_mid, S_top2, S_mid2, 
               S2_top, S2_topR, S2_botR, S2_bot, S2_botL, S2_topL, S2_mid, S2_top2, S2_mid2,
               S3_top, S3_topR, S3_botR, S3_bot, S3_botL, S3_topL, S3_mid, S3_top2, S3_mid2,
               S4_top, S4_topR, S4_botR, S4_bot, S4_botL, S4_topL, S4_mid, S4_top2, S4_mid2} STATES;
 STATES NS;
 STATES PS = S_top;
       
always_ff @ (posedge CLK)
begin
       PS <= NS;
end

always_comb 
begin
    //initialize all outputs to zero
    case (PS)
    
        //FIRST DISPLAY
        S_top: begin
                NS = S_topR;
                seg = 8'b01111111;
                an = 4'b1110;
        end
        S_topR: begin
                NS = S_mid;
                seg = 8'b10111111;
                an = 4'b1110;
        end
        S_mid:begin
            NS = S_botL;
            seg = 8'b11111101;
            an = 4'b1110;   
        end
        S_botL:begin
            NS = S_bot;
            seg = 8'b11110111;
            an = 4'b1110;  
        end
        S_bot:begin
            NS = S_botR;
            seg = 8'b11101111;
            an = 4'b1110;   
        end
        S_botR: begin
                NS = S_mid2;
                seg = 8'b11011111;
                an = 4'b1110;   
        end
        S_mid2:begin
            NS = S_topL;
            seg = 8'b11111101;
            an = 4'b1110;   
        end
        S_topL:begin
            NS = S_top2;
            seg = 8'b11111011;
            an = 4'b1110;   
        end
        S_top2: begin
                NS = S2_top;
                seg = 8'b01111111;
                an = 4'b1110;
        end

        
        //SECOND DISPLAY
        S2_top: begin
                NS = S2_topR;
                seg = 8'b01111111;
                an = 4'b1101;
        end
        S2_topR: begin
                NS = S2_mid;
                seg = 8'b10111111;
                an = 4'b1101;
        end
        S2_mid:begin
            NS = S2_botL;
            seg = 8'b11111101;
            an = 4'b1101;   
        end
        S2_botL:begin
            NS = S2_bot;
            seg = 8'b11110111;
            an = 4'b1101;  
        end
        S2_bot:begin
            NS = S2_botR;
            seg = 8'b11101111;
            an = 4'b1101;   
        end
        S2_botR: begin
                NS = S2_mid2;
                seg = 8'b11011111;
                an = 4'b1101;   
        end
        S2_mid2:begin
            NS = S2_topL;
            seg = 8'b11111101;
            an = 4'b1101;   
        end
        S2_topL:begin
            NS = S2_top2;
            seg = 8'b11111011;
            an = 4'b1101;   
        end
        S2_top2: begin
                NS = S3_top;
                seg = 8'b01111111;
                an = 4'b1101;
        end
        
        //THIRD DISPLAY
        S3_top: begin
                NS = S3_topR;
                seg = 8'b01111111;
                an = 4'b1011;
        end
        S3_topR: begin
                NS = S3_mid;
                seg = 8'b10111111;
                an = 4'b1011;
        end
        S3_mid:begin
            NS = S3_botL;
            seg = 8'b11111101;
            an = 4'b1011;   
        end
        S3_botL:begin
            NS = S3_bot;
            seg = 8'b11110111;
            an = 4'b1011;  
        end
        S3_bot:begin
            NS = S3_botR;
            seg = 8'b11101111;
            an = 4'b1011;   
        end
        S3_botR: begin
                NS = S3_mid2;
                seg = 8'b11011111;
                an = 4'b1011;   
        end
        S3_mid2:begin
            NS = S3_topL;
            seg = 8'b11111101;
            an = 4'b1011;   
        end
        S3_topL:begin
            NS = S3_top2;
            seg = 8'b11111011;
            an = 4'b1011;   
        end
        S3_top2: begin
                NS = S4_top;
                seg = 8'b01111111;
                an = 4'b1011;
        end
        
        //FOURTH DISPLAY
        S4_top: begin
                NS = S4_topR;
                seg = 8'b01111111;
                an = 4'b0111;
        end
        S4_topR: begin
                NS = S4_mid;
                seg = 8'b10111111;
                an = 4'b0111;
        end
        S4_mid:begin
            NS = S4_botL;
            seg = 8'b11111101;
            an = 4'b0111;   
        end
        S4_botL:begin
            NS = S4_bot;
            seg = 8'b11110111;
            an = 4'b0111; 
        end
        S4_bot:begin
            NS = S4_botR;
            seg = 8'b11101111;
            an = 4'b0111;   
        end
        S4_botR: begin
                NS = S4_mid2;
                seg = 8'b11011111;
                an = 4'b0111;  
        end
        S4_mid2:begin
            NS = S4_topL;
            seg = 8'b11111101;
            an = 4'b0111;  
        end
        S4_topL:begin
            NS = S4_top2;
            seg = 8'b11111011;
            an = 4'b0111;   
        end
        S4_top2: begin
                NS = S_top;
                seg = 8'b01111111;
                an = 4'b0111;
        end
        
        //DEFAULT
        default: begin
            NS = S_top; 
            seg = 8'b01111111; 
            an = 4'b1110;    
            end     
    endcase
end
            
endmodule
