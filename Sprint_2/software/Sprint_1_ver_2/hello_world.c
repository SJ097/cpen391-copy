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

#define BLACK   0
#define WHITE   1
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
Point GetPressNoWaitForTouch(void);

char getcharWifi(void);
void sendStringWifi(char* str);
void Init_Wifi(void);

char string_hour[3];
char int_hour;
int k = 0;
char GGA_parsed_line[77];
char single_character;
char complete_time[15];
char lattitude[16];
char longitude[17];
char char1;

//for state where wifi is used
#define MAX_WIFI_BUFFER_SIZE 100
char wifi_response[MAX_WIFI_BUFFER_SIZE];
int wifi_counter = 0;
#define MAX_WIFI_INFO_OF_INTEREST_SIZE 5
char wifi_info_of_interest[MAX_WIFI_INFO_OF_INTEREST_SIZE];

int main()
{
  printf("Hello from Nios II!\n");

  //Initialize GPS setup
  Init_GPS();

  //initialize touchscreen
  Init_Touchscreen();

  Init_Wifi();

  while(1)
  {
	  switch(state)
	    {

		//start screen, state 0
	    case 0:
	    	InitializeScreenState0();
	  	  CoordinateUpdate();

	  	  //constantly checking for touch
	  	  while(1){
			//does not block unless screen is touched
			if(ScreenTouchedNoBlock())
			{
	  			p1 = GetPressNoWaitForTouch();
				p1.x = Coord_Touch_To_VGA_x(p1.x);
				p1.y = Coord_Touch_To_VGA_y(p1.y);
				printf("Press x: %d y: %d\n", p1.x, p1.y);
	
				//WARNING: Blocks until release
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
			//update the time
			UpdateGPS();
	  	  }
	  	  break;
		  
		//second screen, state 1
	    case 1:
	    	InitializeScreenState1();
	    	CoordinateUpdate();

	    	RetrieveWiFiSecurityCode();

	    	while(1)
	    	{
				if(ScreenTouchedNoBlock())
				{
					p1 = GetPressNoWaitForTouch();
					p1.x = Coord_Touch_To_VGA_x(p1.x);
					p1.y = Coord_Touch_To_VGA_y(p1.y);
					printf("Press x: %d y: %d\n", p1.x, p1.y);

					p2 = GetRelease();
					p2.x = Coord_Touch_To_VGA_x(p2.x);
					p2.y = Coord_Touch_To_VGA_y(p2.y);
					printf("Release x: %d y: %d\n\n", p2.x, p2.y);

					//state transition check

					//back button
					if( (p1.x <= 300) && (p2.x <= 300) &&
							(p1.y >= 380 && p1.y <= 480) && (p2.y >= 380 && p2.y <= 480) )
					{
						//state = 1;
						printf("Back button pressed\n");
						state = 0;
						break;
					}
					//next button
					else if( (p1.x >= 500 && p1.x <= 800) && (p2.x >= 500 && p2.x <= 800) &&
							(p1.y >= 380 && p1.y <= 480) && (p2.y >= 380 && p2.y <= 480) )
					{
						printf("Next Button pressed\n");
						state = 2;
						break;
					}
				}
				//update the time
				UpdateGPS();
	    	}

	    case 2:
	    	InitializeScreenState1();
	    	CoordinateUpdate();

	    	RetrieveWiFiSecurityCode();

	    	while(1)
	    	{

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


//WARNING: DO NOT MAKE FETCHING TIME MODULAR.
//IT WON'T WORK BECAUSE THIS IS NOT A WHILE LOOP, BUT IS AN IF LOOP
void UpdateGPS()
{
	if(getcharGPS() == 'G')
		  {
			  if(getcharGPS() == 'G')
			  	  {
				  if(getcharGPS() == 'A')
				  	  {
					  getcharGPS();	//blank read the ','
					  do {
						single_character = getcharGPS();
						GGA_parsed_line[k] = single_character;
						k++;
					  } while (single_character != '\n');
					  GGA_parsed_line[k] = '\0';
					  k=0;	//reset k

					  string_hour[0] = GGA_parsed_line[0];
					  string_hour[1] = GGA_parsed_line[1];
					  string_hour[2] = '\0';
					  int_hour = atoi(string_hour);		//parse the hour from string to int

					  //convert to 24 hour clock time to Pacific time
					  if(int_hour < 7)
						  int_hour = 24 - (8-int_hour);
					  else
						  int_hour -= 8;

					  snprintf(complete_time, sizeof(complete_time), "H:%d M:%c%c S:%c%c",
							  int_hour, GGA_parsed_line[2], GGA_parsed_line[3],
							  GGA_parsed_line[4], GGA_parsed_line[5]);

					  //actually print it out to the screen
					  OutGraphicsStringFont2(590,15,BLACK,WHITE,complete_time, 1);

					  //printf("%s", GGA_parsed_line);		//debugging purposes only
				  	  }
			  	  }
		  }
}

void CoordinateUpdate(void)
{
	  snprintf(lattitude, sizeof(lattitude), "Lattitude: %c%c %c",
								  GGA_parsed_line[11], GGA_parsed_line[12], GGA_parsed_line[21]);

						  snprintf(longitude, sizeof(longitude), "Longitude: %c%c%c %c",
								  GGA_parsed_line[23], GGA_parsed_line[24], GGA_parsed_line[25], GGA_parsed_line[34]);


						  OutGraphicsStringFont2(560,35,BLACK,WHITE,lattitude, 1);
						  OutGraphicsStringFont2(560,50,BLACK,WHITE,longitude, 1);
}

/*
 * WARNING: User must not touch the screen while this function is being run. I don't know the reason for this
 *
 * Functionality:
 * 1)Initiates WiFi module to send a secure password to user
 * 2)Fetches the randomly generated secude password from the WiFi Module and SAVES the password in global array called wifi_info_of_interest
 */
void RetrieveWiFiSecurityCode(void)
{
	//sends a random text message. //Now need to make it text a random 4 digit code
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
		    	} while(char1 != '~' && wifi_counter < MAX_WIFI_BUFFER_SIZE);
		    	//replace the '~'string with '\0'
		    	wifi_response[wifi_counter-1] = '\0';

		    	//search index for '^'
		    	wifi_counter = 0;
		    	do {
		    		char1 = wifi_response[wifi_counter++];
		    	} while(char1 != '^');

		    	//extract info of interest
		    	int i;
		    	for(i = 0; i < MAX_WIFI_INFO_OF_INTEREST_SIZE-1; i++)
		    	{
		    		char1 = wifi_response[wifi_counter++];
		    		wifi_info_of_interest[i] = char1;
		    		if(i == 3 && char1 == '\0')
		    		{
		    			printf("Error: DE1 only received 3 characters from WiFi module. Cannot compare user input\n");
		    		}
		    	}
		    	wifi_info_of_interest[MAX_WIFI_INFO_OF_INTEREST_SIZE - 1] = '\0';

		    	//debugging purposes only
		    	printf("%s", wifi_info_of_interest);
}
