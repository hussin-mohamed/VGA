`timescale 1ns / 1ns
module vga(input clk,reset,output hsync,vsync,output[2:0] rgb);
wire video_on;
wire[9:0] pixel_y;
wire[8:0] pixel_x;
vga_sync sync1(clk,reset,video_on,hsync,vsync,pixel_x,pixel_y);
single_port_ram memory(.addr({pixel_y[8:1],pixel_x[7:0]}),.clk(clk),.reset(reset),.e(video_on),.q(rgb));
endmodule
