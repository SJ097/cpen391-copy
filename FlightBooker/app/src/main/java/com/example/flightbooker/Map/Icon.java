package com.example.flightbooker.Map;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;

/**
 * Created by Matt on 2018-03-16.
 */

public class Icon {
    private String name;
    private Bitmap bmp;
    private int x1,y1,x2,y2;
    private Venue[] venues;

    public Icon(String name, BitmapDrawable drawable, float x, float y, int size){
        this.name = name;
        this.bmp = drawable.getBitmap();
        this.x1 = (int)x;
        this.x2 = (int)(x+size);
        this.y1 = (int)y;
        this.y2 = (int)(y+size);
        this.venues = new Venue[0];
    }

    public String getName(){
        return name;
    }

    public void setVenues(Venue[] venues){
        this.venues = venues;
    }

    public void scale(float scaleX, float scaleY){
        x1 *= scaleX;
        y1 *= scaleY;
        x2 *= scaleX;
        y2 *= scaleY;
    }

    public boolean inRange(float x, float y){
        return x >= x1 && x <= x2 && y >= y1 && y <= y2;
    }
    public boolean inRange(int x, int y){
        return x >= x1 && x <= x2 && y >= y1 && y <= y2;
    }

    public Rect getRect(){
        Rect rect = new Rect(x1,y1,x2,y2);
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
