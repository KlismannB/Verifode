/*module morse (input button1, input button2, input CLKin, output reg [3:0]signal);
integer i = 0, c;
reg [3:0]in = 4'b0000;
reg button_old = 1, button_raise = 0;	
wire clock_out;
reg[27:0] counter=28'd0;
parameter DIVISOR = 28'd27000000;	*/
	
/*always @(posedge CLKin)begin
 counter <= counter + 28'd1;
 if(counter>=(DIVISOR-1))
  counter <= 28'd0;
end
	
assign clock_out = (counter<DIVISOR/27000000)?1'b0:1'b1;*/
//daria certo negedge button1 or negedge button2??
	//always @(posedge clock_out) begin
    // detect rising edge
    
   /* if (button_old != button2 && button2 == 1'b1)begin
        button_raise <= 1'b1;
	end
	button_old <= button2;
	
    // increment number
    if(button_raise == 1'b1)
    begin*/
  /*      if(!button1)begin
		in[i] <= 0;
        i = i + 1;
        button_raise <= 1'b0;
        end 
        else if(!button2)begin
		in[i] <= 1;
        i = i + 1;
        button_raise <= 1'b0;
		end
    

	if(i > 3)begin
		signal[0] = in[0];
		signal[1] = in[1];
		signal[2] = in[2];
		signal[3] = in[3];
	end else
			signal = 0;
			
	
end
	
endmodule*/



module morse(input button1,clk,output pb_out);
wire slow_clk;
wire migue;
wire Q1,Q2,Q2_bar;
integer i = 0;
clock_div u1(clk,slow_clk);
my_dff d1(slow_clk, button1,Q1 );
my_dff d2(slow_clk, Q1,Q2 );
assign Q2_bar = ~Q2;
always@(*)begin
i <= i + (Q1 & Q2_bar);
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
endmodule
