module cla_4bit (
    input [3:0] A, B,       // 4-bit inputs
    input Cin,              // Carry-in
    output [3:0] Sum,       // 4-bit sum
    output Cout,            // Carry-out
    output G, P             // Group Generate and Propagate
);
    wire [3:0] G_i, P_i;    // Generate and Propagate signals for each bit
    wire [3:1] C;           // Internal carry signals
    
    // Generate and Propagate calculations
    assign G_i = A & B;     // G_i = A_i AND B_i
    assign P_i = A ^ B;     // P_i = A_i XOR B_i

    // Carry calculations
    assign C[1] = G_i[0] | (P_i[0] & Cin);
    assign C[2] = G_i[1] | (P_i[1] & C[1]);
    assign C[3] = G_i[2] | (P_i[2] & C[2]);
    assign Cout = G_i[3] | (P_i[3] & C[3]);
    
    // Sum calculations
    assign Sum[0] = P_i[0] ^ Cin;
    assign Sum[1] = P_i[1] ^ C[1];
    assign Sum[2] = P_i[2] ^ C[2];
    assign Sum[3] = P_i[3] ^ C[3];
    
    // Group Generate and Propagate
    assign G = G_i[3] | (P_i[3] & G_i[2]) | (P_i[3] & P_i[2] & G_i[1]) | (P_i[3] & P_i[2] & P_i[1] & G_i[0]);
    assign P = P_i[3] & P_i[2] & P_i[1] & P_i[0];
endmodule
