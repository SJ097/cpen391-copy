/*
 * TouchscreenKeypress.c
 *
 *  Created on: Feb 14, 2018
 *      Author: shado
 */
#include <stdlib.h>
typedef struct {
	int x1,x2,y1,y2;
	void (*fptr)();
}TouchButton;

TouchButton * Btn[64];
int size = 0;

static int isABtn(int x, int y, TouchButton * btn){
	if (x >= btn->x1 &&
		x <= btn->x2 &&
		y >= btn->y1 &&
		y <= btn->y2)
		return 1;
	return 0;
}

void addBtn(int x1, int x2, int y1, int y2, void (*fptr)()){
	//64 is a lot of buttons
	TouchButton * btn = malloc(sizeof(TouchButton));
	if (btn == NULL)
		return;

	btn->x1 = x1;
	btn->x2 = x2;
	btn->y1 = y1;
	btn->y2 = y2;
	btn->fptr = fptr;
	Btn[size++] = btn;
}

void runBtn(int x, int y){
	int i;
	for (i = 0; i < size; i++){
		if (isABtn(x,y,Btn[i])){
			(*(Btn[i]->fptr))();
			return;
		}
	}
}

void clearBtns(){
	int i;
	for (i = 0; i < size; i++){
		free(Btn[i]);
		Btn[i] = NULL;
	}
	size = 0;
}


