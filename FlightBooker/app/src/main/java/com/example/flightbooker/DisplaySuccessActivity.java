package com.example.flightbooker;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.support.annotation.RequiresApi;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.PopupMenu;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.example.flightbooker.Map.MapActivity;
import com.example.flightbooker.cpen391.m24111.bagvision.activities.CameraActivity;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

public class DisplaySuccessActivity extends AppCompatActivity {

    private SharedPreferences preferences;
    private String userID;

    @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_success);

        Toolbar myToolbar = (Toolbar) findViewById(R.id.my_toolbar);
        setSupportActionBar(myToolbar);

        preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        String first = preferences.getString("First Name", "");
        userID = preferences.getString("User ID", "");

        getSupportActionBar().setTitle("Welcome, " + first + "!");

        Button check_flights = (Button) findViewById(R.id.check_flights);
        Button flight_history = (Button) findViewById(R.id.flight_history);
        Button airport_map = (Button) findViewById(R.id.map_button);
        Button interactive_map = (Button) findViewById(R.id.interactive_map);
        Button object_recognition = (Button) findViewById(R.id.object_recognition);


        check_flights.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent (DisplaySuccessActivity.this, CheckFlightsActivity.class));
            }
        });

        flight_history.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent (DisplaySuccessActivity.this, FlightHistoryActivity.class));
            }
        });

        airport_map.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //finish();
                startActivity(new Intent(DisplaySuccessActivity.this, MapActivity.class));
            }
        });

        interactive_map.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                getFlightQuery();
                startActivity(new Intent(DisplaySuccessActivity.this, MapsActivity.class));
            }
        });

        object_recognition.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(DisplaySuccessActivity.this, CameraActivity.class));
            }
        });
    }

    private void getFlightQuery() {

        Map<String, String> params = new HashMap<>();
        params.put("user_id", userID.toString());

        String loginURL = "http://34.218.93.237/fetchBookings.php";

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
                            }

                            //if log in successful
                            else {
                                //Toast.makeText(getApplicationContext(), "Password changed!", Toast.LENGTH_SHORT).show();
                                JSONArray ongoing_reservations = response.getJSONArray("ongoing_reservations");
                                JSONArray past_reservations = response.getJSONArray("past_reservations");

                                for (int i = 0; i < ongoing_reservations.length(); i++) {
                                    String depCity = ongoing_reservations.getJSONObject(i).getString("dep_airport")+"+Airport";
                                    String destCity = ongoing_reservations.getJSONObject(i).getString("arr_airport")+"+Airport";

                                    displayOnMap(depCity);
                                    displayOnMap(destCity);
                                }

                                for (int i = 0; i < past_reservations.length(); i++) {
                                    String depCity = past_reservations.getJSONObject(i).getString("dep_airport")+"+Airport";
                                    String destCity = past_reservations.getJSONObject(i).getString("arr_airport")+"+Airport";

                                    displayOnMap(depCity);
                                    displayOnMap(destCity);
                                }
                            }

                        } catch (JSONException e) {
                            //problem with receiving JSONObject
                            //OR
                            //problem with extracting info from JSONObject
                            Toast.makeText(getApplicationContext(), "JSON Exception in flight history activity!", Toast.LENGTH_SHORT).show();
                            e.printStackTrace();
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

    private void displayOnMap(String city) {

        final String ville = city;
        String loginURL = "https://maps.googleapis.com/maps/api/geocode/json?address=" + city + "&key=AIzaSyAduKWcNJzCbkJC3cIJNC358jhY94B78Ns";
        Map<String, String> params = new HashMap<>();

        CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, loginURL, params,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {

                        try {
                            // if log in is failed, toast the reason why
                            String success = response.getString("status");

                            if(!success.equals("OK")) {
                                String reason = response.getString("fail_reason");
                                System.out.println(reason);
                                Toast.makeText(getApplicationContext(), reason, Toast.LENGTH_SHORT).show();
                            }

                            //if log in successful
                            else {
                                JSONArray data = response.getJSONArray("results");
                                final double longitude = data.getJSONObject(0).getJSONObject("geometry").getJSONObject("location").getDouble("lng");
                                final double latitude = data.getJSONObject(0).getJSONObject("geometry").getJSONObject("location").getDouble("lat");
                                LatLng mtl = new LatLng(latitude, longitude);
                                SharedPreferences.Editor editor = preferences.edit();

                                do {
                                    editor.putString(ville, mtl.toString());
                                    editor.apply();
                                } while (!preferences.getString(ville, "").equals(mtl.toString()));
                            }

                        } catch (JSONException e) {
                            //problem with receiving JSONObject
                            //OR
                            //problem with extracting info from JSONObject
                            Toast.makeText(getApplicationContext(), "JSON Exception in maps activity!!", Toast.LENGTH_SHORT).show();
                            e.printStackTrace();
                            //startActivity(new Intent(MapsActivity.this, DisplaySuccessActivity.class));
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

    @Override
    public void onBackPressed() {
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.my_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        if (item.getItemId() == R.id.info_user_change) {
            startActivity(new Intent (DisplaySuccessActivity.this, UserInfoActivity.class));
        }

        else if (item.getItemId() == R.id.password_change) {
            startActivity(new Intent (DisplaySuccessActivity.this, PasswordActivity.class));
        }

        else if (item.getItemId() == R.id.logout_button) {
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
            preferences.edit().clear().commit();
            startActivity(new Intent (DisplaySuccessActivity.this, LoginActivity.class));
        }

        return super.onOptionsItemSelected(item);
    }
}
