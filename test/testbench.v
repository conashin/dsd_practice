module testbench;
	// Inputs
	reg A;
	reg B;
	// Outputs
	wire C;
	// Instantiate the Unit Under Test (UUT)
	Lab_1 uut (
		.A(A), 
		.B(B), 
		.C(C)
		);

initial begin // Initialize Inputs
	A = 0; B = 0; 
// Wait 100 ns for global reset to finish
	
// Add stimulus here
        A=0; B=0;
#40;   A=0; B=1;
#40;   A=1; B=0;
#40;   A=1; B=1;
#40;   A=0; B=0;
end
      
endmodule
