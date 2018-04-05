package com.example.flightbooker.cpen391.m24111.bagvision.views;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;

import java.text.Format;

import com.example.flightbooker.cpen391.m24111.bagvision.models.BoundingBoxModel;

/**
 * Created by shado on 3/13/2018.
 * Overlay image element
 */

public class CameraOverlayView extends View {
    private static final double STICKER_WIDTH = 0.18;
    private static final double STICKER_HEIGHT = 0.18;

    public CameraOverlayView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        //Clear the canvas
        canvas.drawColor(Color.TRANSPARENT);

        //TODO: draw distance based on sticker and instance ratio

        //Draw a rectangle
        RectF object = BoundingBoxModel.getInstance().getVal();
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setColor(Color.RED);
        paint.setStrokeWidth(5);
        paint.setStyle(Paint.Style.STROKE);
        canvas.drawRect(object, paint);

        //Draw sticker
        RectF sticker = BoundingBoxModel.getSticker().getVal();
        Paint paintSticker = new Paint(Paint.ANTI_ALIAS_FLAG);
        paintSticker.setColor(Color.GREEN);
        paintSticker.setStrokeWidth(5);
        paintSticker.setStyle(Paint.Style.STROKE);
        canvas.drawRect(sticker, paintSticker);

        double width = (object.width()*STICKER_WIDTH)/sticker.width();
        double height = (object.height()*STICKER_HEIGHT)/sticker.height();


        Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        textPaint.setColor(Color.RED);
        textPaint.setTextSize(50);

        String dimension = String.format("Size = %.2f m x %.2f m", width, height);

        canvas.drawText(dimension, 20, 50, textPaint);
    }
}
