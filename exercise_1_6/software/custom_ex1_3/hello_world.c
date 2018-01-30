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
#include <unistd.h>
#include <io.h>
//might need to include #include "altera_avalon_pio_regs.h" for later exercises of project, although I'm not sure what library that is

//HEED THESE WORDS: All serial ports have been tested with a self loop
//YOU MUST CHANGE THE SELF LOOPS and hook them up to GPIOs for GPS, Bluetooth, Touchscreen
#define GPS_Control (volatile unsigned char *)	(0x4000210)
#define GPS_Status 	(volatile unsigned char *)	(0x4000210)
#define GPS_TxData 	(volatile unsigned char *)	(0x4000212)
#define GPS_RxData 	(volatile unsigned char *)	(0x4000212)
#define GPS_Baud 	(volatile unsigned char *)	(0x4000214)

#define TOUCH_Control (volatile unsigned char *)	(0x4000230)
#define TOUCH_Status (volatile unsigned char *)		(0x4000230)
#define TOUCH_TxData (volatile unsigned char *)		(0x4000232)
#define TOUCH_RxData (volatile unsigned char *)		(0x4000232)
#define TOUCH_Baud 	(volatile unsigned char *)		(0x4000234)

#define BLUETOOTH_Control (volatile unsigned char *)(0x4000220)
#define BLUETOOTH_Status (volatile unsigned char *)	(0x4000220)
#define BLUETOOTH_TxData (volatile unsigned char *)	(0x4000222)
#define BLUETOOTH_RxData (volatile unsigned char *)	(0x4000222)
#define BLUETOOTH_Baud 	(volatile unsigned char *)	(0x4000224)

/* Function declarations ARE REQUIRED or it will give warnings, although you can still compile and run with the warnings*/
/* It's good practice */
void Init_RS232(void);
int putcharRS232(int c);
char getcharRS232(void);
int RS232TestForReceivedData(void);

/* Bluetooth function declarations */
void Init_Bluetooth(void);
int putcharBluetooth(int c);
char getcharBluetooth(void);
int BluetoothTestForReceivedData(void);

int main()
{
  char serial_msg [200];
  char flag;
  int i = 0, num = 0;

  printf("Hello from Nios II!\n");

  //Serial port initialization
  Init_RS232();
  Init_Bluetooth();

  //Serial port testing
  printf("Serial port of RS232 Testing starting\n");
  printf("Wrote on Tx, %d\n", putcharRS232('a'));
  printf("Read from Rx %d\n", getcharRS232());

  printf("Wrote on Tx, %d\n", putcharRS232('b'));
  printf("Read from Rx %d\n", getcharRS232());

  printf("Wrote on Tx, %d\n", putcharRS232('c'));
  printf("Read from Rx %d\n", getcharRS232());

  printf("Wrote on Tx, %d\n", putcharRS232('d'));
  printf("Read from Rx %d\n", getcharRS232());
  printf("Serial port of RS232 Testing ended\n\n");

  printf("Bluetooth Exercise 1.6 \n");
  //enter command mode
  putcharBluetooth('$');
  putcharBluetooth('$');
  putcharBluetooth('$');

  //wait for at least 1 second (in this case 1.5 seconds) as per exercise instructions
  usleep(1500000);

  //there will be more usleep after, but instructions said it wasn't necessary
  //however, I found that it didn't work without the delay... So I put them in

  //reset the Bluetooth device to default value
  putcharBluetooth('S');
  putcharBluetooth('F');
  putcharBluetooth(',');
  putcharBluetooth('1');
  putcharBluetooth('\r');
  putcharBluetooth('\n');

  usleep(1500000);

  //change the Bluetooth module name
  putcharBluetooth('S');
  putcharBluetooth('N');
  putcharBluetooth(',');
  putcharBluetooth('C');
  putcharBluetooth('a');
  putcharBluetooth('r');
  putcharBluetooth('r');
  putcharBluetooth('i');
  putcharBluetooth('e');
  putcharBluetooth('r');
  putcharBluetooth('H');
  putcharBluetooth('a');
  putcharBluetooth('s');
  putcharBluetooth('A');
  putcharBluetooth('r');
  putcharBluetooth('r');
  putcharBluetooth('i');
  putcharBluetooth('v');
  putcharBluetooth('e');
  putcharBluetooth('d');
  putcharBluetooth('\r');
  putcharBluetooth('\n');

  usleep(1500000);

  //change the Bluetooth module password
  putcharBluetooth('S');
  putcharBluetooth('P');
  putcharBluetooth(',');
  putcharBluetooth('1');
  putcharBluetooth('2');
  putcharBluetooth('1');
  putcharBluetooth('2');
  putcharBluetooth('\r');
  putcharBluetooth('\n');

  usleep(1500000);

  //Change authentication mode
  putcharBluetooth('S');
  putcharBluetooth('A');
  putcharBluetooth(',');
  putcharBluetooth('4');
  putcharBluetooth('\r');
  putcharBluetooth('\n');

  usleep(1500000);

   //Go back to data mode
   putcharBluetooth('R');
   putcharBluetooth(',');
   putcharBluetooth('1');
   putcharBluetooth('\r');
   putcharBluetooth('\n');


  usleep(1500000);

  //Go back to data mode
  putcharBluetooth('-');
  putcharBluetooth('-');
  putcharBluetooth('-');
  putcharBluetooth('\r');
  putcharBluetooth('\n');

  while(1)
  {
	  //i = 0;	//reset i
	  while(BluetoothTestForReceivedData() == 1)
	  {
		  while(i < 200)
		  {
			  if (flag != getcharBluetooth() || num >= 30) {
				  serial_msg[i] = getcharBluetooth(); // Store the read character
				  flag = serial_msg[i];
			  	  i++;
			  	  serial_msg[i] = '\0'; 		// Null terminate the string
			  	  num = 0;
			  }
			  else num++;
		  }
	  }
	  if(i != 0)
	  {
		  printf("Received message: %s\n", serial_msg);
		  putcharBluetooth('I');
		  putcharBluetooth(' ');
		  putcharBluetooth('h');
		  putcharBluetooth('e');
		  putcharBluetooth('a');
		  putcharBluetooth('r');
		  putcharBluetooth(' ');
		  putcharBluetooth('y');
		  putcharBluetooth('o');
		  putcharBluetooth('u');
		  putcharBluetooth('\r');
	   	  putcharBluetooth('\n');
	  }
	  i = 0;
  }

  printf("Program ended\n");
  return 0;
}
