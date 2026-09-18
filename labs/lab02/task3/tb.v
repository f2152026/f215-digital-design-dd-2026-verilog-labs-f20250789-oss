// tb.v
module tb;

  reg [1:0] A, B;
  wire GT, LT, EQ;

  comp2 DUT (
    .A(A), .B(B),
    .GT(GT), .LT(LT), .EQ(EQ)
  );

  integer i, j;

  // VCD dump configuration
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);  
    end
  end

  initial begin
    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1) begin
        A = i; B = j;
        #5;
        if (A == B && EQ !== 1)
          $display("ERROR: A=%0d B=%0d expected EQ=1 got %b", A, B, EQ);
        if (A >  B && GT !== 1)
          $display("ERROR: A=%0d B=%0d expected GT=1 got %b", A, B, GT);
        if (A <  B && LT !== 1)
          $display("ERROR: A=%0d B=%0d expected LT=1 got %b", A, B, LT);

        if ((GT + LT + EQ) !== 1)
          $display("ERROR: A=%0d B=%0d outputs not mutually exclusive: GT=%b LT=%b EQ=%b", A, B, GT, LT, EQ);
      end
    end
    $finish;
    
  end

  initial begin
      $monitor($time, " A=%0d | B=%0d | EQ=%b | GT=%b | LT=%b", A, B, EQ, GT, LT);
  end

endmodule
