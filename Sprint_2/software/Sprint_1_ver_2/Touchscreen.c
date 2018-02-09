/*
 * Touchscreen.c
 *
 *  Created on: Jan 31, 2018
 *      Author: p1p0b
 */

#include <stdio.h>
#include <io.h>

#define Touchscreen_Control (volatile unsigned char *)	(0x4000230)
#define Touchscreen_Status (volatile unsigned char *)	(0x4000230)
#define Touchscreen_TxData (volatile unsigned char *)	(0x4000232)
#define Touchscreen_RxData (volatile unsigned char *)	(0x4000232)
#define Touchscreen_Baud 	(volatile unsigned char *)	(0x4000234)

//global variables
typedef struct { int x, y; } Point;

Point p1, p2;

char getcharTouchscreen(void);
int putcharTouchscreen(int);

void Init_Touchscreen(void){

	IOWR_8DIRECT(Touchscreen_Baud, 0, 5);
	IOWR_8DIRECT(Touchscreen_Control, 0, 149);

	//IOWR_8DIRECT(Touchscreen_RxData, 0, 0);

	printf("Got here!\n");


	putcharTouchscreen(0x55);
	putcharTouchscreen(0x01);
	putcharTouchscreen(0x12);

	getcharTouchscreen(); //unused -1 value
	char ch1 = getcharTouchscreen();
	char ch2 = getcharTouchscreen();
	char ch3 = getcharTouchscreen();
	char ch4 = getcharTouchscreen();
	printf("Enable Touchscreen Status: %d\n", ch3);
}

int ScreenTouched(void){
	char c = getcharTouchscreen();
	return (c & 0x81) == 0x81;
}

int ScreenTouchedNoBlock(void){
	char c = IORD_8DIRECT(Touchscreen_RxData,0);
	return (c & 0x81) == 0x81;
}

void WaitForTouch(){
	while(!ScreenTouched())
		;
}

int ScreenReleased(void){
	char c = getcharTouchscreen();
	return (c & 0x81) == 0x80;

}

void WaitForRelease(){
	while(!ScreenReleased())
		;
}

Point GetPressNoWaitForTouch(void)
{
	Point p1;
	char x1 = getcharTouchscreen();
	char x2 = getcharTouchscreen();
	char y1 = getcharTouchscreen();
	char y2 = getcharTouchscreen();
	p1.x = ((x2 << 7) + x1) >> 2;		//Need to shift 2 bits right
	p1.y = ((y2 << 7) + y1) >> 2;

	return p1;
}

Point GetPress(void){
	Point p1;
	WaitForTouch();
	char x1 = getcharTouchscreen();
	char x2 = getcharTouchscreen();
	char y1 = getcharTouchscreen();
	char y2 = getcharTouchscreen();
	p1.x = ((x2 << 7) + x1) >> 2;		//Need to shift 2 bits right
	p1.y = ((y2 << 7) + y1) >> 2;

	return p1;
}

Point GetRelease(void){
	Point p1;
	WaitForRelease();
	char x1 = getcharTouchscreen();
	char x2 = getcharTouchscreen();
	char y1 = getcharTouchscreen();
	char y2 = getcharTouchscreen();
	p1.x = ((x2 << 7) + x1) >> 2;		//need to shift 2 bits right because last bit is always 00 and is useless
	p1.y = ((y2 << 7) + y1) >> 2;		//need to make it 2^10 from 2^12

	return p1;
}

int putcharTouchscreen(int c){
	int status;

	while(1) {
		status = IORD_8DIRECT(Touchscreen_Status, 0);
		if((status & 2) == 2)
			break;
	}

	IOWR_8DIRECT(Touchscreen_TxData, 0, c);
	return c;
}

char getcharTouchscreen(void){
		int status;

		while(1) {
			status = IORD_8DIRECT(Touchscreen_Status,0);

			if( (status & 1) == 1)
				break;
		}

		return (char) IORD_8DIRECT(Touchscreen_RxData,0);
}
