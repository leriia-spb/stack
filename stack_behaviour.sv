
module stack_behaviour_easy(
    output wire[3:0] O_DATA, 
    input wire RESET, 
    input wire CLK, 
    input wire[1:0] COMMAND, 
    input wire[2:0] INDEX,
    input wire[3:0] I_DATA
    ); 
    reg [3:0] out;
    reg [2:0] ind;
    reg [3:0] stack [0:4];
    initial begin 
        ind = 0;
        stack[0] = 0;
        stack[1] = 0;
        stack[2] = 0;
        stack[3] = 0;
        stack[4] = 0;
        out = 0;
    end
    always @(posedge RESET) begin
        ind = 0;
        stack[0] = 0;
        stack[1] = 0;
        stack[2] = 0;
        stack[3] = 0;
        stack[4] = 0;
    end
    always @(posedge CLK) begin
        if(RESET == 0 && COMMAND == 1) begin
            ind = ind + 1;
            ind = ind % 5;
            stack[ind] = I_DATA;
        end
        else if (RESET == 0 && COMMAND == 2) begin
            out = stack[ind];
            ind = (ind == 0) ? 4: ind - 1;
        end
        else if (RESET == 0 && COMMAND == 3) begin
            reg [4:0] ind_for_out;
            ind_for_out = ind + 10 - INDEX;
            ind_for_out %= 5;
            out = stack[ind_for_out];
        end
    end
    assign O_DATA = out;
endmodule


module stack_behaviour_normal(
    inout wire[3:0] IO_DATA, 
    input wire RESET, 
    input wire CLK, 
    input wire[1:0] COMMAND,
    input wire[2:0] INDEX
    );
    reg [3:0] out;
    reg [2:0] ind;
    reg [3:0] stack [0:4];
    initial begin 
        ind = 0;
        stack[0] = 0;
        stack[1] = 0;
        stack[2] = 0;
        stack[3] = 0;
        stack[4] = 0;
        out = 4'hz;
    end
    always @(posedge RESET) begin
        ind = 0;
        stack[0] = 0;
        stack[1] = 0;
        stack[2] = 0;
        stack[3] = 0;
        stack[4] = 0;
    end
    always @(posedge CLK) begin
        if(RESET == 0 && COMMAND == 1) begin
            ind = ind + 1;
            ind = ind % 5;
            stack[ind] = IO_DATA;
        end
        else if (RESET == 0 && COMMAND == 2) begin
            out = stack[ind];
            ind = (ind == 0) ? 4: ind - 1;
        end
        else if (RESET == 0 && COMMAND == 3) begin
            reg [4:0] ind_for_out;
            ind_for_out = ind + 10 - INDEX;
            ind_for_out %= 5;
            out = stack[ind_for_out];
        end
    end
    assign IO_DATA = out;
endmodule
