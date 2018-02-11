#define GraphicsCommandReg     (*(volatile unsigned short int *)(0x84000000))
#define GraphicsStatusReg     (*(volatile unsigned short int *)(0x84000000))
#define GraphicsX1Reg      (*(volatile unsigned short int *)(0x84000002))
#define GraphicsY1Reg      (*(volatile unsigned short int *)(0x84000004))
#define GraphicsX2Reg      (*(volatile unsigned short int *)(0x84000006))
#define GraphicsY2Reg      (*(volatile unsigned short int *)(0x84000008))
#define GraphicsColourReg     (*(volatile unsigned short int *)(0x8400000E))
#define GraphicsBackGroundColourReg    (*(volatile unsigned short int *)(0x84000010))

/************************************************************************************************ **
 * This macro pauses until the graphics chip status register indicates that it is idle
 *  ***********************************************************************************************/
 #define WAIT_FOR_GRAPHICS  while((GraphicsStatusReg & 0x0001) != 0x0001);
// #defined constants representing values we write to the graphics 'command' register to get
// it to draw something. You will add more values as you add hardware to the graphics chip
// Note DrawHLine, DrawVLine and DrawLine at the moment do nothing - you will modify these

#define DrawHLine  1
#define DrawVLine  2
#define DrawLine   3
#define PutAPixel  0xA
#define GetAPixel  0xB
#define ProgramPaletteColour    0x10

#define Max_X 799
#define Max_Y 479

// defined constants representing colours pre-programmed into colour palette
// there are 256 colours but only 8 are shown below, we write these to the colour registers
//
// the header files "Colours.h" contains constants for all 256 colours
// while the course file “ColourPaletteData.c” contains the 24 bit RGB data
// that is pre-programmed into the palette

#define BLACK   0
#define WHITE   1
#define RED   2
#define LIME   3
#define BLUE   4
#define YELLOW   5
#define CYAN   6
#define MAGENTA   7

#include <math.h>
/******************************************************************************************* *
 * This function writes a single pixel to the x,y coords specified using the specified colour
 * Note colour is a byte and represents a palette number (0-255) not a 24 bit RGB value
 * ********************************************************************************************/
void WriteAPixel(int x, int y, int Colour) {
	WAIT_FOR_GRAPHICS;    // is graphics ready for new command

	 GraphicsX1Reg = x;    // write coords to x1, y1
	 GraphicsY1Reg = y;
	 GraphicsColourReg = Colour;   // set pixel colour
	 GraphicsCommandReg = PutAPixel;   // give graphics "write pixel" command
 }

void ClearScreen(int colour){
	int i;
	for(i = 0; i <= Max_Y; i++){
		HLineAcc(0,i,Max_X,colour);
	}
}


/*********************************************************************************************
 *This function read a single pixel from the x,y coords specified and returns its colour
 *Note returned colour is a byte and represents a palette number (0-255) not a 24 bit RGB value
 **********************************************************************************************/

int ReadAPixel(int x, int y) {
	WAIT_FOR_GRAPHICS;   // is graphics ready for new command

	 GraphicsX1Reg = x;   // write coords to x1, y1
	 GraphicsY1Reg = y;
	 GraphicsCommandReg = GetAPixel;  // give graphics a "get pixel" command

	 WAIT_FOR_GRAPHICS;   // is graphics done reading pixel
	 return (int)(GraphicsColourReg) ; // return the palette number (colour)
 }


/********************************************************************************** **
 * subroutine to program a hardware (graphics chip) palette number with an RGB value **
 * e.g. ProgramPalette(RED, 0x00FF0000) ; **
 * ************************************************************************************/
 void ProgramPalette(int PaletteNumber, int RGB) {
	 WAIT_FOR_GRAPHICS;
	 GraphicsColourReg = PaletteNumber;
     GraphicsX1Reg = RGB >> 16   ;        // program red value in ls.8 bit of X1 reg
     GraphicsY1Reg = RGB ;                // program green and blue into ls 16 bit of Y1 reg
     GraphicsCommandReg = ProgramPaletteColour; // issue command
     }
 /*********************************************************************************************
  * This function draw a horizontal line, 1 pixel at a time starting at the x,y coords specified
  * *********************************************************************************************/

void HLine(int x1, int y1, int length, int Colour) {
	int i;

 for(i = x1; i < x1+length; i++ )
	 WriteAPixel(i, y1, Colour);
}

void HLineAcc(int x1, int y1, int length, int color){
	WAIT_FOR_GRAPHICS;
		GraphicsX1Reg = x1;    // write coords to x1, y1
		 GraphicsY1Reg = y1;
		 GraphicsX2Reg = x1 + length;
		 GraphicsColourReg = color;
		 GraphicsCommandReg = DrawHLine;
}

/*********************************************************************************************
 * This function draw a vertical line, 1 pixel at a time starting at the x,y coords specified
 * *********************************************************************************************/

void VLine(int x1, int y1, int length, int Colour) {
	int i;

	for(i = y1; i < y1+length; i++ )
		WriteAPixel(x1, i, Colour);
}

void VLineAcc(int x1, int y1, int length, int color){
		WAIT_FOR_GRAPHICS;
		GraphicsX1Reg = x1;    // write coords to x1, y1
		GraphicsY1Reg = y1;
		GraphicsY2Reg = y1 + length;
		GraphicsColourReg = color;
		GraphicsCommandReg = DrawVLine;
}

int sign(int x){
	if(x > 0) return 1;
	if(x < 0) return -1;
	return 0;
}
void Rectangle(int x1, int y1, int x2, int y2, int color){
	int biggerx = x1 > x2 ? x1 : x2;
	int smallerx = x2 < x1 ? x2 : x1;
	int smallery = y1 < y2 ? y1 : y2;
	int biggery = y1 > y2 ? y1 : y2;
	int dx = abs(x2 - x1);
	int dy = abs(y2 - y1);
	HLineAcc(smallerx,smallery,dx,color);
	HLineAcc(smallerx,biggery,dx,color);
	VLineAcc(smallerx,smallery,dy,color);
	VLineAcc(biggerx,smallery,dy,color);
}
void FilledRectangle(int x1, int y1, int x2, int y2, int color){
	if(x1 == x2 || y1 == y2){
		return;
	}
	int dy = abs(y2-y1);
	int dx = abs(x2-x1);

	int biggerx = x1 > x2 ? x1 : x2;
	int smallerx = x2 < x1 ? x2 : x1;
	int smallery = y1 < y2 ? y1 : y2;
	int biggery = y1 > y2 ? y1 : y2;

	while(smallery < biggery){
		HLineAcc(smallerx, smallery, dx, color);
		smallery++;
	}
}
void FilledRectangleBorder(int x1, int y1, int x2, int y2, int fillcolor, int bordercolor){
	if(x1 == x2 || y1 == y2){
		return;
	}
	Rectangle(x1, y1, x2, y2, bordercolor);
	int biggerx = x1 > x2 ? x1 : x2;
	int smallerx = x2 < x1 ? x2 : x1;
	int smallery = y1 < y2 ? y1 : y2;
	int biggery = y1 > y2 ? y1 : y2;
	biggerx-=2;
	smallery++;
	while(smallerx < biggerx){
		smallerx++;
		VLineAcc(smallerx, smallery, biggery-smallery, fillcolor);
	}
}
void Triangle(int x1, int y1, int x2, int y2, int x3, int y3, int color){
	LineAcc(x1, y1, x2, y2, color);
	LineAcc(x1, y1, x3, y3, color);
	LineAcc(x2, y2, x3, y3, color);
}
void Arc(int x1, int y1, int radius, int color){
	int x = radius-1;
    int y = 0;
    int dx = 1;
    int dy = 1;
    int err = dx - (radius << 1);
    while (x >= y){
    	WriteAPixel(x1 + x, y1 + y,color);
    	/*WriteAPixel(x1 + y, y1 + x,color);
    	WriteAPixel(x1 - y, y1 + x,color);
    	WriteAPixel(x1 - x, y1 + y,color);
    	WriteAPixel(x1 - x, y1 - y,color);
    	WriteAPixel(x1 - y, y1 - x,color);
    	WriteAPixel(x1 + y, y1 - x,color);
    	WriteAPixel(x1 + x, y1 - y,color);*/
	    if (err <= 0){
            y++;
            err += dy;
            dy += 2;
        }
        else{
            x--;
            dx += 2;
            err += dx - (radius << 1);
        }
    }
}
void Circle(int x1, int y1, int radius, int color){
	int x = radius-1;
    int y = 0;
    int dx = 1;
    int dy = 1;
    int err = dx - (radius << 1);
    while (x >= y){
    	WriteAPixel(x1 + x, y1 + y,color);
    	WriteAPixel(x1 + y, y1 + x,color);
    	WriteAPixel(x1 - y, y1 + x,color);
    	WriteAPixel(x1 - x, y1 + y,color);
    	WriteAPixel(x1 - x, y1 - y,color);
    	WriteAPixel(x1 - y, y1 - x,color);
    	WriteAPixel(x1 + y, y1 - x,color);
    	WriteAPixel(x1 + x, y1 - y,color);
	    if (err <= 0){
            y++;
            err += dy;
            dy += 2;
        }
        else{
            x--;
            dx += 2;
            err += dx - (radius << 1);
        }
    }
}
void RandomLine(){
	int x1 = rand() % Max_X;
	int y1 = rand() % Max_Y;
	int x2 = rand() % Max_X;
	int y2 = rand() % Max_Y;
	int color = rand() % 7 + 1;
	LineAcc(x1,y1,x2,y2,color);
}

/******************************************************************************* **
 *  Implementation of Bresenhams line drawing algorithm
 *  *******************************************************************************/
void LineAcc(int x1, int y1, int x2, int y2, int color){

	WAIT_FOR_GRAPHICS;
	 GraphicsX1Reg = x1;
	 GraphicsY1Reg = y1;
	 GraphicsX2Reg = x2;
	 GraphicsY2Reg = y2;
	 GraphicsColourReg = color;
	 GraphicsCommandReg = DrawLine;

}
void Line(int x1, int y1, int x2, int y2, int Colour) {
	int x = x1;
	int y = y1;
	int dx = abs(x2 - x1);
	int dy = abs(y2 - y1);

    int s1 = sign(x2 - x1);
    int s2 = sign(y2 - y1);
    int i, temp, interchange = 0, error ;

// if x1=x2 and y1=y2 then it is a line of zero length so we are done

    if(dx == 0 && dy == 0)
    	return ;

 // must be a complex line so use Bresenhams algorithm
    else    {

// swap delta x and delta y depending upon slop of line

        if(dy > dx) {
        	temp = dx ;
        	dx = dy ;
        	dy = temp ;
        	interchange = 1 ;
        }

// initialise the error term to compensate for non-zero intercept

        error = (dy << 1) - dx ;    // error = (2 * dy) - dx

// main loop
        for(i = 1; i <= dx; i++)    {
        	WriteAPixel(x, y, Colour);

            if(error >= 0)   {
            	if(interchange == 1)
            		x += s1 ;
            	else
            		y += s2 ;

                error -= (dx << 1) ;    // error = error – (dx * 2)
            }

            if(interchange == 1)
            	y += s2 ;
            else
            	x += s1 ;

            error += (dy << 1) ;    // error = error + (dy * 2)

        }
    }
}

//HIGH LEVEL FUNCTIONS
void InitializeStartScreen_state0(void)
{
	ClearScreen(WHITE);

	//sample code
	  /*
	  Triangle(0,250,400,300,300,300,3);
	  Rectangle(50,50,150,100,2);
	  FilledRectangleBorder(100,120,200,200,3,2);
	  FilledRectangle(400,100,450,150,3);
	  Circle(600,300,40,2);
	  Arc(400,300,40,3);
	  */


	  //status or progression bar
	  FilledRectangle(200,0,600,50,CYAN);

	  //top text
	  OutGraphicsStringFont2(325,15,BLACK,CYAN,"Group 7 Inc",1);

	  //middle line
	  LineAcc(400, 50, 400, 480, BLACK);

	  //Left side text
	  OutGraphicsStringFont2(150,150,BLACK,WHITE,"Welcome",1);
	  OutGraphicsStringFont2(150,200,BLACK,WHITE,"to",1);
	  OutGraphicsStringFont2(150,250,BLACK,WHITE,"YVR Airport",1);

	  //Right hand side

	  //Button to move on
	  FilledRectangle(450,330,750,430,BLUE);

	  //Button text
	  OutGraphicsStringFont2(550,375,BLACK,BLUE,"Start",1);

	  //Left instructions
	  OutGraphicsStringFont2(500,150,BLACK,WHITE,"Self",1);
	  OutGraphicsStringFont2(500,200,BLACK,WHITE,"Terminal Security",1);
	  OutGraphicsStringFont2(500,250,BLACK,WHITE,"Check Point Machine",1);
}

void InitializeStartScreen_state1()
{
	ClearScreen(WHITE);

	//status or progression bar
	FilledRectangle(200,0,300,50,RED);
	FilledRectangle(300,0,600,50,CYAN);

	//progression step
	OutGraphicsStringFont2(250,20,BLACK,RED,"1",1);

	//Instructions text
	OutGraphicsStringFont2(100,100,BLACK,WHITE,"Please scan your passport",1);

	OutGraphicsStringFont2(100,200,BLACK,WHITE,"passport id:",1);

	OutGraphicsStringFont2(100,250,BLACK,WHITE,"encrypted id:",1);

	//Button to move on
	FilledRectangle(0,380,300,480,BLUE);

	//Back Button text
	OutGraphicsStringFont2(130,420,BLACK,BLUE,"Back",1);
}
