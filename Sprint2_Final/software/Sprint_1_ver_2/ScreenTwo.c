/*
 * ScreenThree.c
 *
 *  Created on: Feb 14, 2018
 *      Author: shado
 */

void ScreenTwoLoad(){
	int i, j;
	ClearScreen(16);
	DrawProgress(2);
	DrawKeyPad();
	OutGraphicsStringFont2(70,183,0,16,"Please enter your OTP",1);
	DrawPasswordBox();
	//TODO
}


