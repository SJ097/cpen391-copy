package com.example.flightbooker.cpen391.m24111.bagvision.models;

import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.media.Image;
import android.os.SystemClock;
import android.util.Size;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import com.example.flightbooker.cpen391.m24111.bagvision.Classifier;
import com.example.flightbooker.cpen391.m24111.bagvision.ImageUtils;
import com.example.flightbooker.cpen391.m24111.bagvision.TensorFlowObjectDetectionAPIModel;

/**
 * Created by shado on 3/14/2018.
 * Class that contains tensorflow data processings
 */

public class ComputerVisionModel {
    //T
    private static final int TF_OD_API_INPUT_SIZE = 300;
    private static final String TF_OD_API_MODEL_FILE =
            "file:///android_asset/ssd_mobilenet_v1_android_export.pb";
    private static final String TF_OD_API_LABELS_FILE = "file:///android_asset/coco_labels_list.txt";
    private static final float MINIMUM_CONFIDENCE_TF_OD_API = 0.6f;
    public static final int PREVIEW_WIDTH = 1920;
    public static final int PREVIEW_HEIGHT = 1080;
    private static final String[] STICKERS = {"horse", "cow"};
    private static final String[] OBJECTS = {"backpack", "handbag", "suitcase"};


    private Classifier detector;

    private Bitmap rgbFrameBitmap = null;
    private Bitmap croppedBitmap = null;

    private Matrix frameToCropTransform;
    private Matrix cropToFrameTransform;
    //Construct a computer vision model wrapper for tensorflow codes
    public ComputerVisionModel(AssetManager assets, int width, int height) {
        try {
            detector = TensorFlowObjectDetectionAPIModel.create(
                    assets, TF_OD_API_MODEL_FILE, TF_OD_API_LABELS_FILE, TF_OD_API_INPUT_SIZE);
        } catch (IOException e) {
            e.printStackTrace();
        }

        rgbFrameBitmap = Bitmap.createBitmap(PREVIEW_WIDTH, PREVIEW_HEIGHT, Bitmap.Config.ARGB_8888);
        croppedBitmap = Bitmap.createBitmap(TF_OD_API_INPUT_SIZE, TF_OD_API_INPUT_SIZE, Bitmap.Config.ARGB_8888);

        frameToCropTransform =
                ImageUtils.getTransformationMatrix(
                        PREVIEW_WIDTH, PREVIEW_HEIGHT,
                        TF_OD_API_INPUT_SIZE, TF_OD_API_INPUT_SIZE,
                        0, false);
        cropToFrameTransform =
                ImageUtils.getTransformationMatrix(
                        TF_OD_API_INPUT_SIZE, TF_OD_API_INPUT_SIZE,
                        width, height,
                        0, false);
    }

    //This method process the image, and proceed to do a callback upon completion
    public void processImage(Image image) {
        rgbFrameBitmap.setPixels(getRgbBytes(image), 0, PREVIEW_WIDTH, 0, 0, PREVIEW_WIDTH, PREVIEW_HEIGHT);

         final Canvas canvas = new Canvas(croppedBitmap);
        canvas.drawBitmap(rgbFrameBitmap, frameToCropTransform, null);

        ImageUtils.saveBitmap(rgbFrameBitmap);

        // For examining the actual TF input.
        final List<Classifier.Recognition> results = detector.recognizeImage(croppedBitmap);



        for (final Classifier.Recognition result : results) {
            final RectF location = result.getLocation();
            if (location != null && result.getConfidence() >= MINIMUM_CONFIDENCE_TF_OD_API) {
                cropToFrameTransform.mapRect(location);
                for (String s : STICKERS){
                    if (s.equals(result.getTitle()))
                        BoundingBoxModel.getSticker().setVal(location);
                }
                for (String s : OBJECTS){
                    if (s.equals(result.getTitle()))
                        BoundingBoxModel.getInstance().setVal(location);
                }
            }
        }
    }

    private int[] getRgbBytes(Image image) {
        byte[][] yuvBytes = new byte[3][];
        final Image.Plane[] planes = image.getPlanes();
        fillBytes(planes, yuvBytes);
        int[] rgbBytes = new int[PREVIEW_WIDTH * PREVIEW_HEIGHT];
        if(image.getWidth() == PREVIEW_WIDTH && image.getHeight() == PREVIEW_HEIGHT){

        }
        else{
            System.out.println(image.getWidth());
            System.out.println(image.getHeight());
            yuvBytes[10] = yuvBytes[9];
        }
        ImageUtils.convertYUV420ToARGB8888(
                yuvBytes[0],
                yuvBytes[1],
                yuvBytes[2],
                image.getWidth(),
                image.getHeight(),
                planes[0].getRowStride(),
                planes[1].getRowStride(),
                planes[1].getPixelStride(),
                rgbBytes);
        return  rgbBytes;
    }

    protected void fillBytes(final Image.Plane[] planes, final byte[][] yuvBytes) {
        // Because of the variable row stride it's not possible to know in
        // advance the actual necessary dimensions of the yuv planes.
        for (int i = 0; i < planes.length; ++i) {
            final ByteBuffer buffer = planes[i].getBuffer();
            if (yuvBytes[i] == null) {
                yuvBytes[i] = new byte[buffer.capacity()];
            }
            buffer.get(yuvBytes[i]);
        }
    }
}
