#include <stdio.h>
#include <stdlib.h>

/**
 * Draw an element onto screen at specified position
 * The element will correspond to an interrupt ID
 * Param: file: bmp file name
 * X: starting X coordinates
 * Y: starting Y coordinates
 * scale: the picture scaling info
 * interrupt: 0 for clear (no interrupt), 1 - 255 for customizable interrupt ID
 */
void DrawScreen (char* data, int dimX, int dimY, int X, int Y, void (*fptr)()){
	int j, rgb, x2, y2;
	x2 = X + dimX - 1;
	y2 = Y + dimY - 1;

	//Drawing the screen
	for (j = dimY - 1; j >= 0; j--){
		DrawLineAcc(X, Y+j, dimX, data);
		data+=dimX;
	}

	//Add the button. We enforce this check every time we draw a anything
	if (fptr != NULL)
		addBtn(X,x2,Y,y2,fptr);



//
//	//Now we set the interrupt
//	DrawInterrupt (X, Y, dimX, dimY, interrupt);
}

/**
 * X: X coord of top left
 * Y: Y coord of top left
 * dimX: dimension X
 * dimY: dimension Y
 */
//void DrawInterrupt (int X, int Y, int dimX, int dimY, int interrupt){
//	//Set the unscaled value
//	int xStart, xEnd, yStart, yEnd;
//	int i,j;
//	xStart = X;
//	yStart = Y;
//	xEnd = X+dimX;
//	yEnd = Y+dimY;
//
//	xStart *= 0.08;
//	xEnd *= 0.08;
//	yStart *= 32.0/480.0;
//	yEnd *= 32.0/480.0;
//
//	//TODO: define the pio and start writing to it
//}

