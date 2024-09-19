//New module utilizing the add4 module to perform either addition or subtraction by changing the second 4-bit input into its 2s complement before addition
module addsub4 (
           input [3:0] A, B,
           input subsel, //Input subsel will change B into its 2s complment when subsel = 1
           output [3:0] X,
           output cout, ovf
           );

//Declares wire C, which XORs every element in input B with subsel to see if B's value needs to be converted to 2s complement for subtraction           
wire [3:0] C;
assign C[0] = B[0]^subsel;
assign C[1] = B[1]^subsel;
assign C[2] = B[2]^subsel;
assign C[3] = B[3]^subsel;

//subsel is included in the carryin portion in order to add 1 to C so it can become 2s complement
add4 addsubstage1(.carryin(subsel), .X(A), .Y(C), .S(X), .carryout(cout), .ovf(ovf));


endmodule
