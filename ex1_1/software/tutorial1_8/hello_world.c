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

#define bit_flipper_base (volatile int *) 0x2010

int main()
{
	int v = 0x05; // arbitrary value

	IOWR_32DIRECT(bit_flipper_base,0,v); // write the value to the component
	 printf("value is now %x\n", IORD_32DIRECT(bit_flipper_base,4));
	 // increment what is in the component

	 IOWR_32DIRECT(0x2010,4,0); // does not matter what you write. Note offset is 4
	  printf("value is now %x\n", IORD_32DIRECT(bit_flipper_base,4));
	  // increment it again
	  IOWR_32DIRECT(0x2010,4,0); // does not matter what you write. Note offset is 4
	  printf("value is now %x\n", IORD_32DIRECT(bit_flipper_base,4));
	  // get the value in reverse bit order
	  printf("reverse bit order %x\n", IORD_32DIRECT(bit_flipper_base,0));
	  // get the complement of the value
	  printf("complement sis %x\n", IORD_32DIRECT(bit_flipper_base,8));
	 					return(0);
}
