package com.example.flightbooker.Map;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.preference.PreferenceManager;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.DisplayMetrics;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.example.flightbooker.LoginActivity;
import com.example.flightbooker.PasswordActivity;
import com.example.flightbooker.UserInfoActivity;
import com.google.zxing.integration.android.IntentIntegrator;

import com.example.flightbooker.DisplaySuccessActivity;
import com.example.flightbooker.R;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.Dictionary;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.example.flightbooker.R;

/**
 * Created by Matt on 2018-04-05.
 */

public class AirportListActivity extends AppCompatActivity{

    LinearLayout airportList;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_airportlist);
        Context context = getApplicationContext();
        airportList = findViewById(R.id.airport_list);
        ImageButton backButton = findViewById(R.id.airport_list_back);
        backButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                Intent intent = new Intent(AirportListActivity.this, MapActivity.class);
                startActivity(intent);
            }
        });

        final Map<String, String> airports = new HashMap();
        airports.put("macleod", "Macleod Airport (MCD)");
        airports.put("yvr", "Vancouver International Airport (YVR)");

        for (Map.Entry<String, String> entry : airports.entrySet()){
            final String thisAirport = entry.getKey();
            TextView view = new TextView(context);
            view.setText(entry.getValue());
            view.setTextSize(40);
            view.setTextColor(Color.BLACK);

            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT
            );
            params.setMargins(10,10,0,0);
            view.setLayoutParams(params);

            view.setOnClickListener(new View.OnClickListener(){
                @Override
                public void onClick(View v){
                    Intent intent = new Intent(AirportListActivity.this, MapActivity.class);
                    intent.putExtra("MAP_CHOICE", thisAirport);
                    startActivity(intent);
                }
            });
            airportList.addView(view);
        }

    }
}
