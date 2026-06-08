`default_nettype none
`timescale 1ns/1ns
module rgb_mixer (
    input clk,
    input reset_n,
    input enc0_a,
    input enc0_b,
    input enc1_a,
    input enc1_b,
    input enc2_a,
    input enc2_b,
    output pwm0_out,
    output pwm1_out,
    output pwm2_out
);


    wire enc0_a_db, enc0_b_db;
    wire enc1_a_db, enc1_b_db;
    wire enc2_a_db, enc2_b_db;
    wire [7:0] enc0, enc1, enc2;

    wire reset;
    assign reset = !reset_n;

    debounce debounce0_a (.clk(clk), .reset(reset), .button(enc0_a), .debounced(enc0_a_db));
    debounce debounce0_b (.clk(clk), .reset(reset), .button(enc0_b), .debounced(enc0_b_db));

    debounce debounce1_a (.clk(clk), .reset(reset), .button(enc1_a), .debounced(enc1_a_db));
    debounce debounce1_b (.clk(clk), .reset(reset), .button(enc1_b), .debounced(enc1_b_db));

    debounce debounce2_a (.clk(clk), .reset(reset), .button(enc2_a), .debounced(enc2_a_db));
    debounce debounce2_b (.clk(clk), .reset(reset), .button(enc2_b), .debounced(enc2_b_db));

    encoder encoder0 (.clk(clk), .a(enc0_a_db), .b(enc0_b_db), .value(enc0));
    encoder encoder1 (.clk(clk), .a(enc1_a_db), .b(enc1_b_db), .value(enc1));
    encoder encoder2 (.clk(clk), .a(enc2_a_db), .b(enc2_b_db), .value(enc2));

    pwm pwm0 (.clk(clk), .reset(reset), .level(enc0), .out(pwm0_out));
    pwm pwm1 (.clk(clk), .reset(reset), .level(enc1), .out(pwm1_out));
    pwm pwm2 (.clk(clk), .reset(reset), .level(enc2), .out(pwm2_out));



endmodule
