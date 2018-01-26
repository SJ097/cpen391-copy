#define BASE_ADDR	  	  (volatile unsigned char*)(0x8400)
#define RS232_Control	  (volatile unsigned char*)(0x0200)
#define RS232_Status	  (volatile unsigned char*)(0x0200)
#define RS232_TxData	  (volatile unsigned char*)(0x0202)
#define RS232_RxData	  (volatile unsigned char*)(0x0202)
#define RS232_Baud	 	  (volatile unsigned char*)(0x0204)

#include <stdio.h>
#include "altera_avalon_pio_regs.h"

unsigned char extractBit(int c, int pos){
	c = c >> pos;
	c &= 0x01;
	return c;
}
/*
 * Subroutine to initialize the RS232 Port by writing some data
 * to the internal registers.
 * Call this function at the start of the program before you attempt
 * to read or write data via the RS232 port
 * Refer to 6850 data sheet for details of registers
 */
void Init_RS232(void){
	// set up 6850 Control Register to utilize a divide by 16 clock
	// set RTS low, use 8 bits of data, no parity, 1 stop bit,
	// transmitter interrupt disabled
	// program baud rate generator to use 115k baud

	IOWR_8DIRECT(0x8400,0x0200,0x95); //0x95 for interrupts 0x15 for no interrupts
	IOWR_8DIRECT(0x8400,0x0204,0x01);
}

int putcharRS232(int c){
	// poll Tx bit in 6850 status register. Wait for it to become 1
	// write 'c' to the 6850 TxData register to output the character
	int empty = 0;
	int status;
	int co = 0;
	do{
		co++;
		if(co > 100)
			break;
		status = IORD_16DIRECT(0x8400,0x0200);
		empty = extractBit(status,9);
		printf("%d\n", status >> 8);
	}
	while(empty == 0);
	IOWR_8DIRECT(0x8400,0x0202,c);
	return c;
}

char getcharRS232(void){
	// poll Rx bit in 6850 status register. Wait for it to become 1
	// read received character from 6850 RxData register
	int full = 0;
	int status;
	int co = 0;
	do{
		co++;
		if(co > 100)
			break;
		status = IORD_16DIRECT(0x8400,0x0200);
		full = extractBit(status,8);
	}
	while(full == 0);
	char c = IORD_8DIRECT(0x8400, 0x0202);
	int x = IORD_16DIRECT(0x8400, 0x0202);
	printf("x: %d\n", x);
	return c;
}

int RS232TestForReceivedData(void){
	// test Rx bit in 6850 serial comms chip status register
	// if Rx bit is set, return TRUE, otherwise FALSE
	int status = IORD_16DIRECT(0x8400,0x0200);
	return extractBit(status,8) == 1;
}

