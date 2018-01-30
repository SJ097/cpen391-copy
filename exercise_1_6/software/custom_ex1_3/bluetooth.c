/*
 * bluetooth.c
 *
 *  Created on: Jan 28, 2018
 *      Author: bensw
 */
#include <stdio.h>
#include <io.h>

#define BLUETOOTH_Control (volatile unsigned char *)(0x4000220)
#define BLUETOOTH_Status (volatile unsigned char *)	(0x4000220)
#define BLUETOOTH_TxData (volatile unsigned char *)	(0x4000222)
#define BLUETOOTH_RxData (volatile unsigned char *)	(0x4000222)
#define BLUETOOTH_Baud 	(volatile unsigned char *)	(0x4000224)

/*
 * Subroutine to initialize the RS232 Port by writing some data
 * to the internal registers.
 * Call this function at the start of the program before you attempt
 * to read or write data via the RS232 port
 * Refer to 6850 data sheet for details of registers
 */
void Init_Bluetooth(void){
	// set up 6850 Control Register to utilize a divide by 16 clock
	// set RTS low, use 8 bits of data, no parity, 1 stop bit,
	// transmitter interrupt disabled
	// program baud rate generator to use 115k baud

	//set program the baud rate BEFORE setting the Bluetooth ACIA
	//115k
	IOWR_8DIRECT(BLUETOOTH_Baud, 0, 1);	

	//For some reason doing the master reset gives wrong reset and tx values
	//But turning it off makes it so that it gives correct rx and tx values

	//master reset in C0, C1 -> 8'b11
	//IOWR_8DIRECT(RS232_Control, 0, 3);

	//WHAT SHOULD THE CLOCK DIVIDE RATIO BE? Just do 16 for now
	//8 bits & no parity & 1 stop bit & RTS low with interrupt disabled && Receiver interrupt on
	//8'b1_00_101_01 -> 149 in decimal
	IOWR_8DIRECT(BLUETOOTH_Control, 0, 21);

	//clear the RxData register
	IOWR_8DIRECT(BLUETOOTH_RxData, 0, 0);
}

int putcharBluetooth(int c){
	// poll Tx bit in 6850 status register. Wait for it to become 1
	// write 'c' to the 6850 TxData register to output the character
	int status;

	while(1) {
		status = IORD_8DIRECT(BLUETOOTH_Status, 0);			//read status register
		//printf("Got IN the while loop in polling Tx! value of status is %x\n", status);
		if((status & 2) == 2)					//Tx Data Register Full in bit 1
			break;
	}

	//printf("Got OUT of the while loop in polling Tx!\n");
	IOWR_8DIRECT(BLUETOOTH_TxData, 0, c);
	return c;
}

char getcharBluetooth(void){
	// poll Rx bit in 6850 status register. Wait for it to become 1
	// read received character from 6850 RxData register
		//int status;

		//while(1) {
		//	status = IORD_8DIRECT(BLUETOOTH_Status,0);		//read status register
		//	printf("Got IN the while loop in polling Rx! value of status is %x\n", status);
		//	if( (status & 1) == 1)
		//	{
				//Rx Data Register Full in bit 0
			//	break;
		///	}
		//}

		//printf("Got OUT of the while loop in polling Rx!\n");
		return (char) IORD_8DIRECT(BLUETOOTH_RxData, 0);
}

int BluetoothTestForReceivedData(void){
	// test Rx bit in 6850 serial comms chip status register
	// if Rx bit is set, return TRUE, otherwise FALSE

	int status = IORD_8DIRECT(BLUETOOTH_Status, 0);
	return (status & 1) == 1;
}
