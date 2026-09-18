//and_beh_before.v

module and_beh_before(
    input a, b,
    output reg y
);
 
 always @(*) begin
    y = a&b;
    #5;
 end
endmodule