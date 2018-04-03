package com.example.flightbooker.Map;

import android.content.Intent;
import android.graphics.drawable.BitmapDrawable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;

import com.google.zxing.integration.android.IntentIntegrator;

import com.example.flightbooker.DisplaySuccessActivity;
import com.example.flightbooker.R;

public class MapActivity extends AppCompatActivity {

    private ImageButton xButton,backButton, cameraButton;

    private TouchImageView img;
    private ScrollView detailView;
    private LinearLayout venueMenu;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_map);

        backButton = findViewById(R.id.map_back_button);
        xButton = findViewById(R.id.xbutton);
        detailView = findViewById(R.id.detailView);
        img = findViewById(R.id.img);
        venueMenu = findViewById(R.id.venueMenu);
        cameraButton = findViewById(R.id.camera_button);
        Button findTerminal = findViewById(R.id.findterminal);

        final String code = getIntent().getStringExtra("SCANNED_CODE");


        backButton.bringToFront();
        backButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                finish();
                startActivity(new Intent(MapActivity.this, DisplaySuccessActivity.class));
            }
        });
        img.setDetailView(detailView);
        img.setVenueMenu(venueMenu);
        detailView.setVisibility(View.INVISIBLE);
        xButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                detailView.setVisibility(View.INVISIBLE);
            }
        });

        findTerminal.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                img.setDestination("");
            }
        });

        cameraButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                finish();
                startActivity(new Intent(MapActivity.this, QRScanner.class));
            }
        });


        final int resourceHeight = 924;
        final int resourceWidth = 1064;

        ViewTreeObserver vto = img.getViewTreeObserver();
        vto.addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            public boolean onPreDraw() {
                if(firstPreDraw){
                    firstPreDraw = false;
                }
                else{
                    return true;
                }
                int realHeight, realWidth;
                //realHeight = img.getMeasuredHeight();
                //realWidth = img.getMeasuredWidth();

                realHeight = img.getDrawable().getBounds().height();
                realWidth = img.getDrawable().getBounds().width();
                System.out.println(realWidth + "," + realHeight);

                img.setScale((float)(realWidth)/(float)(resourceWidth),
                        (float)(realHeight)/(float)(resourceHeight));
                setupIcons();
                if(code != null){
                    img.setCurrentLocation(code);
                }
                return true;
            }
        });
    }
    private boolean firstPreDraw = true;

    private void drawLine(){
        int[] points = new int[]{0,100,300,200,500,300};
        img.drawLines(points);
    }


    private void setupIcons(){

        Icon[] icons = new Icon[6];
        BitmapDrawable bth = ((BitmapDrawable)getResources().getDrawable(R.drawable.bathroomicon));

        DisplayMetrics displayMetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        icons[0] = new Icon("bathroom0",bth,691,330,40);
        icons[1] = new Icon("bathroom1",bth, 605,600,40);
        BitmapDrawable food = ((BitmapDrawable)getResources().getDrawable(R.drawable.foodicon));
        icons[2] = new Icon("food1",food, 433,600,50);
        icons[3] = new Icon("food0",food, 871,490,50);

        BitmapDrawable lock = ((BitmapDrawable)getResources().getDrawable(R.drawable.lock));
        icons[4] = new Icon("securityoffice0",lock,
                895,224,45);
        icons[5] = new Icon("securityoffice1",lock,
                876,729,45);

        Venue[] venues1 = new Venue[2];
        venues1[0] = new Venue("Cinnabon","Bakery",R.drawable.cinnabon,8,21);
        venues1[1] = new Venue("White Spot","Restaurant",R.drawable.wine,10,23);
        icons[2].setVenues(venues1);

        Venue[] venues2 = new Venue[2];
        venues2[0] = new Venue("McDonald's", "Fast food",R.drawable.goldenarches,0,0);
        venues2[1] = new Venue("Caffe Artigiano","Cafe",R.drawable.coffee,6,22);
        icons[3].setVenues(venues2);

        Venue[] venues3 =  new Venue[1];
        venues3[0] = new Venue("Security Office - Entrance",null,R.drawable.lock,0,0);
        icons[4].setVenues(venues3);

        Venue[] venues4 =  new Venue[1];
        venues4[0] = new Venue("Security Office - Checkpoint",null,R.drawable.lock,0,0);
        icons[5].setVenues(venues4);

        img.setIcons(icons);
    }

    /*public void onClickBtn(View v)
    {
        button.setText("Text");
    }*/
}
