# blinky_vhdl

## Objective
The purpose of this project is to demonstrate how to use the Zedboard as a pure FPGA dev board. This discards the SoC functionality of the board. Why would I do this? IDK come fite me.

## Design Flow
The design flow is largely the same as Artix A7 FPGA mainly because a Zynq w/out the ARM processors is an Artix chip. I ignored Vivado's IP stuff for this and used straight VHDL.
1. Create project (Duh)
2. Add VHDL source file
3. Run synthesis
4. Assign pins to signals in "I/O Planning" mode. 
    * This generates the .xdc file also known as the constraints file.
5. Run synthesis again
6. Run implementation
7. Generate bitstream.
8. Connect to target
9. Program device.

