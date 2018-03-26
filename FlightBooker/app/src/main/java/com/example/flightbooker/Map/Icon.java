package com.example.flightbooker.Map;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;

/**
 * Created by Matt on 2018-03-16.
 */

public class Icon {
    private Bitmap bmp;
    private int x1,y1,x2,y2;
    private Rect rect;
    private Venue[] venues;

    public Icon(BitmapDrawable drawable, float x, float y, int size,float scaleX, float scaleY){
        x *= scaleX;
        y *= scaleY;
        this.bmp = drawable.getBitmap();
        this.x1 = (int)x;
        this.x2 = (int)(x+size/scaleX);
        this.y1 = (int)y;
        this.y2 = (int)(y+size/scaleY);
        rect = new Rect(x1,y1,x2,y2);
        this.venues = new Venue[0];
    }

    public void setVenues(Venue[] venues){
        this.venues = venues;
    }

    public boolean inRange(float x, float y){
        return x >= x1 && x <= x2 && y >= y1 && y <= y2;
    }
    public boolean inRange(int x, int y){
        return x >= x1 && x <= x2 && y >= y1 && y <= y2;
    }

    public Rect getRect(){
        return rect;
    }

    public Venue[] getVenues(){
        return venues;
    }

    public boolean hasVenues(){
        return this.venues.length > 0;
    }

    public Bitmap getBitmap(){
        return bmp;
    }
}
