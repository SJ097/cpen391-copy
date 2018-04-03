package com.example.flightbooker.Map;

import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;

import com.example.flightbooker.DisplaySuccessActivity;
import com.example.flightbooker.R;
import com.google.zxing.BarcodeFormat;

import java.util.List;

import me.dm7.barcodescanner.zxing.ZXingScannerView;

/**
 * Created by Matt on 2018-03-31.
 */

public class QRScanner extends AppCompatActivity implements ZXingScannerView.ResultHandler {

    private ZXingScannerView mScannerView;
    private TouchImageView img;

    @Override
    public void onCreate(Bundle state) {
        super.onCreate(state);
        setContentView(R.layout.activity_qr_scan);
        mScannerView = findViewById(R.id.qrscan);
        ImageButton backButton = findViewById(R.id.qr_back);

        backButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                finish();
                startActivity(new Intent(QRScanner.this, MapActivity.class));
            }
        });
        backButton.bringToFront();
    }

    public void setImageView(TouchImageView view){
        img = view;
    }

    @Override
    public void onResume() {
        super.onResume();
        mScannerView.setResultHandler(this); // Register ourselves as a handler for scan results.

        mScannerView.startCamera();          // Start camera on resume
    }

    @Override
    public void onPause() {
        super.onPause();
        mScannerView.stopCamera();           // Stop camera on pause
    }

    @Override
    public void handleResult(com.google.zxing.Result rawResult) {
        String scannedCode = rawResult.getText();
        Intent intent = new Intent(QRScanner.this, MapActivity.class);
        intent.putExtra("SCANNED_CODE", scannedCode);
        startActivity(intent);
    }
}
