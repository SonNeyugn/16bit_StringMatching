Purpose
  This chip was formed following the standard MOSIS scalable design rules. Its primary purpose is to take in a binary string S of length 1 to N bits and compare it with a binary string P of length N bits. And it does so to determine if the binary string S is a substring of binary string P. The chip can work with string lengths of up to 16 bits.

User guide
  The chip has two modes of operation, normal mode and test mode. Normal mode allows the chip to undergo its purpose and complete the functions assigned to it. This mode of operation is the default mode whereas test mode can be activated by inputting a signal to pin T on the chip. The test mode allows users to check the values of the chip registers and the current state of the chip. 
  Note: 
  The input L starts from 0 and the counter in the chip also counts from 0 so when if you want to input a string S of length n, L should have the decimal value of n - 1, for example, S of length 3 then L is 00010 (decimal value = 2, as L is counted from 0 to 2)
  
  *Input using chip_tb2.vhd in sim_1 folder
  
  Normal mode:                                                                   
    1. Initialize the chip's registers and counters by issuing a Reset signal at pin R.
    2. Input the length of the substring at port L[4] to port L[0] (5-bit vector).
    3. After that, a Start signal at pin S can be issued at any clock cycle to start the chip's operation. When S is on, R and T must stay off. 
    4. At the next clock cycle, string P can be input serially at pin P_in over N successive clock cycle. During this time, input S can be given any value (0 or 1).
    5. After N successive clock cycles, input S can be input serially at pin S_in over L successive clock cycles
    6. After P and S are inputted, the chip will go through the state and perform its function and the result and the index of the matching location will be outputted.
    7. The result will be output at pin Result. The index will be outputted at pin index[4] to index[0] (5-bit vector).
    8. The chip can be restarted by issuing the Reset signal at pin R.

  Test Mode:
    1. The test mode of the chip can be activated by issuing the Test mode signal at pin T.
    2. Test inputs can be applied like normal inputs
    3. During the test mode, values of the P register, S register, and check register are outputted serially at pin P_out, S_out, check_out
    4. The current state of the chip can also be monitored at pin Q2, Q1, and Q0



