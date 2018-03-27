/*
 * Timer.c
 *
 *  Created on: Feb 13, 2018
 *      Author: bensw
 */

#include <stdio.h>
#include <stdlib.h>
#include <io.h>
#include <string.h>
#include <unistd.h>
#include "sys/alt_alarm.h"

//WARNING: seconds must be able to fit in 32 bit register
void Init_Timer(int timer_base, int seconds)
{
	int timer_period = seconds * 50000000;

	//set the period in the registers
	IOWR_16DIRECT(timer_base, 8, timer_period & 0xFFFF);
	IOWR_16DIRECT(timer_base, 12, timer_period >> 16);

	//write in control register
	IOWR_16DIRECT(timer_base, 4, 8);	//4'b1001 with stop interrupts on --> 9    4'b1000 --> 8 stop with interrupts off

	//clear the TO bit in Status register
	IOWR_16DIRECT(timer_base, 0, 0);
	printf("Init_Timer() Complete\n");
}

void Restart_Timer(int timer_base, int seconds)
{
	int timer_period = seconds * 50000000;

	//write in control register
	IOWR_16DIRECT(timer_base, 4, 9);	//4'b1001 with stop interrupts on --> 9    4'b1000 --> 8 stop with interrupts off

	//reset the counter in period registers
	IOWR_16DIRECT(timer_base, 8, timer_period & 0xFFFF);
	IOWR_16DIRECT(timer_base, 12, timer_period >> 16);

	Start_Timer(timer_base);
}

void Start_Timer(int timer_base)
{
	IOWR_16DIRECT(timer_base, 4, 7);	//4'b0111Start && continuous && interrupts on
}
