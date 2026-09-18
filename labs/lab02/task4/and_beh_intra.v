//and_beh_intra

module and_beh_intra(
    input a, b,
    output reg y
);
    always @(*) begin
        y = #(5) a&b;
    end
endmodule