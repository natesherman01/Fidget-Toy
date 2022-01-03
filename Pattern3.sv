module Pattern3(
    input CLK, 
    output logic [7:0] seg,
    output logic [3:0] an
    );
    
 typedef enum {S_top, S_topR, S_botR, S_bot, S_botL, S_topL, S_top2,
               S2_top, S2_topR, S2_botR, S2_bot, S2_botL, S2_topL, S2_top2} STATES;
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
    
        //FIRST AND THIRD DISPLAY
        S_top: begin
                NS = S_topR;
                seg = 8'b01111111;
                an = 4'b1010;  
        end
        S_topR: begin
                NS = S_botR;
                seg = 8'b10111111;
                an = 4'b1010;  
        end
        S_botR: begin
                NS = S_bot;
                seg = 8'b11011111;
                an = 4'b1010;    
        end
        S_bot:begin
            NS = S_botL;
            seg = 8'b11101111;
            an = 4'b1010;    
        end
        S_botL:begin
            NS = S_topL;
            seg = 8'b11110111;
            an = 4'b1010;   
        end
        S_topL:begin
            NS = S_top2;
            seg = 8'b11111011;
            an = 4'b1010;   
        end
        S_top2: begin
                NS = S2_top;
                seg = 8'b01111111;
                an = 4'b1010;  
        end
        
        //SECOND AND FOURTH DISPLAY
        S2_top: begin
                NS = S2_topR;
                seg = 8'b01111111;
                an = 4'b0101;  
        end
        S2_topR: begin
                NS = S2_botR;
                seg = 8'b10111111;
                an = 4'b0101; 
        end
        S2_botR: begin
                NS = S2_bot;
                seg = 8'b11011111;
                an = 4'b0101;     
        end
        S2_bot:begin
            NS = S2_botL;
            seg = 8'b11101111;
            an = 4'b0101;     
        end
        S2_botL:begin
            NS = S2_topL;
            seg = 8'b11110111;
            an = 4'b0101;   
        end
        S2_topL:begin
            NS = S2_top2;
            seg = 8'b11111011;
            an = 4'b0101;   
        end
        S2_top2: begin
                NS = S_top;
                seg = 8'b01111111;
                an = 4'b0101;  
        end
         
        
        
        //DEFAULT
        default: begin
            NS = S_top; 
            seg = 8'b01111111; 
            an = 4'b1010;    
            end     
    endcase
end
            
       
endmodule
