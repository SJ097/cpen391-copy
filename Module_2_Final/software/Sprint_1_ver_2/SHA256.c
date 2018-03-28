#include <stdio.h>
#include <io.h>

#define Hash_Control (volatile unsigned char *)(0x4000300)
#define Hash_Status (volatile unsigned char *)	(0x4000300)
#define Hash_Base (volatile unsigned char *)	(0x4000310)
void hashNum(int num) {
	IOWR_8DIRECT(Hash_Base, 0, num);
	IOWR_8DIRECT(Hash_Control, 0, 2);
	int status, done;
	do {
		status = IORD_8DIRECT(Hash_Status, 0);
		done = status & 1;
	} while (done != 1);
}

int readHash(int offset) {
	return IORD_8DIRECT(Hash_Base, offset);
}

void Reset() {
	IOWR_8DIRECT(Hash_Control, 0, 1);
	//usleep(300000);
	IOWR_8DIRECT(Hash_Control, 0, 0);
}

int hashString(char *c) {
	int i;
	for (i = 0; i < strlen(c); i++) {
		hashNum(c[i]);
	}
	return readHash(0);
}
long long readWholeHash() {
	long long hash = 0;
	int i;
	int h;
	for (i = 0; i < 32; i++) {
		h = readHash(i * 2);
		hash += 256 * h;
	}
	return hash;
}

void WaitForReady() {
	int done, status;
	do {
		Reset();
		status = IORD_8DIRECT(Hash_Status, 0);
		done = status & 1;
	} while (done == 1);
}

int WaitForReadyNoBlock() {
	int done, status;
	Reset();
	status = IORD_8DIRECT(Hash_Status, 0);
	done = status & 1;
	if (done == 1)
		return 1;
	else
		return 0;

}

void WaitForDone() {
	int done, status;
	do {
		status = IORD_8DIRECT(Hash_Status, 0);
		done = status & 1;
	} while (done == 0);
}

int WaitForDoneNoBlock(void) {
	int done, status;
	status = IORD_8DIRECT(Hash_Status, 0);
	done = status & 1;
	if (done == 1)
		return 1;
	else
		return 0;
}
/*
 typedef struct {
 char* id;
 long long hash;
 char* phone;
 } customer;
 */

/*
 int main() {
 int i;
 customer group7[4];
 group7[0].id = "Matthew";
 group7[0].hash = 1054976;
 group7[0].phone = "(518) 366-7951";

 group7[1].id = "Sathya";
 group7[1].hash = 997888;
 group7[1].phone = "(518) 366-7951";

 group7[2].id = "Benjamin";
 group7[2].hash = 923904;
 group7[2].phone = "(518) 366-7951";

 group7[3].id = "Lam";
 group7[3].hash = 953088;
 group7[3].phone = "(518) 366-7951";

 printf("Hello from Nios II!\n");
 Reset();
 printf("Reset: %lli\n", readWholeHash());
 //WaitForDone();
 long long hashed = readWholeHash();
 //WaitForReady();
 while (1) {
 //int hash,i,j;
 //printf("Hash: %lli\n", readWholeHash());
 WaitForDone();
 hashed = readWholeHash();
 WaitForReady();
 for (i = 0; i < 4; i++) {
 if (hashed == group7[i].hash) {
 int j = 0;
 printf("Hi ");

 while(*group7[i].id != '\0') {
 printf("%c", *group7[i].id++);
 j++;
 }

 printf(", welcome.\n");
 group7[i].id -= j;
 break;
 }

 else if (i == 3)
 printf("%lli does not match.\n", hashed);
 }
 }
 return 0;
 }
 */
