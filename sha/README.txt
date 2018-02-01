0x8400_0300 - CONTROL and STATUS

CONTROL - write 1 to reset hash to initial state. Should be done before hashing
	  write 2 to start hashing. Should be done after loading data

STATUS - read. bit 0 is high if the hashing is finished


0x8400_0302 - INPUT_DATA and OUTPUT_DATA
	
INPUT_DATA - 16 bit number
OUTPUT_DATA - 16 bit hashed number of input


------------------------------------

WORKFLOW

1. write 1 to control
2. write unhashed number to input_data
3. write 2 to control
4. wait for status bit 0 to go high
5. read hashed number from output_data