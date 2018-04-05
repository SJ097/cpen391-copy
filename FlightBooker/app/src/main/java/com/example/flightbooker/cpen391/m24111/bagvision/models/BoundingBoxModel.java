package com.example.flightbooker.cpen391.m24111.bagvision.models;

import android.graphics.RectF;

/**
 * Created by shado on 3/13/2018.
 * Singleton bounding box for single object detection
 * Used to communicate data between tensorflow model and view
 * Sticker is used to identify a sticker used for size measurements
 */

public class BoundingBoxModel {
    private RectF rect;
    private static BoundingBoxModel instance;   //Instance
    private static BoundingBoxModel sticker;    //Sticker for size

    protected BoundingBoxModel(){
        rect = new RectF(0,0,0,0);
    }

    public static BoundingBoxModel getInstance(){
        if (instance != null)
            return instance;
        else
            instance = new BoundingBoxModel();
        return instance;
    }

    public static BoundingBoxModel getSticker(){
        if (sticker != null)
            return sticker;
        else
            sticker = new BoundingBoxModel();
        return sticker;
    }

    public void setVal(RectF r){
        rect = new RectF(r);
    }

    public RectF getVal(){
        return rect;
    }

}
