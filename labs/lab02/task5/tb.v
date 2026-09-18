//tb.v

module tb;
  reg [3:0] a, b;
  reg op;
  wire [3:0] result;

  alu DUT(.a(a), .b(b), .op(op), .result(result));

  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, tb);
    end
  end

  integer i,j;
  initial begin
    for(i=0;i<16;i++) begin
        for(j=0;j<16;j++) begin
            #5;
            a = i; b = j; op = 0;
            #5;
            a = i; b = j; op = 1;
        end
    end
    $finish;
  end
  initial
  $monitor($time, " a=%0d | b=%0d | op=%b | result=%0d", a, b, op, result);
endmodule