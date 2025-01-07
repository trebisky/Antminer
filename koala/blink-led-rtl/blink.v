`timescale 1ns / 1ps
`default_nettype none

module blink #
(
    // Width of data bus in bits
    parameter COUNTER_WIDTH = 27
)
(
    input  wire		clk,
    input  wire     rstn,

    output wire [3:0]         leds
);

    // reg [COUNTER_WIDTH-1:0] counter = 0;
    reg [COUNTER_WIDTH-1:0] counter;

	// This does turn 'em all off
	// assign leds = 4'b1111;
	// This does turn on D7 (the one on the left)
	// assign leds[0] = 0;
	// And this turns on d6 (the one on the right)
	// assign leds[3] = 0;

	// but this never turns on
	// as if we ain't getting no clock
    // assign leds[3] = counter[COUNTER_WIDTH-1];
    // assign leds[3] = counter[20];
    assign leds = {counter[25],3'b111};

    always @(posedge clk)
        counter <= counter + 1;
        // if (!rstn)
        //     counter <= 0;
        // else
        //   counter <= counter + 1;

endmodule

`default_nettype wire

