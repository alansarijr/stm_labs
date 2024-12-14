module cla_16bit (
    input [15:0] A, B,     // 16-bit inputs
    input Cin,             // Carry-in
    output [15:0] Sum,     // 16-bit sum
    output Cout            // Carry-out
);
    wire [3:0] G, P;       // Group Generate and Propagate for each 4-bit block
    wire [3:0] C;          // Carry signals between the blocks

    // 4-bit CLA instances
    cla_4bit CLA0 (.A(A[3:0]),   .B(B[3:0]),   .Cin(Cin),   .Sum(Sum[3:0]),   .Cout(), .G(G[0]), .P(P[0]));
    cla_4bit CLA1 (.A(A[7:4]),   .B(B[7:4]),   .Cin(C[0]),  .Sum(Sum[7:4]),   .Cout(), .G(G[1]), .P(P[1]));
    cla_4bit CLA2 (.A(A[11:8]),  .B(B[11:8]),  .Cin(C[1]),  .Sum(Sum[11:8]),  .Cout(), .G(G[2]), .P(P[2]));
    cla_4bit CLA3 (.A(A[15:12]), .B(B[15:12]), .Cin(C[2]),  .Sum(Sum[15:12]), .Cout(), .G(G[3]), .P(P[3]));

    // Carry calculations for 4-bit blocks
    assign C[0] = G[0] | (P[0] & Cin);
    assign C[1] = G[1] | (P[1] & C[0]);
    assign C[2] = G[2] | (P[2] & C[1]);
    assign Cout = G[3] | (P[3] & C[2]);
endmodule
