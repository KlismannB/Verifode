

/*module morse(input button1,clk,output pb_out);
wire slow_clk;
reg migue = 0;
wire Q1,Q2,Q2_bar;
integer i = 0;
clock_div u1(clk,slow_clk);
my_dff d1(slow_clk, button1,Q1 );
my_dff d2(slow_clk, Q1,Q2 );
assign Q2_bar = ~Q2;
always@(*)begin
i <= i + Q1 & Q2_bar;
if(i > 5)
migue <= 1;
end
assign pb_out = migue;
//assign pb_out = Q1 & Q2_bar;
endmodule
// Slow clock for debouncing 
module clock_div(input Clk_100M, output reg slow_clk
    );
    reg [26:0]counter=0;
    always @(posedge Clk_100M)
    begin
        counter <= (counter>=249999)?0:counter+1;
        slow_clk <= (counter < 125000)?1'b0:1'b1;
    end
endmodule
// D-flip-flop for debouncing module 
module my_dff(input DFF_CLOCK, D, output reg Q);
    always @ (posedge DFF_CLOCK) begin
        Q <= D;
    end
endmodule*/


module morse(
     input clk, // CLOCK
     input button1,
     output [3:0]signal // LED
     );
clock_div u1(clk,slow_clk);
my_dff d1(slow_clk, button1,Q1 );
my_dff d2(slow_clk, Q1,Q2 );
assign Q2_bar = ~Q2;
reg[31:0] contador; // REGISTRA 32 DIGITOS
reg ledLigado; // SALVA STATUS DO LED
integer i = 0;
reg[3:0]pontoTraco;

initial begin
	contador <= 32'b0;// ZERA O CONTADOR
	ledLigado <= 0; // ESTADO DO LED É FALSO
end

always @(posedge clk) // SEMPRE NO PULSO DO CLOCK
begin
	if(~button1)
	begin
	contador <= contador + 1'b1; // SOMA UM AO CONTADOR
	end
	
	if(pb_out == 1)begin
	
		if(contador > 15000000)
		pontoTraco[4 - i] = 1'b1;
		else
		pontoTraco[4 - i] = 1'b0;
		
		contador <= 0;
		i <= i + 1;
	end
	
end

assign signal = pontoTraco; // LED É ASSOCIADO AO ESTADO
assign pb_out = Q1 & Q2_bar;

endmodule

module clock_div(input Clk_100M, output reg slow_clk
    );
    reg [26:0]counter=0;
    always @(posedge Clk_100M)
    begin
        counter <= (counter>=249999)?0:counter+1;
        slow_clk <= (counter < 125000)?1'b0:1'b1;
    end
endmodule
// D-flip-flop for debouncing module 
module my_dff(input DFF_CLOCK, D, output reg Q);
    always @ (posedge DFF_CLOCK) begin
        Q <= D;
    end
endmodule
