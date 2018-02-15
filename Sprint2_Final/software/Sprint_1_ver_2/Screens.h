/*
 * Screens.h
 *
 *  Created on: Feb 15, 2018
 *      Author: bensw
 */

#ifndef SCREENS_H_
#define SCREENS_H_

#define MAX_WIFI_INFO_OF_INTEREST_SIZE 5

void ScreenOneLoad();
void Key7Pressed(void);
void Key8Pressed(void);
void Key9Pressed(void);
void KeyBackPressed(void);
void Key4Pressed(void);
void Key5Pressed(void);
void Key6Pressed(void);
void KeyOkPressed(void);
void Key1Pressed(void);
void Key2Pressed(void);
void Key3Pressed(void);
void Key0Pressed(void);

//global variables
volatile int state;		//initial state
char security_code[5];
int security_code_index;
int attempts;

//global variable to save the security code
char wifi_info_of_interest[MAX_WIFI_INFO_OF_INTEREST_SIZE];

#endif /* SCREENS_H_ */
