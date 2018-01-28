/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include <io.h>

#define KEY_BASE (volatile int *) 0x2000
#define HEX_BASE (volatile int *) 0x2010

//hex constants:	Note: Hex is inverted. To turn on the light, need to give bit 0
#define HEX_ZERO 	0
#define HEX_ONE 	121	//7'b1111001
#define HEX_TWO 	36	//7'b0100100
#define HEX_THREE 	48	//7'b111001
#define HEX_ERROR 	6	//inverted E for error since normal E and 3 are indistinguishable on HEX

int main()
{
  printf("Welcome to Exercise 1.1!\n");
  int key_value;		//WARNING: key value is 1 when not pressed

  while(1)
  {
	  key_value = IORD_8DIRECT(KEY_BASE,0);

	  //printf("Value of the original key input signal is %x or as decimal, %d\n", key_value, key_value);
	  //printf("Value of the inverted key input signal is %x or as decimal, %d\n", ~key_value, ~key_value);

	  if(key_value == 14)	//4'b1110 aka KEY[0] pressed
		  IOWR_8DIRECT(HEX_BASE, 0, HEX_ZERO);

	  else if(key_value == 13)	//4'b1101 aka KEY[1] pressed
		  IOWR_8DIRECT(HEX_BASE, 0, HEX_ONE);

	  else if(key_value == 11)	//4'b1011 aka KEY[2] pressed
		  IOWR_8DIRECT(HEX_BASE, 0, HEX_TWO);

	  else if(key_value == 7)	//4'b0111 aka KEY[3] pressed
		  IOWR_8DIRECT(HEX_BASE, 0, HEX_THREE);

	  else
		  IOWR_8DIRECT(HEX_BASE, 0, HEX_ERROR);	//anything else
  }

  return 0;
}
