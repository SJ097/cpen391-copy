/*
 * RS232.c
 *
 *  Created on: Jan 27, 2018
 *      Author: bensw
 */
#include <stdio.h>
#include <io.h>

#define RS232_Control (volatile unsigned char *)(0x4000200)
#define RS232_Status (volatile unsigned char *)	(0x4000200)
#define RS232_TxData (volatile unsigned char *)	(0x4000202)
#define RS232_RxData (volatile unsigned char *)	(0x4000202)
#define RS232_Baud 	(volatile unsigned char *)	(0x4000204)

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

	//set program the baud rate BEFORE setting the RS232
	IOWR_8DIRECT(RS232_Baud, 0, 1);	//apparently 0x01 is 115k according to ex 1.3 example in the last 2 pages

	//For some reason doing the master reset gives wrong reset and tx values
	//But turning it off makes it so that it gives correct rx and tx values

	//master reset in C0, C1 -> 8'b11
	//IOWR_8DIRECT(RS232_Control, 0, 3);

	//make divide by 16 clock && 8 bits of data with no parity and 1 stop bit && RTS low with interrupt disabled && Receiver interrupt on
	//which is 8'b0_00_101_01 -> 21 in decimal   	maybe try 0x95 -> 149 which is when receiving interrupt is on
	IOWR_8DIRECT(RS232_Control, 0, 21);

	//clear the RxData register
	IOWR_8DIRECT(RS232_RxData, 0, 0);
}

int putcharRS232(int c){
	// poll Tx bit in 6850 status register. Wait for it to become 1
	// write 'c' to the 6850 TxData register to output the character
	int status;

	while(1) {
		status = IORD_8DIRECT(RS232_Status, 0);			//read status register
		//printf("Got IN the while loop in polling Tx! value of status is %x\n", status);
		if((status & 2) == 2)					//Tx Data Register Full in bit 1
			break;
	}

	//printf("Got OUT of the while loop in polling Tx!\n");
	IOWR_8DIRECT(RS232_TxData, 0, c);
	return c;
}

char getcharRS232(void){
	// poll Rx bit in 6850 status register. Wait for it to become 1
	// read received character from 6850 RxData register
		int status;

		while(1) {
			status = IORD_8DIRECT(RS232_Status,0);		//read status register
			//printf("Got IN the while loop in polling Rx! value of status is %x\n", status);
			if( (status & 1) == 1)				//Rx Data Register Full in bit 0
				break;
		}

		//printf("Got OUT of the while loop in polling Rx!\n");
		return (char) IORD_8DIRECT(RS232_RxData,0);
}

int RS232TestForReceivedData(void){
	// test Rx bit in 6850 serial comms chip status register
	// if Rx bit is set, return TRUE, otherwise FALSE

	int status = IORD_8DIRECT(RS232_Status, 0);
	return (status & 1) == 1;
}
