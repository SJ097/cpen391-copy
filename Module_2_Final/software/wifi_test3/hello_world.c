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
#include <string.h>
#include <time.h>

int main()
{
  printf("Hello from Nios II!\n");
  char *dofile_command = "dofile(\"wifi_db.lua\")\n";
  char *fetch_command = "fetchBooking()\n";
  FILE *f = fopen("/dev/uart_0", "r+");

  char buffer[1234];

  if(f) {
	fwrite(dofile_command, strlen(dofile_command), 1, f); // Write a string
	//fread(buffer, 10, 1, f);		//random read so I don't get the response to the dofile command
	delay(500);
	printf("Sending LUA function command\n");
	fwrite(fetch_command, strlen(fetch_command), 1, f);
	while(1) {
		printf("%c", getc(f));
	}

	printf("Finished execution. String received is \n%s\n", buffer);
	fclose (f);
  }

  if(!f)
	  printf("File not open\n");

  printf("Finished!\n");
  return 0;
}

void delay(int milliseconds)
{
    long pause;
    clock_t now,then;

    pause = milliseconds*(CLOCKS_PER_SEC/1000);
    now = then = clock();
    while( (now-then) < pause )
        now = clock();
}
