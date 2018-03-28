#include <stdio.h>
#include <string.h>
#include <io.h>

#define Wifi_Control (volatile unsigned char *)	(0x4000240)
#define Wifi_Status (volatile unsigned char *)	(0x4000240)
#define Wifi_TxData (volatile unsigned char *)	(0x4000242)
#define Wifi_RxData (volatile unsigned char *)	(0x4000242)
#define Wifi_Baud 	(volatile unsigned char *)	(0x4000244)

char getcharWifi(void);
int putcharWifi(int);
void sendStringWifi(char* str);
void Init_Wifi(void);

void Init_Wifi(void){

	IOWR_8DIRECT(Wifi_Baud, 0, 1);	//115k
	IOWR_8DIRECT(Wifi_Control, 0, 149);

	//IOWR_8DIRECT(Wifi_RxData, 0, 0);
	int i;
	for(i = 0; i < 10; i++){
		//Send a few newline (\n) chars to synchronize baud
		putcharWifi(0x0a);
	}
	printf("Init_Wifi() Complete\n");
}

void sendStringWifi(char* str){
	int i;
	for(i = 0; i < strlen(str); i++){
		putcharWifi(str[i]);
	}
}

int putcharWifi(int c){
	int status;

	while(1) {
		status = IORD_8DIRECT(Wifi_Status, 0);
		if((status & 2) == 2)
			break;
	}

	IOWR_8DIRECT(Wifi_TxData, 0, c);
	return c;
}

char getcharWifi(void){
		int status;

		while(1) {
			status = IORD_8DIRECT(Wifi_Status,0);

			if( (status & 1) == 1)
				break;
		}

		return (char) IORD_8DIRECT(Wifi_RxData,0);
}
