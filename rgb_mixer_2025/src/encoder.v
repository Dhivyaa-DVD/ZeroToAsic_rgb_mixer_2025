`default_nettype none
`timescale 1ns/1ns
module encoder (
    input clk,
    input reset,
    input a,
    input b,
    output reg [7:0] value
);


    reg olda;
    reg oldb;
    wire [3:0] direction ={a, olda, b, oldb};

    always @(posedge clk) begin
        if(reset) begin
            olda <=0;
            oldb <=0;
            value <=0;
        end else begin

            olda <= a;
            oldb <= b;

        
            case (direction)
                //incrementing
                4'b1000: value <= value +1;
                4'b0111: value <= value +1;
                //decrementing
                4'b0010: value <= value -1;
                4'b1101: value <= value -1;

                default: value <= value;
            endcase
        end
    end
endmodule
