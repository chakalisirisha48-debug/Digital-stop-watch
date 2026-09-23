`timescale 1ns/1ps

module digital_stop_watch_tb;

    reg clk;
    reg reset;
    reg start_stop;

    wire [5:0] seconds;
    wire [5:0] minutes;

    digital_stop_watch uut (
        .clk(clk),
        .reset(reset),
        .start_stop(start_stop),
        .seconds(seconds),
        .minutes(minutes)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        start_stop = 0;

        #10;

        // Start stopwatch
        reset = 0;
        start_stop = 1;

        #100;

        // Stop stopwatch
        start_stop = 0;

        #20;

        // Reset stopwatch
        reset = 1;

        #10;

        reset = 0;

        #20;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | Start/Stop=%b | Minutes=%0d | Seconds=%0d",
                 $time,
                 start_stop,
                 minutes,
                 seconds);
    end

endmodule