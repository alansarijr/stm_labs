module cla_64bit (
    input [63:0] A, B,      // 64-bit inputs
    input Cin,              // Carry-in
    output [63:0] Sum,      // 64-bit sum
    output Cout             // Final carry-out
);
    wire [3:0] C;           // Carry signals between the 16-bit CLA blocks

    // 16-bit CLA instances
    cla_16bit CLA0 (.A(A[15:0]),   .B(B[15:0]),   .Cin(Cin),   .Sum(Sum[15:0]),   .Cout(C[0]));
    cla_16bit CLA1 (.A(A[31:16]),  .B(B[31:16]),  .Cin(C[0]),  .Sum(Sum[31:16]),  .Cout(C[1]));
    cla_16bit CLA2 (.A(A[47:32]),  .B(B[47:32]),  .Cin(C[1]),  .Sum(Sum[47:32]),  .Cout(C[2]));
    cla_16bit CLA3 (.A(A[63:48]),  .B(B[63:48]),  .Cin(C[2]),  .Sum(Sum[63:48]),  .Cout(Cout));
endmodule
