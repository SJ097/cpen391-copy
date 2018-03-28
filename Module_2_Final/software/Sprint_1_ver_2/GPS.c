/*
 * GPS.c
 *
 *  Created on: Feb 7, 2018
 *      Author: bensw
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <io.h>
#include <time.h>

#define GPS_Control (volatile unsigned char *)	(0x4000210)
#define GPS_Status (volatile unsigned char *)	(0x4000210)
#define GPS_TxData (volatile unsigned char *)	(0x4000212)
#define GPS_RxData (volatile unsigned char *)	(0x4000212)
#define GPS_Baud 	(volatile unsigned char *)	(0x4000214)

#define BLACK   0
#define WHITE   1
#define RED   2
#define LIME   3
#define BLUE   4
#define YELLOW   5
#define CYAN   6
#define MAGENTA   7

char getcharGPS(void);

void Init_GPS(void)
{
	IOWR_8DIRECT(GPS_Baud, 0, 7);			//9600baud rate -> 3'b111
	IOWR_8DIRECT(GPS_Control, 0, 21);		// divide by 16 clock FOR NOW, 8	bits of data, no parity, 1 stop bit -> 6'b0_101_01 == 6'd21

	IOWR_8DIRECT(GPS_RxData, 0, 0);

	/*
	putcharGPSs('$');
	putcharGPSs('P');
	putcharGPSs('M');
	putcharGPSs('T');
	putcharGPSs('K');
	putcharGPSs('1');
	putcharGPSs('0');
	putcharGPSs('3');
	putcharGPSs('*');
	putcharGPSs('3');
	putcharGPSs('0');
	putcharGPSs('\r');
	putcharGPSs('\n');
*/
	printf("Init_GPS() complete\n");
}

int putcharGPSs(int c){
	int status;

	while(1) {
		status = IORD_8DIRECT(GPS_Status, 0);
		if((status & 2) == 2)
			break;
	}

	IOWR_8DIRECT(GPS_TxData, 0, c);
	return c;
}

char getcharGPS(void){
		int status;

		while(1) {
			status = IORD_8DIRECT(GPS_Status,0);

			if( (status & 1) == 1)
				break;
		}

		return (char) IORD_8DIRECT(GPS_RxData,0);
}

void GPSDumpLogData(void)
{
	//$PMTK622,1*29<CR><LF>
	putcharGPSs('$');
	putcharGPSs('P');
	putcharGPSs('M');
	putcharGPSs('T');
	putcharGPSs('K');
	putcharGPSs('6');
	putcharGPSs('2');
	putcharGPSs('2');
	putcharGPSs(',');
	putcharGPSs('1');
	putcharGPSs('*');
	putcharGPSs('2');
	putcharGPSs('9');
	putcharGPSs('\r');
	putcharGPSs('\n');

	char char1;

	while(1)
	{
		if(getcharGPS() == '$')
			{
					//empty reads
				getcharGPS();	//p
				getcharGPS();	//m
				getcharGPS();	//t
				getcharGPS();	//k
				getcharGPS();	//l
				getcharGPS();	//o
				getcharGPS();	//x
				getcharGPS();	//,
				if(getcharGPS() == '2')
				{
					printf("$PMTKLOX,2");
					do {
						char1 = getcharGPS();
						printf("%c", char1);
					} while(char1 != '\n');
					break;
				}
				else
				{
					printf("$PMTKLOX,1");
					do {
						char1 = getcharGPS();
						printf("%c", char1);
					} while(char1 != '\n');
				}
			}
	}

}
