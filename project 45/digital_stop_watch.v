module digital_stop_watch (
    input wire clk,
    input wire reset,
    input wire start_stop,

    output reg [5:0] seconds,
    output reg [5:0] minutes
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            seconds <= 6'd0;
            minutes <= 6'd0;
        end
        else if (start_stop) begin
            if (seconds == 6'd59) begin
                seconds <= 6'd0;

                if (minutes == 6'd59)
                    minutes <= 6'd0;
                else
                    minutes <= minutes + 1'b1;
            end
            else begin
                seconds <= seconds + 1'b1;
            end
        end
    end

endmodule