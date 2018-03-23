package com.example.flightbooker;

import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class CancelActivity extends AppCompatActivity {

    private String flight;
    private final Lock lock = new ReentrantLock();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cancel);

        Toolbar toolbar = (Toolbar) findViewById(R.id.my_toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setTitle("Cancel Flight");

        Intent intent = getIntent();
        flight = intent.getStringExtra(FlightHistoryActivity.CANCEL_FLIGHT);

        TextView flightInfo = findViewById(R.id.flight_info);
        flightInfo.setText(flight);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        // POST on database

        Button yes = (Button) findViewById(R.id.yes_cancel);
        Button no = (Button) findViewById(R.id.no_cancel);

        yes.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String flightNo = flight.substring(flight.indexOf(":") + 1);
                flightNo = flightNo.substring(0, flightNo.indexOf("\n"));

                //System.out.println(flightNo);

                Map<String, String> params = new HashMap<>();
                params.put("reservation_id", flightNo);

                String loginURL = "http://34.218.93.237/cancel_booking.php";
                final TextView mTextView = (TextView) findViewById(R.id.text);

                CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, loginURL, params,
                        new Response.Listener<JSONObject>() {
                            @Override
                            public void onResponse(JSONObject response) {

                                try {
                                    // if log in is failed, toast the reason why
                                    int success = Integer.parseInt(response.getString("success"));

                                    if(success == 0) {
                                        String reason = response.getString("fail_reason");
                                        Toast.makeText(getApplicationContext(), reason, Toast.LENGTH_SHORT).show();
                                        startActivity(new Intent(CancelActivity.this, FlightHistoryActivity.class));
                                    }

                                    //if log in successful
                                    else {
                                        Toast.makeText(getApplicationContext(), "Flight cancelled!", Toast.LENGTH_SHORT).show();
                                        startActivity(new Intent (CancelActivity.this, DisplaySuccessActivity.class));
                                    }

                                } catch (JSONException e) {
                                    //problem with receiving JSONObject
                                    //OR
                                    //problem with extracting info from JSONObject
                                    Toast.makeText(getApplicationContext(), "JSON Exception in flight history activity!", Toast.LENGTH_SHORT).show();
                                    e.printStackTrace();
                                    startActivity(new Intent(CancelActivity.this, FlightHistoryActivity.class));
                                }
                            }
                        },
                        new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {

                                if (error == null || error.networkResponse == null) {
                                    return;
                                }

                                String body;
                                //get response body and parse with appropriate encoding
                                try {
                                    body = new String(error.networkResponse.data,"UTF-8");
                                    Toast.makeText(getApplicationContext(), body, Toast.LENGTH_SHORT).show();

                                } catch (UnsupportedEncodingException e) {
                                    //exception handling to be placed here
                                }
                            }
                        });

                VolleySingleton.getInstance(getApplicationContext()).addToRequestQueue(jsObjRequest);
            }
        });

        no.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent (CancelActivity.this, FlightHistoryActivity.class));
            }
        });

    }

}
