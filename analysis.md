Step 1, 
What the Program Does:
hexdump.c reads a binary file and prints it in a readable format. Each line shows the offset in hex, 16 bytes of data in hex, 
and the same bytes as ASCII characters with a period replacing any non-printable character.

Step 2,
How to Build:
gcc -O0 -S -o hexdumpO0.s hexdump.c
gcc -O1 -S -o hexdumpO1.s hexdump.c
gcc -O3 -S -o hexdumpO3.s hexdump.c
All three produce identical output on binary.out. 
To test the output run ./hexdumpO0 binary.out after compiling then run gcc -O0 -o hexdumpO0 hexdump.c

Step 3,
-O0 (No Optimization):
At -O0 GCC generated 267 lines of assembly across 3 separate functions. Every local variable like loop counters is stored in memory and reloaded every single iteration instead of staying in a register. 
The isprint() function internally calls __ctype_b_loc() to get a character table and at -O0 this happens once per character in the loop which is very wasteful. 
The total stack used across all three frames is about 144 bytes. This level is the easiest to debug but the slowest to run.

Step 4,
-O1 (Basic Optimization):
At -O1 GCC generated 206 lines of assembly. All three functions got merged into one which eliminated all the overhead of separate function calls. 
Loop counters and frequently used values now stay in registers instead of being written to memory every iteration. 
The __ctype_b_loc() call is now hoisted out of the loop and only called once before it starts instead of once per character. 
The stack dropped from 144 bytes down to 72 bytes because everything is in one unified frame. This is where the biggest improvements happened.

Step 5,
 -O3 (Aggressive Optimization):
At -O3 GCC generated 214 lines of assembly which is very close to -O1. The main addition is that loops are padded to start on a 16 byte boundary in memory which helps the CPU fetch instructions faster. 
There are also some minor instruction scheduling tweaks. 
The reason -O3 does not add much over -O1 is that this program spends most of its time waiting on fread, printf, and putc which are library functions the compiler cannot optimize. 
The stack stays at 72 bytes same as -O1.

Step 6,
Conclusion:
The biggest improvement is from -O0 to -O1 where function inlining, register allocation, and moving the __ctype_b_loc() call outside the loop made the most difference in my oponion.  
I would say going from -O1 to -O3 added very little because the bottleneck is I/O not computation. For programs that do heavy math or data processing -O3 would show much bigger gains.
