`timescale 1ns / 1ns
module vga_sync(input clk,reset,output reg video_on,hsync,vsync,output reg[8:0] pixel_x,output reg[9:0] pixel_y );
always@(posedge clk or negedge reset)
begin
if (~reset)
begin
pixel_x<=0;
pixel_y<=0;
hsync<=1;
vsync<=1;
video_on<=1;
end
else
begin
pixel_x<=pixel_x+1;
if((pixel_x==0)||(pixel_x>0&&pixel_x<262))
begin
hsync<=1;
end
else if(pixel_x>261&&pixel_x<=299)
begin
hsync<=0;
end
else if(pixel_x>299&&pixel_x<319)
hsync<=1;
else if(pixel_x==319)
begin
pixel_x<=0;
pixel_y<=pixel_y+1;
end
if((pixel_y>=0&&pixel_y<479))
begin
vsync<=1;
end
else if(pixel_y>489&&pixel_y<492)
vsync<=0;
else if(pixel_y>491&&pixel_y<524)
vsync<=1;
else if(pixel_y==524&&pixel_x==319)
begin
pixel_y<=0;
pixel_x<=0;
end
if(((pixel_x>=0&&pixel_x<=254)&&(pixel_y>=0&&pixel_y<=479))||(pixel_y<=478&&pixel_x==319)||(pixel_y==524&&pixel_x==319))
video_on<=1;
else 
video_on<=0;
end
end
endmodule
