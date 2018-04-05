package com.example.flightbooker.cpen391.m24111.bagvision.activities;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.ImageFormat;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.media.Image;
import android.media.ImageReader;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.support.v4.app.ActivityCompat;
import android.util.Log;
import android.util.Size;
import android.view.Surface;
import android.view.TextureView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import com.example.flightbooker.R;
import com.example.flightbooker.cpen391.m24111.bagvision.models.ComputerVisionModel;
import com.example.flightbooker.cpen391.m24111.bagvision.views.CameraOverlayView;

/**
 * Created by shado on 3/11/2018.
 */

public class CameraActivity extends Activity{
    //The view
    private TextureView textureView;
    private CameraOverlayView cameraOverlayView;
    //Camera device
    private static final int REQUEST_CAMERA_PERMISSION = 100;
    private CameraDevice cameraDevice;
    private Size imageDimension;
    private CaptureRequest.Builder captureRequestBuilder;
    private CameraCaptureSession cameraCaptureSessions;
    //Image buffer
    private ImageReader iReader;

    //Background threads
    private HandlerThread mBackgroundThread;
    private Handler mBackgroundHandler;

    //Processing threads. These will periodically request a picture from camera to process
    private HandlerThread tensorThread;
    private Handler tensorHandler;
    private ComputerVisionModel tensorModel;
/*========================================= TEXTURE VIEW ==================================================*/

    TextureView.SurfaceTextureListener textureListener = new TextureView.SurfaceTextureListener() {
        @Override
        public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i1) {
            openCamera();
        }

        @Override
        public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i, int i1) {

        }

        @Override
        public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
            return false;
        }

        @Override
        public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {

        }
    };

    private void setTransformMatrix(){
        Matrix matrix = new Matrix();
        RectF textureRectF = new RectF(0,0,textureView.getWidth(),textureView.getHeight());
        RectF previewRectF = new RectF(0,0,imageDimension.getHeight(), imageDimension.getWidth());
        float centerX = textureRectF.centerX();
        float centery = textureRectF.centerY();

        previewRectF.offset(centerX - previewRectF.centerX(),centery-previewRectF.centerY());
        matrix.setRectToRect(textureRectF,previewRectF,Matrix.ScaleToFit.FILL);
        float scale = Math.max((float)textureView.getWidth() / imageDimension.getWidth(),(float)textureView.getHeight()/ imageDimension.getHeight());
        matrix.postScale(scale,scale,centerX,centery);
        matrix.postRotate(-90,centerX,centery);
        textureView.setTransform(matrix);
    }

/*======================================= READING AND PROCESSING CAMERA FEED =================================*/
    CameraDevice.StateCallback stateCallback = new CameraDevice.StateCallback() {
        @Override
        public void onOpened(CameraDevice camera) {
            cameraDevice = camera;
            createCameraPreview();
        }

        @Override
        public void onDisconnected(CameraDevice cameraDevice) {
            cameraDevice.close();
        }

        @Override
        public void onError(CameraDevice cameraDevice, int i) {
            cameraDevice.close();
            cameraDevice = null;
        }
    };

    /**
     * Launch camera, requesting permission, then open the camera
     */
    private void openCamera() {
        CameraManager manager = (CameraManager)getSystemService(Context.CAMERA_SERVICE);
        try{
            String cameraId = manager.getCameraIdList()[0];
            CameraCharacteristics characteristics = manager.getCameraCharacteristics(cameraId);
            StreamConfigurationMap map = characteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
            imageDimension = map.getOutputSizes(SurfaceTexture.class)[0];
            iReader = ImageReader.newInstance(ComputerVisionModel.PREVIEW_WIDTH, ComputerVisionModel.PREVIEW_HEIGHT, ImageFormat.YUV_420_888, 1);
            setTransformMatrix();
            if(ActivityCompat.checkSelfPermission(this, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED)
            {
                ActivityCompat.requestPermissions(this,new String[]{
                        Manifest.permission.CAMERA
                },REQUEST_CAMERA_PERMISSION);
                return;
            }
            //Lazy code
            if(ActivityCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED)
            {
                ActivityCompat.requestPermissions(this,new String[]{
                        Manifest.permission.WRITE_EXTERNAL_STORAGE
                },REQUEST_CAMERA_PERMISSION);
                return;
            }
            manager.openCamera(cameraId,stateCallback,null);

        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
    }

    /*=============================================== Capture and process pictures ====================================*/
    private void createCameraPreview() {
        try{
            SurfaceTexture texture = textureView.getSurfaceTexture();
            texture.setDefaultBufferSize(imageDimension.getWidth(),imageDimension.getHeight());
            Surface surface = new Surface(texture);
            captureRequestBuilder = cameraDevice.createCaptureRequest(CameraDevice.TEMPLATE_PREVIEW);
            captureRequestBuilder.addTarget(surface);

            List<Surface> list = new ArrayList<>();
            //While we're initializing the preview only, we need to add ALL surfaces. Ideally I'd move this to its own method
            list.add(surface);
            list.add(iReader.getSurface());
            cameraDevice.createCaptureSession(list, new CameraCaptureSession.StateCallback() {
                @Override
                public void onConfigured(CameraCaptureSession cameraCaptureSession) {
                    if(cameraDevice == null)
                        return;
                    cameraCaptureSessions = cameraCaptureSession;
                    startTensor();
                    updatePreview();
                }

                @Override
                public void onConfigureFailed(CameraCaptureSession cameraCaptureSession) {
                    Toast.makeText(CameraActivity.this, "Changed", Toast.LENGTH_SHORT).show();
                }
            },null);
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
    }

    private void updatePreview() {
        if(cameraDevice == null){
            Toast.makeText(this, "Error", Toast.LENGTH_SHORT).show();
            return;
        }
        captureRequestBuilder.set(CaptureRequest.CONTROL_MODE,CaptureRequest.CONTROL_MODE_AUTO);
        try{
            cameraCaptureSessions.setRepeatingRequest(captureRequestBuilder.build(),null,mBackgroundHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
    }
/*============================================ Tensor thread ===============================================*/
    //ImageReader stuff
    //We set the image listener to be the actual tensor thread
    //This separates the processing and capture process. We do a callback (tensorCapture) after processing
    //Which will, again, trigger the listener event
    ImageReader.OnImageAvailableListener imageListener = new ImageReader.OnImageAvailableListener() {
        @Override
        public void onImageAvailable(ImageReader imageReader) {
            Log.d("Event","Capture");
            Image img = imageReader.acquireLatestImage();

            //Call the tensor model to do this for us
            tensorModel.processImage(img);
            cameraOverlayView.postInvalidate();
            //tensorCapture will start another capture after process finish
            img.close();
            tensorCapture();
        }
    };

    /*
     * Initiate tensor thread
     */
    private void startTensor() {
        //First, we create a tensor processing object
        tensorModel = new ComputerVisionModel(getAssets(), cameraOverlayView.getWidth(), cameraOverlayView.getHeight());

        tensorThread = new HandlerThread("Tensor thread");
        tensorThread.start();
        tensorHandler = new Handler(tensorThread.getLooper());
        //Bind the tensor thread to imageListener
        iReader.setOnImageAvailableListener(imageListener, tensorHandler);
        //Now start image capture on main UI thread
        tensorCapture();
    }

    //This function triggers image capture
    public void tensorCapture(){
        try {
            CaptureRequest.Builder requestBuilder = cameraDevice.createCaptureRequest(CameraDevice.TEMPLATE_VIDEO_SNAPSHOT);
            requestBuilder.addTarget(iReader.getSurface());

            //We have the tensor and background handler thread signaling eachother
            //Once the tensor finish, it fires a request for background thread
            //Which will send a capture request thus triggering the tensor thread
            cameraCaptureSessions.capture(requestBuilder.build(), null, mBackgroundHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
    }

/*============================================ GENERAL CODES ===============================================*/
    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_camera);
        textureView = (TextureView)findViewById(R.id.textureView);
        textureView.setSurfaceTextureListener(textureListener);
        cameraOverlayView = (CameraOverlayView)findViewById(R.id.cameraOverlayView);
    }


    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        if(requestCode == REQUEST_CAMERA_PERMISSION)
        {
            if(grantResults[0] != PackageManager.PERMISSION_GRANTED)
            {
                Toast.makeText(this, "You can't use camera without permission", Toast.LENGTH_SHORT).show();
                finish();
            }
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        startBackgroundThread();
        if(textureView.isAvailable())
            openCamera();
        else
            textureView.setSurfaceTextureListener(textureListener);
    }

    @Override
    protected void onPause() {
        stopBackgroundThread();
        super.onPause();
    }

    private void stopBackgroundThread() {
        mBackgroundThread.quitSafely();
        try{
            mBackgroundThread.join();
            mBackgroundThread= null;
            mBackgroundHandler = null;
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void startBackgroundThread() {
        mBackgroundThread = new HandlerThread("Camera Background");
        mBackgroundThread.start();
        mBackgroundHandler = new Handler(mBackgroundThread.getLooper());
    }
}
