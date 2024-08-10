module projtb;
  reg [7:0] A,B;
  reg [3:0] s;
  reg clk;
  reg R_W;
  reg rst;
  wire [7:0] F;
  wire zeroflag, CarryOut, overflow, EQ, GT, LT;
  //integer i ;
  proj DUT (
    .A(A),
    .B(B),
    .s(s),
    .clk(clk),
    .R_W(R_W),
    .rst(rst),
    .F(F),
    .zeroflag(zeroflag),
    .CarryOut(CarryOut),
    .overflow(overflow),
    .EQ(EQ),
    .GT(GT),
    .LT(LT)
  );
  
  initial begin
  clk=0;

     forever #1 clk = ~clk;
  end

  initial begin
  
  A = 8'b0; B = 8'b0;s = 0000;
  R_W=1;
  rst=1;
  #1 
  R_W=0;
  rst=0;
  #1
  R_W=1;
  rst=1;
  

      $dumpfile("voter_tb.vcd");  // >
      $dumpvars(0, DUT);

    $monitor("%d %b %b %b %b %b %b %b %b %b %b %b ", $time, A, B, s, clk, F, zeroflag, CarryOut, overflow, EQ, GT, LT);

  //add
   A = 8'b0; B = 8'b0;                s = 4'b0000;
    #5;
   A = 8'b11111111; B = 8'b11111111;  s = 4'b0000;
    #5;
    A = 8'b00001000; B = 8'b00000010;  s = 4'b0000; 
    #5;
  //sub
    A = 8'b0; B = 8'b0;                s = 4'b0001;
    #5;
    A = 8'b11110000; B = 8'b11110000;  s = 4'b0001;
    #5;
    A = 8'b00001000; B = 8'b00000010;  s = 4'b0001; 
    #5;
    A = 8'b00000010; B = 8'b00001000;  s = 4'b0001;
    #5;
    A = 8'b11111111; B = 8'b11111111;  s = 4'b0001;
    #5;
    
    A = 8'b11111111; B = 8'b11111111; s = 4'b0001;
    
    //2's complement
     B = 8'b0;                s = 4'b0011;
    #5;
     B = 8'b11111111;  s = 4'b0011;
    #5;
     B = 8'b00000010;  s = 4'b0011; 
    #5;
    
    //AND
    A = 8'b0; B = 8'b0;                s = 4'b1000;
    #5;
    A = 8'b00001000; B = 8'b00000010;  s = 4'b1000; 
    #5;
    //XOR
    A = 8'b0; B = 8'b0;                s = 4'b1001;
    #5;
    A = 8'b11111111; B = 8'b11111111;  s = 4'b1001;
    #5;
    A = 8'b00001000; B = 8'b00000010;  s = 4'b1001; 
    #5;
    //OR
    A = 8'b0; B = 8'b0;                s = 4'b1010;
    #5;
    A = 8'b11111111; B = 8'b11111111;  s = 4'b1010;
    #5;
    A = 8'b00001000; B = 8'b00000010;  s = 4'b1010; 
    #5;
    //1's complement
    A = 8'b0; B = 8'b0;                s = 4'b1011;
    #5;
    A = 8'b11111111; B = 8'b11111111;  s = 4'b1011;
    #5;
    A = 8'b00001000; B = 8'b00000010;  s = 4'b1011; 
    #5;
    //Right Rotate
   
    A = 8'b11110001;   s = 4'b1001;
    #5;
    A = 8'b00001010;    s = 4'b1001; 
    #5;
    //Left Rotate
     A = 8'b11110001;   s = 4'b1001;
    #5;
    A = 8'b00001010;    s = 4'b1001; 
    #5;
    //Right Shift
     A = 8'b11110001;   s = 4'b1001;
    #5;
    A = 8'b00001010;    s = 4'b1001; 
    #5;
    //Left Shift
     A = 8'b11110001;   s = 4'b1001;
    #5;
    A = 8'b00001010;    s = 4'b1001; 
    


    $finish;

  end
endmodule



