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

int main()
{

  printf("Initializing RS232...");
  Init_RS232();
  printf("done\n");
  printf("Sending data...");
  char c = 14;
  putcharRS232(c);
  printf("done\n");

  printf("Receiving data...");
  char ch = getcharRS232();
  printf("Data: %d\n", ch);

  printf("Testing if data was received...");
  if(RS232TestForReceivedData()){
	  printf("Success\n");
  }
  else{
	  printf("Unsuccessful\n");
  }
  printf("Program finished\n");
  return 0;
}
