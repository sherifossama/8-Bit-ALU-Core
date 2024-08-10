module proj (
  //inputs
  input [7:0] A ,B , 
  input [3:0] s ,
  input  clk ,
  input R_W,
  input rst,
  //outputs
  output reg [7:0]F ,
  output  zeroflag , CarryOut, overflow ,
  output  EQ , GT ,LT 
    
  
); 
 
 reg  [7:0] result ;
 reg [8:0] temp ;
 
always @(*)
  begin
  
   if (s == 4'b0000) begin
   temp = A+B;
	result = temp[7:0];
	end
	
	else if (s == 4'b0001) begin
	temp = A-B;
	result = temp[7:0];
	end
	
	else
	   begin
      case (s)
		
        4'b0011 : result = ~B+1 ;
	
        4'b1000 : result = A&B ;
        4'b1001 : result = A^B ;
        4'b1010 : result = A|B ;
        4'b1011 : result = ~B ;
        
        4'b1100 : result = {A[0], A[7:1]};          // Right rotate 
        4'b1101 : result = {A[7:1], A[0]};          // Left rotate 
        4'b1110 : result = {A[6:0], 1'b0};          // Right shift 
        4'b1111 : result = {1'b0, A[7:1]};          // Left shift 
      endcase
		end
  end
  
  //assign  F = result ;
  //assign  temp = {8'b0,A} + {8'b0,B};
  assign  CarryOut = temp[8];               
  assign  zeroflag = (result == 8'b0);
  assign  overflow = ((A[7]==B[7]) && (result[7] != A[7])) ; // Overflow detection for add/sub
  assign  GT = ( A > B )? 1'b1 : 1'b0; 
  assign  LT = ( A < B )? 1'b1 : 1'b0; 
  assign  EQ = ( A == B)? 1'b1 : 1'b0; 
  
  always @(posedge clk or negedge rst )
        begin 
            if(!rst)
                begin
                  F <= 1'b0 ;
                end 
            else
              begin
                  if(R_W)
                      begin
                        F = result ;
                      end
                
              end     
        end
        
endmodule




