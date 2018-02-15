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
#include <stdlib.h>
#include <io.h>
#include <string.h>
#include <unistd.h>
#include "sys/alt_alarm.h"

//interrupts
#include "system.h"
#include "sys/alt_irq.h"
#include <alt_types.h>

//our own header file
#include "Screens.h"
void Init_Interrupt(void);	//function prototype
void handle_button_interrupts_timer_0(void* context, alt_u32 id);
void handle_button_interrupts_timer_1(void* context, alt_u32 id);

//timer
#define TIMER_BASE_TIMER_0 0x2080
#define TIMER_BASE_TIMER_1 0x20A0
#define TIMER_IRQ_NUMBER_TIMER_0 4
#define TIMER_IRQ_NUMBER_TIMER_1 3
//timer durations in seconds
#define TIMER_DURATION_TIMER_0 30
#define TIMER_DURATION_TIMER_1 60

//ATTENTION: COLOUR PALLETE VALUES HAVE BEEN CHANGED. OTHER THAN BLANK AND WHITE, EVERYTHING ELSE IS WRONG
#define BLACK   0
#define WHITE   16
#define RED   2
#define LIME   3
#define BLUE   4
#define YELLOW   5
#define CYAN   6
#define MAGENTA   7

#define Wifi_Control (volatile unsigned char *)	(0x4000240)
#define Wifi_Status (volatile unsigned char *)	(0x4000240)
#define Wifi_TxData (volatile unsigned char *)	(0x4000242)
#define Wifi_RxData (volatile unsigned char *)	(0x4000242)
#define Wifi_Baud 	(volatile unsigned char *)	(0x4000244)

typedef struct {
	int x, y;
} Point;

//global variables
Point p1, p2;

/*
 * state0 == start and welcome screen
 * state1 == enter barcode
 */

//Function declarations
void InitializeStartScreen_state0(void);
void Init_Touchscreen(void);
void InitializeStartScreen_state1(void);
void RetrieveWiFiSecurityCode(void);
void UpdateGPSBlocking(void);

int Coord_Touch_To_VGA_x(int x);
int Coord_Touch_To_VGA_y(int y);

Point GetPress(void);
Point GetRelease(void);
Point GetPressNoWaitForTouch(void);

char getcharWifi(void);
void sendStringWifi(char* str);
void Init_Wifi(void);
void test(void);

//gps global variables
char string_hour[3];
char int_hour;
int k = 0;
char GGA_parsed_line[77];
char single_character;
char complete_time[15];
char lattitude[16];
char longitude[17];
char char1;

//gps volatile interrupt variable
volatile int update_interrupt_signal = 0;

//for state where wifi is used
#define MAX_WIFI_BUFFER_SIZE 100
char wifi_response[MAX_WIFI_BUFFER_SIZE];
int wifi_counter = 0;

int main() {
	//initialize state
	state = 0;
	printf("Hello from Nios II!\n");

	//Artificial Database initialization
	group7[0].id = "Matthew";
	group7[0].hash = 1054976;
	group7[0].phone = "(518) 366-7951";

	group7[1].id = "Sathya";
	group7[1].hash = 997888;
	group7[1].phone = "(518) 366-7951";

	group7[2].id = "Benjamin";
	group7[2].hash = 923904;
	group7[2].phone = "(518) 366-7951";

	group7[3].id = "Lam";
	group7[3].hash = 953088;
	group7[3].phone = "(518) 366-7951";

	//Initialize all modules
	Init_GPS();
	Init_Touchscreen();
	Init_Wifi();
	Init_Timer(TIMER_BASE_TIMER_0, TIMER_DURATION_TIMER_0);	//idle screen timer
	Init_Timer(TIMER_BASE_TIMER_1, TIMER_DURATION_TIMER_1);	//gps timer
	Init_Interrupt();
	Reset();	//reset for SHA 256

	//start idle screen interrupt timer: timer 0
	Start_Timer(TIMER_BASE_TIMER_0);

	//start GPS fetch timer: timer 1
	Start_Timer(TIMER_BASE_TIMER_1);

	while (1) {
		switch (state) {
		//start screen, state 0
		case 0:
			clearBtns();
			ScreenZeroLoad();
			UpdateGPSBlocking();

			//constantly checking for touch
			while (state == 0) {

				if (update_interrupt_signal == 1)
					UpdateGPSBlocking();

				//does not block unless screen is touched
				if (ScreenTouchedNoBlock()) {
					//restart timer
					Restart_Timer(TIMER_BASE_TIMER_0, TIMER_DURATION_TIMER_0);

					Capture_Touch_Points();

					printf("Button was pressed! Moving to screen 1\n");
					state = 1;
				}
			}
			break;

			//second screen, state 1
		case 1:
			clearBtns();
			ScreenOneLoad();
			UpdateGPSBlocking();
			while (state == 1) {
				//check timer interrupt signal
				if (update_interrupt_signal == 1)
					UpdateGPSBlocking();

				//check if SHA block is done hashing
				if (WaitForDoneNoBlock()) {
					long long hashed = readWholeHash();
					WaitForReady();

					int i;
					for (i = 0; i < 4; i++) {
						if (hashed == group7[i].hash) {
							//restart timer
							Restart_Timer(TIMER_BASE_TIMER_0, TIMER_DURATION_TIMER_0);
							// Update global variables in Screen.h MOVE TO STATE 2
							passenger = i;
							state = 2;
							break;
						}
						else if (i == 3) {
							// GO TO ERROR SCREEN
							state = 4;
							errCode = 0;
						}

					}

					if (ScreenTouchedNoBlock()) {
						//restart timer
						Restart_Timer(TIMER_BASE_TIMER_0,
						TIMER_DURATION_TIMER_0);
					}
				}
			}
			break;

			//wifi module password input screen
		case 2:
			ScreenTwoLoad();
			UpdateGPSBlocking();
			RetrieveWiFiSecurityCode();

			clearBtns();
			addBtn(415, 415 + 88, 117, 117 + 82, Key7Pressed);
			addBtn(509, 509 + 88, 117, 117 + 82, Key8Pressed);
			addBtn(603, 603 + 88, 117, 117 + 82, Key9Pressed);
			addBtn(697, 697 + 88, 117, 117 + 82, KeyBackPressed);
			addBtn(415, 415 + 88, 205, 205 + 82, Key4Pressed);
			addBtn(509, 509 + 88, 205, 205 + 82, Key5Pressed);
			addBtn(603, 603 + 88, 205, 205 + 82, Key6Pressed);
			addBtn(697, 697 + 88, 205, 205 + 258, KeyOkPressed);
			addBtn(415, 415 + 88, 293, 293 + 82, Key1Pressed);
			addBtn(509, 509 + 88, 293, 293 + 82, Key2Pressed);
			addBtn(603, 603 + 88, 293, 293 + 82, Key3Pressed);
			addBtn(415, 415 + 276, 381, 381 + 82, Key0Pressed);

			while (state == 2) {
				if (update_interrupt_signal == 1)
					UpdateGPSBlocking();

				if (ScreenTouchedNoBlock()) {
					//restart idle timer
					Restart_Timer(TIMER_BASE_TIMER_0,
					TIMER_DURATION_TIMER_0);

					Capture_Touch_Points();
					runBtn(p1.x, p1.y);
				}
			}
			break;

		case 3:
			clearBtns();
			ScreenThreeLoad();
			UpdateGPSBlocking();
			usleep(2000000);		//sleep 10 seconds before going to the start screen
			state = 0;
			break;

		case 4:
			clearBtns();
			ScreenErrLoad();
			UpdateGPSBlocking();
			usleep(2000000);		//sleep 10 seconds before going to the start screen
			state = 0;
			break;
		}
	}
	printf("Done execution\n");
	return 0;
}

void test(void) {
	printf("Button 7 touched\n");
	state = 0;
}

//big if loop to determine if the user touched the buttons
//USES global variable p1 and p2
void Screen_State_2_Button_If_Conditions(void) {
	/*
	 void DrawKeyPad(){
	 DrawScreen(key7, 88, 82, 415, 117, 0);		x_upperbound = 503, y_upperbound = 199
	 DrawScreen(key8, 88, 82, 509, 117, 0);		x_upperbound = 597, y_upperbound = 199
	 DrawScreen(key9, 88, 82, 603, 117, 0);		x_upperbound = 691, y_upperbound = 199
	 DrawScreen(keyback, 88, 82, 697, 117, 0);	x_upperbound =
	 DrawScreen(key4, 88, 82, 415, 205, 0);
	 DrawScreen(key5, 88, 82, 509, 205, 0);
	 DrawScreen(key6, 88, 82, 603, 205, 0);
	 DrawScreen(keyok, 88, 258, 697, 205, 0);
	 DrawScreen(key1, 88, 82, 415, 293, 0);
	 DrawScreen(key2, 88, 82, 509, 293, 0);
	 DrawScreen(key3, 88, 82, 603, 293, 0);
	 DrawScreen(key0, 276, 82, 415, 381, 0);
	 */
}

//captures the pen down and pen up values into the global variables P1, p2
//WARNING: Pen release BLOCKS within this function
void Capture_Touch_Points(void) {
	p1 = GetPressNoWaitForTouch();
	p1.x = Coord_Touch_To_VGA_x(p1.x);
	p1.y = Coord_Touch_To_VGA_y(p1.y);
	printf("Press x: %d y: %d\n", p1.x, p1.y);

	p2 = GetRelease();
	p2.x = Coord_Touch_To_VGA_x(p2.x);
	p2.y = Coord_Touch_To_VGA_y(p2.y);
	printf("Release x: %d y: %d\n\n", p2.x, p2.y);
}
/* Timer interrupt testing
 int main()
 {
 alt_irq_register();	//enable hardware interrupt with Legacy HAL API

 Init_Timer(TIMER_BASE_TIMER_0);
 Init_Timer(TIMER_BASE_TIMER_1);
 Init_Interrupt();

 int done;
 int status;
 //printf(" Starting Timer\n");
 //	    	IOWR_16DIRECT(TIMER_BASE, 4, 1 << 2);	//start with interrupts off
 //	    	printf(" Waiting for timer to expire...\n");
 //	    	done = 0;
 //	    	while (! done) {
 //	    		status = IORD_16DIRECT(TIMER_BASE, 0);
 //	    		done = status & 0x1;
 //	    	}
 //	    	printf(" 5 seconds timer is done\n");

 IOWR_16DIRECT(TIMER_BASE_TIMER_0, 4, 7);	//4'b0111Start && continuous && interrupts on
 IOWR_16DIRECT(TIMER_BASE_TIMER_1, 4, 7);	//turn on timer 0
 printf("Timer triggered\n");
 while(1)
 {
 //should infinitely trigger interrupt every 5 seconds
 }
 }
 */

//enables various interrupts
void Init_Interrupt(void) {
	alt_irq_register( TIMER_IRQ_NUMBER_TIMER_0,
	NULL, handle_button_interrupts_timer_0);

	alt_irq_register( TIMER_IRQ_NUMBER_TIMER_1,
	NULL, handle_button_interrupts_timer_1);
	printf("Init_Interrupt() Complete\n");
}

//idle screen interrupt ISR triggered by timer
void handle_button_interrupts_timer_0(void* context, alt_u32 id) {
	printf("Idle screen timer interrupt executed. Going to start screen\n");
	state = 0;

	//clear the TO bit in Timer's Status register to lower the IRQ flag
	IOWR_16DIRECT(TIMER_BASE_TIMER_0, 0, 0);
}

void handle_button_interrupts_timer_1(void* context, alt_u32 id) {
	printf("GPS 60 second timer ISR executed. Updating time and coordinates\n");
	update_interrupt_signal = 1;

	//clear the TO bit in Status register to lower the IRQ flag
	IOWR_16DIRECT(TIMER_BASE_TIMER_1, 0, 0);
}

//TRANSLATES TOUCH COORDINATE TO VGA COORDINATE
int Coord_Touch_To_VGA_x(int x) {
	double value = (800.0 / 1024.0) * x;
	return (int) value;
}

int Coord_Touch_To_VGA_y(int y) {
	double value = (480.0 / 1024.0) * y;
	return (int) value;
}

//WARNING: DO NOT MAKE FETCHING TIME MODULAR.
//IT WON'T WORK BECAUSE THIS IS NOT A WHILE LOOP, BUT IS AN IF LOOP
void UpdateGPS() {
	if (getcharGPS() == 'G') {
		if (getcharGPS() == 'G') {
			if (getcharGPS() == 'A') {
				getcharGPS();	//blank read the ','
				do {
					single_character = getcharGPS();
					GGA_parsed_line[k] = single_character;
					k++;
				} while (single_character != '\n');
				GGA_parsed_line[k] = '\0';
				k = 0;	//reset k

				string_hour[0] = GGA_parsed_line[0];
				string_hour[1] = GGA_parsed_line[1];
				string_hour[2] = '\0';
				int_hour = atoi(string_hour);//parse the hour from string to int

				//convert to 24 hour clock time to Pacific time
				if (int_hour < 7)
					int_hour = 24 - (8 - int_hour);
				else
					int_hour -= 8;

				snprintf(complete_time, sizeof(complete_time),
						"H:%d M:%c%c S:%c%c", int_hour, GGA_parsed_line[2],
						GGA_parsed_line[3], GGA_parsed_line[4],
						GGA_parsed_line[5]);

				//actually print it out to the screen
				OutGraphicsStringFont2(590, 15, BLACK, WHITE, complete_time, 1);

				//printf("%s", GGA_parsed_line);		//debugging purposes only
			}
		}
	}
}

//blocks
//prints out both coordinates and the time
void UpdateGPSBlocking(void) {
	int status = 0;
	while (status == 0) {
		if (getcharGPS() == 'G') {
			if (getcharGPS() == 'G') {
				if (getcharGPS() == 'A') {
					getcharGPS();	//blank read the ','
					do {
						single_character = getcharGPS();
						GGA_parsed_line[k] = single_character;
						k++;
					} while (single_character != '\n');
					GGA_parsed_line[k] = '\0';
					k = 0;	//reset k

					string_hour[0] = GGA_parsed_line[0];
					string_hour[1] = GGA_parsed_line[1];
					string_hour[2] = '\0';
					int_hour = atoi(string_hour);//parse the hour from string to int

					//convert to 24 hour clock time to Pacific time
					if (int_hour < 7)
						int_hour = 24 - (8 - int_hour);
					else
						int_hour -= 8;

					//If you want seconds, the two are located in GGA_parsed_line[4] and GGA_parsed_line[5]
					snprintf(complete_time, sizeof(complete_time),
							"H:%d M:%c%c", int_hour, GGA_parsed_line[2],
							GGA_parsed_line[3]);

					//actually print it out to the screen
					OutGraphicsStringFont2(650, 15, BLACK, WHITE, complete_time,
							1);

					//print out coordinates
					snprintf(lattitude, sizeof(lattitude), "Lattitude: %c%c %c",
							GGA_parsed_line[11], GGA_parsed_line[12],
							GGA_parsed_line[21]);

					snprintf(longitude, sizeof(longitude),
							"Longitude: %c%c%c %c", GGA_parsed_line[23],
							GGA_parsed_line[24], GGA_parsed_line[25],
							GGA_parsed_line[34]);

					OutGraphicsStringFont2(560, 35, BLACK, WHITE, lattitude, 1);
					OutGraphicsStringFont2(560, 50, BLACK, WHITE, longitude, 1);

					//printf("%s", GGA_parsed_line);		//debugging purposes only

					//break out of this blocking function
					status = 1;
				}
			}
		}
	}
	update_interrupt_signal = 0;
}

void CoordinateUpdate(void) {
	snprintf(lattitude, sizeof(lattitude), "Lattitude: %c%c %c",
			GGA_parsed_line[11], GGA_parsed_line[12], GGA_parsed_line[21]);

	snprintf(longitude, sizeof(longitude), "Longitude: %c%c%c %c",
			GGA_parsed_line[23], GGA_parsed_line[24], GGA_parsed_line[25],
			GGA_parsed_line[34]);

	OutGraphicsStringFont2(560, 35, BLACK, WHITE, lattitude, 1);
	OutGraphicsStringFont2(560, 50, BLACK, WHITE, longitude, 1);
}

/*
 * WARNING: User must not touch the screen while this function is being run. I don't know the reason for this
 *
 * Functionality:
 * 1)Initiates WiFi module to send a secure password to user
 * 2)Fetches the randomly generated secude password from the WiFi Module and SAVES the password in global array called wifi_info_of_interest
 */
void RetrieveWiFiSecurityCode(void) {
	int status = 0;
	//sends a random text message. //Now need to make it text a random 4 digit code

	while (status == 0) {
		sendStringWifi("dofile(\"send_text_message.lua\")\n");

		//IMPORTANT NOTE: You need at least 3 seconds
		usleep(250000);
		sendStringWifi("check_wifi()\n");

		//keep reading characters from wifi module until '~'
		//IMPORTANT NOTE: '~' is the character at the END of our info of interest
		//IMPORTANT NOTE: '^' is the character at the START of our info of interest

		//reset wifi counter
		wifi_counter = 0;

		do {
			char1 = getcharWifi();
			wifi_response[wifi_counter++] = char1;
		} while (char1 != '~' && wifi_counter < MAX_WIFI_BUFFER_SIZE);
		//replace the '~'string with '\0'
		wifi_response[wifi_counter - 1] = '\0';

		//search index for '^'
		wifi_counter = 0;
		do {
			char1 = wifi_response[wifi_counter++];
		} while (char1 != '^');

		//extract info of interest
		int i;
		for (i = 0; i < MAX_WIFI_INFO_OF_INTEREST_SIZE - 1; i++) {
			char1 = wifi_response[wifi_counter++];
			wifi_info_of_interest[i] = char1;
			if (i == 3 && char1 == '\0') {
				printf(
						"Error: DE1 only received 3 characters from WiFi module. Cannot compare user input\n");
				printf("Executing password generation again\n");
			}

			//get out of the loop
			else if (i == 3 && char1 != '\0')
				status = 1;
		}
	}

	wifi_info_of_interest[MAX_WIFI_INFO_OF_INTEREST_SIZE - 1] = '\0';

	//debugging purposes only
	printf("Correct security code: %s\n", wifi_info_of_interest);
}
