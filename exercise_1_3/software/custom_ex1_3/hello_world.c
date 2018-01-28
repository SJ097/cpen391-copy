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
//might need to include #include "altera_avalon_pio_regs.h" for later exercises of project, although I'm not sure what library that is

//HEED THESE WORDS: All serial ports have been tested with a self loop
//YOU MUST CHANGE THE SELF LOOPS and hook them up to GPIOs for GPS, Bluetooth, Touchscreen
#define GPS_Control (volatile unsigned char *)	(0x4000210)
#define GPS_Status 	(volatile unsigned char *)	(0x4000210)
#define GPS_TxData 	(volatile unsigned char *)	(0x4000212)
#define GPS_RxData 	(volatile unsigned char *)	(0x4000212)
#define GPS_Baud 	(volatile unsigned char *)	(0x4000214)

#define BLUETOOTH_Control (volatile unsigned char *)	(0x4000220)
#define BLUETOOTH_Status (volatile unsigned char *)		(0x4000220)
#define BLUETOOTH_TxData (volatile unsigned char *)		(0x4000222)
#define BLUETOOTH_RxData (volatile unsigned char *)		(0x4000222)
#define BLUETOOTH_Baud 	(volatile unsigned char *)		(0x4000224)

#define TOUCH_Control (volatile unsigned char *)	(0x4000230)
#define TOUCH_Status (volatile unsigned char *)		(0x4000230)
#define TOUCH_TxData (volatile unsigned char *)		(0x4000232)
#define TOUCH_RxData (volatile unsigned char *)		(0x4000232)
#define TOUCH_Baud 	(volatile unsigned char *)		(0x4000234)

/* Function declarations ARE REQUIRED or it will give warnings, although you can still compile and run with the warnings*/
/* It's good practice */
void Init_RS232(void);
int putcharRS232(int c);
char getcharRS232(void);
int RS232TestForReceivedData(void);

int main()
{
  printf("Hello from Nios II!\n");
  Init_RS232();

  //Serial port testing
  printf("Wrote on Tx, %d\n", putcharRS232('a'));
  printf("Read from Rx %d\n", getcharRS232());

  printf("Wrote on Tx, %d\n", putcharRS232('b'));
  printf("Read from Rx %d\n", getcharRS232());

  printf("Wrote on Tx, %d\n", putcharRS232('c'));
  printf("Read from Rx %d\n", getcharRS232());

  printf("Wrote on Tx, %d\n", putcharRS232('d'));
  printf("Read from Rx %d\n", getcharRS232());

  return 0;
}
