module TB_ULA2 ();
	reg [3:0] switchs;
	reg [3:0] A;
  reg [3:0] B;
	wire [7:0] saida;

  ula dut(.saida(saida), .A(A), .B(B), .switchs(switchs));
  
  initial begin
    //Soma
    switchs = 4'b0000; A = 4'b0000; B = 4'b0000; #10;
		if (saida !== 8'b00000000) $display("Saida falhou com soma 0 + 0");
    
    switchs = 4'b0000; A = 4'b0100; B = 4'b0001; #10;
		if (saida !== 8'b00000101) $display("Saida falhou com soma 100 + 1");
    
    switchs = 4'b0000; A = 4'b1000; B = 4'b1111; #10;
		if (saida !== 8'b00010111) $display("Saida falhou com soma 1000 + 1111");
    
    switchs = 4'b0000; A = 4'b1111; B = 4'b1111; #10;
		if (saida !== 8'b00011110) $display("Saida falhou com soma 1111 + 1111");

    //Subtracao
    
    switchs = 4'b0000; A = 4'b1000; B = 4'b0100; #10;
		if (saida !== 8'b00000100) $display("Saida falhou com subtracao 1000 - 100");
    
    
