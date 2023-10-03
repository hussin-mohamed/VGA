`timescale 1ns / 1ns
module single_port_ram 
#(parameter DATA_WIDTH=3, parameter ADDR_WIDTH=16)
(
	input [(ADDR_WIDTH-1):0] addr,
	input e, clk,reset,
	output reg [(DATA_WIDTH-1):0] q
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];
	initial
	begin
    $readmemb("Memory_Bird.txt",rom);
    end
	// Variable to hold the registered read address
	reg [ADDR_WIDTH-1:0] addr_reg;

	always @ (posedge clk or negedge reset)
	begin
		if(!reset)
		q<=0;
		else if (e)
		q<=rom[addr];
	end

endmodule
