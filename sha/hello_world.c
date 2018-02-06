
#include <stdio.h>
#include <io.h>

#define Hash_Control (volatile unsigned char *)(0x4000300)
#define Hash_Status (volatile unsigned char *)	(0x4000300)
#define Hash_Base (volatile unsigned char *)	(0x4000310)
void hashNum(int num){
	  IOWR_8DIRECT(Hash_Base,0,num);
	  IOWR_8DIRECT(Hash_Control,0,2);
	  int status, done;
	  do{
		  status = IORD_8DIRECT(Hash_Status,0);
		  done = status & 1;
	  }
	  while(done != 1);
}

int readHash(int offset){
	return IORD_8DIRECT(Hash_Base,offset);
}

void Reset(){
	IOWR_8DIRECT(Hash_Control,0,1);
	  IOWR_8DIRECT(Hash_Control,0,0);
}

int hashString(char *c){
	int i;
	for(i = 0; i < strlen(c); i++){
		hashNum(c[i]);
	}
	return readHash(0);
}

int main()
{
  int status = IORD_8DIRECT(Hash_Status,0);
  printf("Hello from Nios II!\n");
  printf("Initial hash: %d\n", IORD_8DIRECT(Hash_Base,0));
  Reset();
  printf("Reset: %d\n", IORD_8DIRECT(Hash_Base,0));
  char* c = "hello world";
  int hash,i,j;
  hashNum(1);
  for(i = 0; i < 32; i++){
	  printf("index %d: %d\n",i,readHash(2*i));
  }
  printf("Done\n");
  return 0;
}
