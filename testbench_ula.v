module testbench_ula ();
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
    
    switchs = 4'b0001; A = 4'b1000; B = 4'b0100; #10;
	  if (saida !== 8'b00000100) $display("Saida falhou com subtracao 1000 - 100");
	  
    switchs = 4'b0001; A = 4'b0010; B = 4'b0011; #10;
	  if (saida !== 8'b11111111) $display("Saida falhou com subtracao 10 - 11");
    
    switchs = 4'b0001; A = 4'b0001; B = 4'b0100; #10;
	  if (saida !== 8'b11111101) $display("Saida falhou com subtracao 1 - 100");
	  
    switchs = 4'b0001; A = 4'b0100; B = 4'b0100; #10;
	  if (saida !== 8'b00000000) $display("Saida falhou com subtracao 100 - 100");
	  
    //Multiplicacao
	 
    switchs = 4'b0010; A = 4'b1000; B = 4'b0000; #10;
	  if (saida !== 8'b00000000) $display("Saida falhou com multiplicacao 1000 * 0");

    switchs = 4'b0010; A = 4'b1000; B = 4'b1000; #10;
	  if (saida !== 8'b01000000) $display("Saida falhou com multiplicacao 1000 * 1000");
	  
    switchs = 4'b0010; A = 4'b1111; B = 4'b0001; #10;
	  if (saida !== 8'b00001111) $display("Saida falhou com multiplicacao 1111 * 1");
	  
    switchs = 4'b0010; A = 4'b1111; B = 4'b1111; #10;
	  if (saida !== 8'b11100001) $display("Saida falhou com multiplicacao 1111 * 1111");
	  
    //Divisao
	  
    switchs = 4'b0011; A = 4'b1000; B = 4'b0010; #10;
	  if (saida !== 8'b00000100) $display("Saida falhou com divisao 1000 / 10");
    
    switchs = 4'b0011; A = 4'b0010; B = 4'b0010; #10;
	  if (saida !== 8'b00000001) $display("Saida falhou com divisao 10 / 10");

    switchs = 4'b0011; A = 4'b1001; B = 4'b0001; #10;
	  if (saida !== 8'b00001001) $display("Saida falhou com divisao 1001 / 1");
	  
    switchs = 4'b0011; A = 4'b0001; B = 4'b0000; #10;
	  if (saida !== 8'b00000000) $display("Saida falhou com divisao 1 / 0");
	  
    //Deslocamento para a esquerda em A
	  
    switchs = 4'b0100; A = 4'b1010; #10;
	  if (saida !== 8'b00000100) $display("Saida falhou para deslocamento para esquerda de 1010");
	  
    switchs = 4'b0100; A = 4'b1111; #10;
	  if (saida !== 8'b00001110) $display("Saida falhou para deslocamento para esquerda de 1111");
	 
    switchs = 4'b0100; A = 4'b0000; #10;
	  if (saida !== 8'b00000000) $display("Saida falhou para deslocamento para esquerda de 0000");
	  
    switchs = 4'b0100; A = 4'b1000; #10;
	  if (saida !== 8'b00000000) $display("Saida falhou para deslocamento para esquerda de 1000");
	  
    //Deslocamento para a direita em A
	  
    switchs = 4'b0100; A = 4'b1010; #10;
	  if (saida !== 8'b00000101) $display("Saida falhou para deslocamento para direita de 1010");
	  
    switchs = 4'b0100; A = 4'b1111; #10;
	  if (saida !== 8'b00000111) $display("Saida falhou para deslocamento para direita de 1010");
	  
    switchs = 4'b0100; A = 4'b0000; #10;
	  if (saida !== 8'b00000000) $display("Saida falhou para deslocamento para direita de 0000");
	  
    switchs = 4'b0100; A = 4'b0001; #10;
	  if (saida !== 8'b00000000) $display("Saida falhou para deslocamento para direita de 0000");
	  
  end
endmodule
