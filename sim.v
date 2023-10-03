`timescale 1ns / 1ns
module sim();
reg clk,reset;
wire hsync,vsync;
wire [2:0]rgb;
vga vga1(clk,reset,hsync,vsync,rgb);
always 
begin
clk<=0;
#50;
clk<=1;
#50;
end
initial
begin
reset<=0;
#40;
reset<=1;
#1200;
reset<=0;
#20
reset<=1;
end
endmodule
