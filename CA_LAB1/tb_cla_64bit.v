`timescale 1ns / 1ps
module tb_cla_64bit;
// Parameters
parameter N = 64; // 64-bit inputs

// Inputs
reg [N-1:0] a;
reg [N-1:0] b;
reg cin;

// Outputs
wire [N-1:0] sum;
wire cout;

// Instantiate the Unit Under Test (UUT)
cla_64bit uut (
    .A(a),
    .B(b),
    .Cin(cin),
    .Sum(sum),
    .Cout(cout)
);

initial begin
    // Initialize Inputs
    a = 0;
    b = 0;
    cin = 0;

    // Apply test vectors
    #10 a = 64'h0000000000000001; b = 64'h0000000000000001; cin = 0;  // 1 + 1 = 2
    #10 a = 64'h00000000000000FF; b = 64'h0000000000000001; cin = 0; // 255 + 1 = 256
    #10 a = 64'hFFFFFFFFFFFFFFFF; b = 64'h0000000000000001; cin = 0; // Max 64-bit + 1 = 0 with carry-out
    #10 a = 64'hAAAAAAAAAAAAAAAA; b = 64'h5555555555555555; cin = 0; // Patterned inputs: 170... + 85... = All ones
    #10 a = 64'hFFFFFFFFFFFFFFF0; b = 64'h000000000000000F; cin = 1; // Edge case: High carry propagation
    #10 a = 64'h0000000000000000; b = 64'h0000000000000000; cin = 1; // 0 + 0 + 1 = 1
    #10 a = 64'h123456789ABCDEF0; b = 64'h0FEDCBA987654321; cin = 1; // Random inputs with carry-in
    #10 a = 64'h0000FFFF0000FFFF; b = 64'hFFFF0000FFFF0000; cin = 0; // Mixed patterns

    // Add more test cases as needed
    #10 $stop; // Stop the simulation
end

initial begin
    $monitor("At time %t, a = %h, b = %h, cin = %b, sum = %h, cout = %b",
             $time, a, b, cin, sum, cout);
end

endmodule
