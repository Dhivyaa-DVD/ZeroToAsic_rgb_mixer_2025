`default_nettype none
`timescale 1ns/1ns
module debounce
(
    input wire clk,
    input wire reset,
    input wire button,
    output reg debounced
);

    reg [7:0] button_history;

    always @(posedge clk) begin
        if(reset) begin
            button_history <= 8'b0;
            debounced <= 1'b0;
        end else begin

            button_history <= {button_history[6:0], button};
            
            if(button_history == 8'b1111_1111)
                debounced <= 1;
            
            if(button_history == 8'b0)
                debounced <= 0;

        end
        
    end
endmodule
