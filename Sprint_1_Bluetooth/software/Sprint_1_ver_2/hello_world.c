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

//Colours
#define BLACK   0
#define WHITE   1
#define RED   2
#define LIME   3
#define BLUE   4
#define YELLOW   5
#define CYAN   6
#define MAGENTA   7

//Serial Ports
#define BLUETOOTH_Control (volatile unsigned char *)(0x4000220)
#define BLUETOOTH_Status (volatile unsigned char *)	(0x4000220)
#define BLUETOOTH_TxData (volatile unsigned char *)	(0x4000222)
#define BLUETOOTH_RxData (volatile unsigned char *)	(0x4000222)
#define BLUETOOTH_Baud 	(volatile unsigned char *)	(0x4000224)

typedef struct { int x, y; } Point;

//global variables
Point p1, p2;
int state = 0;		//initial state

/*
 * state0 == start and welcome screen
 */

//Function declarations
void InitializeStartScreen_state0(void);
void Init_Touchscreen(void);
void InitializeStartScreen_state1(void);

int Coord_Touch_To_VGA_x(int x);
int Coord_Touch_To_VGA_y(int y);

Point GetPress(void);
Point GetRelease(void);

char serial_msg [200];
char flag;
int i = 0, num = 0;

int main()
{
  printf("Hello from Nios II!\n");

  //enable touchscreen forever
  Init_Touchscreen();

  Init_Bluetooth();

  //Initialize_Bluetooth();
  Initialize_Bluetooth();

  while(1)
  {
	  switch(state)
	    {

		//start screen, state 0
	    case 0:
	    	//load graphics for screen
	  	  InitializeStartScreen_state0();

	  	  while(1){
	  		  //check for buttons
	  		  p1 = GetPress();
	  		  p1.x = Coord_Touch_To_VGA_x(p1.x);
	  		  p1.y = Coord_Touch_To_VGA_y(p1.y);
	  		  printf("Press x: %d y: %d\n", p1.x, p1.y);

	  		  p2 = GetRelease();
	  		  p2.x = Coord_Touch_To_VGA_x(p2.x);
	  		  p2.y = Coord_Touch_To_VGA_y(p2.y);
	  		  printf("Release x: %d y: %d\n\n", p2.x, p2.y);

	  		  //state transition check
	  		  if( (p1.x >= 450 && p1.x <= 750) && (p2.x >= 450 && p2.x <= 750) &&
	  				  (p1.y >= 330 && p1.y <= 430) && (p2.y >= 330 && p2.y <= 430) )
	  		  {
	  			  //state = 1;
	  			  printf("Button was pressed! Moving to 2nd state\n");
	  			  state = 1;
	  			  break;
	  		  }
	  	  }
	  	  break;

		//second screen, state 1
	    case 1:
	    	InitializeStartScreen_state1();

	    	while(1)
	    	{
	    		//check for buttons
	    		p1 = GetPress();
				p1.x = Coord_Touch_To_VGA_x(p1.x);
				p1.y = Coord_Touch_To_VGA_y(p1.y);
				printf("Press x: %d y: %d\n", p1.x, p1.y);

				p2 = GetRelease();
				p2.x = Coord_Touch_To_VGA_x(p2.x);
				p2.y = Coord_Touch_To_VGA_y(p2.y);
				printf("Release x: %d y: %d\n\n", p2.x, p2.y);

				//state transition check
				if( (p1.x <= 300) && (p2.x <= 300) &&
						(p1.y >= 380 && p1.y <= 480) && (p2.y >= 380 && p2.y <= 480) )
				{
					//state = 1;
					printf("Button was pressed! Moving to start screen\n");
					state = 0;
					break;
				}

				//if button has not been touched, keep checking for bluetooth data
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

										//if data arrived, print it to the lcd
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
	    }
  }
  return 0;
}

//TRANSLATES TOUCH COORDINATE TO VGA COORDINATE
int Coord_Touch_To_VGA_x(int x)
{
	double value = (800.0/1024.0) * x;
	return (int) value;
}

int Coord_Touch_To_VGA_y(int y)
{
	double value = (480.0/1024.0) * y;
	return (int) value;
}
