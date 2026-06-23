`default_nettype none
//`timescale 1ns/1ns
module pwm (
    input wire clk,
    input wire reset,
    output reg out,
    input wire [7:0] level
    );

    reg [7:0] counter;
    wire led_on = counter < level;

    always @(posedge clk) begin
        if(reset) begin
            counter <= 0;
        end
        else begin
            counter <= counter +1;
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            out <= 0;
        end
        else begin
            out <= led_on;
        end
    end
    
endmodule
