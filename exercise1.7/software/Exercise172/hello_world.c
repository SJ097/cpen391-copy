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
  ClearScreen();
  printf("Hello from Nios II!\n");

  Triangle(300,250,400,300,300,300,3);
  Rectangle(50,50,150,100,2);
  FilledRectangleBorder(100,120,200,200,3,2);
  FilledRectangle(400,100,450,150,3);
  Circle(600,300,40,2);
  Arc(400,300,40,3);
  int i;
  for(i = 0; i < 5; i++){
	  RandomLine();
  }


  OutGraphicsStringFont1(386,300,1,0,"I love verilog & vhdl!",1);

  return 0;
}
