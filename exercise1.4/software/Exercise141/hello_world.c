
typedef struct { int x, y; } Point;

Point GetPress(void);
Point GetRelease(void);
int main()
{
  printf("Hello from Nios II!\n");
  Init_Touchscreen();
  Point p1, p2;
  while(1){
	  p1 = GetPress();
	  printf("Press x: %d y: %d\n", p1.x, p1.y);

	  p2 = GetRelease();
	  printf("Release x: %d y: %d\n\n", p2.x, p2.y);
  }
  return 0;
}
