# Moore Machine
This is the implementation of a Moore Machine to detect input sequences 1001, 010 and 001.
The source module receives input x continuously. 
For each positive edge of the clock, the module reads the value of x, either 0 or 1. 
Whenever the last read values are 1001, 010 and 001, the value of the output y becomes 1. For any other input sequences, the value of y becomes 0.
There is also a testbench you can use, and a diagram to visualize working principle of the circuit.
