/*
 * gps.c
 *
 *  Created on: Jan 30, 2018
 *      Author: Sathya
 */

#define GPS_Control (volatile unsigned char *)	(0x4000210)
#define GPS_Status (volatile unsigned char *)	(0x4000210)
#define GPS_TxData (volatile unsigned char *)	(0x4000212)
#define GPS_RxData (volatile unsigned char *)	(0x4000212)
#define GPS_Baud 	(volatile unsigned char *)	(0x4000214)

char getCharGPS();
int putCharGPS(int c);

void Init_GPS() {

	IOWR_8DIRECT(GPS_Baud, 0, 5);
	IOWR_8DIRECT(GPS_Control, 0, 149);

	// How long will the string be?
	getCharGPS();
}

char getCharGPS() {

	int status;

	while (1) {
		status = IORD_8DIRECT(GPS_Status, 0);

		if ((status & 1) == 1)
			break;
	}

	return (char) IORD_8DIRECT(GPS_RxData, 0);
}

int putCharGPS(int c) {

	int status;

	while (1) {
		status = IORD_8DIRECT(GPS_Status, 0);

		if ((status & 2) == 2)
			break;
	}

	IOWR_8DIRECT(GPS_TxData, 0, c);

	return c;
}

// these two functions take a 4 byte IEEE-754 format float
// (passed as a 4 byte int representing latitude and longitude values)
// in big endian format and converts it to an ASCII decimal string
// which it returns with decimal point in the string.
char *FloatToLatitudeConversion(int x) //output format is xx.yyyy
{
	static char buff[100];

	float *ptr = (float *) (&x); // cast int to float
	float f = *ptr; // get the float

	sprintf(buff, "%2.4f", f); // write in string to an array

	return buff;
}
char *FloatToLongitudeConversion(int x) // output format is (-)xxx.yyyy
{
	static char buff[100];

	float *ptr = (float *) (&x);
	float f = *ptr;

	sprintf(buff, "%3.4f", f);

	return buff;
}

int swapEndian(char *s) {

	register int val;

	val = strtoul(s, NULL, 16); // convert to 4 byte int form in base 16
	val = ((val << 8) & 0xFF00FF00) | ((val >> 8) & 0xFF00FF);
	val = (val << 16) | ((val >> 16) & 0xFFFF);

	return val;
}
