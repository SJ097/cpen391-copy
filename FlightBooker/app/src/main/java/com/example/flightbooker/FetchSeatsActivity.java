package com.example.flightbooker;

import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
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

public class FetchSeatsActivity extends AppCompatActivity implements AdapterView.OnItemClickListener{

    private String seatClass;
    private String flightID;
    private int numSeats;
    private String[] seatList;
    private String[] noSeats = new String[1];// = {"There are no available seats on this flight."};
    private ListView listView;
    private SharedPreferences preferences;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fetch_seats);

        Toolbar toolbar = (Toolbar) findViewById(R.id.my_toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setTitle("Select Seat");

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        Intent intent = getIntent();
        seatClass = intent.getStringExtra(CheckFlightsActivity.SEAT_CLASS);
        flightID = intent.getStringExtra(CheckFlightsActivity.FLIGHT_ID);
        numSeats = Integer.parseInt(intent.getStringExtra(CheckFlightsActivity.NUM_SEATS));

        System.out.println(numSeats);
        System.out.println(intent.getStringExtra(CheckFlightsActivity.NUM_SEATS));

        preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());

        Map<String, String> params = new HashMap<>();
        params.put("flight_id", flightID);
        params.put("class", seatClass);

        noSeats[0] = "There are no " + seatClass + " seats available on this flight. We apologize for this inconvenience.";

        String loginURL = "http://34.218.93.237/fetchSeats.php";

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
                                JSONObject remainingSeats = response.getJSONObject("seats");

                                //System.out.println(remainingSeats);
                                //System.out.println(numSeats);

                                int j = 0;

                                for (int i = 0; i < numSeats; i++) {

                                    if (remainingSeats.getInt(Integer.toString(i)) == 1) {
                                        j++;
                                    }
                                }

                                seatList = new String[j];
                                j = 0;

                                for (int i = 0; i < numSeats; i++) {

                                    if (remainingSeats.getInt(Integer.toString(i)) == 1) {
                                        seatList[j] = "Seat #" + Integer.toString(i);
                                        j++;
                                    }
                                }

                                displaySeats();
                            }

                        } catch (JSONException e) {
                            //problem with receiving JSONObject
                            //OR
                            //problem with extracting info from JSONObject
                            Toast.makeText(getApplicationContext(), "JSON Exception in fetch seats request!", Toast.LENGTH_SHORT).show();
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

    private void displaySeats() {
        if (seatList[0] != null) {
            listView = (ListView) findViewById(R.id.list_seats);
            ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, seatList);
            listView.setAdapter(adapter);
            listView.setOnItemClickListener(this);
        }

        else {
            listView = (ListView) findViewById(R.id.list_seats);
            ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, noSeats);
            listView.setAdapter(adapter);
            listView.setOnItemClickListener(this);
        }
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

        if (seatList[0] != null) {
            final int theSeat = i;
            new AlertDialog.Builder(this)
                    .setTitle("Confirm?")
                    .setMessage(seatList[i])
                    .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialogInterface, int i) {

                            System.out.println(flightID);

                            Map<String, String> params = new HashMap<>();
                            params.put("user_id", preferences.getString("User ID", ""));
                            params.put("flight_id", flightID);
                            params.put("flyer_passport_id", preferences.getString("Passport ID", ""));
                            System.out.println(seatList[theSeat].substring(seatList[theSeat].indexOf("#") + 1));
                            params.put("seat_num", seatList[theSeat].substring(seatList[theSeat].indexOf("#") + 1));
                            params.put("flyer_fname", preferences.getString("First Name", ""));
                            params.put("flyer_lname", preferences.getString("Last Name", ""));
                            params.put("flyer_street_number", preferences.getString("Street Number", ""));
                            params.put("flyer_street_address", preferences.getString("Street Address", ""));
                            params.put("flyer_city", preferences.getString("City", ""));
                            params.put("flyer_postal_code", preferences.getString("Postal Code", ""));
                            params.put("flyer_gender", preferences.getString("Gender", ""));
                            params.put("flyer_dob", preferences.getString("Date of Birth", ""));
                            params.put("flyer_phone_number", preferences.getString("Phone Number", ""));
                            params.put("flyer_email", preferences.getString("Email", ""));
                            params.put("class", seatClass);

                            String loginURL = "http://34.218.93.237/book_flight.php";

                            CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, loginURL, params,
                                    new Response.Listener<JSONObject>() {
                                        @Override
                                        public void onResponse(JSONObject response) {

                                            try {
                                                // if log in is failed, toast the reason why
                                                int success = Integer.parseInt(response.getString("success"));

                                                if (success == 0) {
                                                    String reason = response.getString("fail_reason");
                                                    Toast.makeText(getApplicationContext(), reason, Toast.LENGTH_SHORT).show();
                                                }

                                                //if log in successful
                                                else {
                                                    Toast.makeText(getApplicationContext(), "Flight booked!", Toast.LENGTH_SHORT).show();
                                                    startActivity(new Intent(FetchSeatsActivity.this, DisplaySuccessActivity.class));
                                                }

                                            } catch (JSONException e) {
                                                //problem with receiving JSONObject
                                                //OR
                                                //problem with extracting info from JSONObject
                                                Toast.makeText(getApplicationContext(), "JSON Exception in book flight request!", Toast.LENGTH_SHORT).show();
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
                                                body = new String(error.networkResponse.data, "UTF-8");
                                                Toast.makeText(getApplicationContext(), body, Toast.LENGTH_SHORT).show();

                                            } catch (UnsupportedEncodingException e) {
                                                //exception handling to be placed here
                                            }
                                        }
                                    });
                            VolleySingleton.getInstance(getApplicationContext()).addToRequestQueue(jsObjRequest);
                        }
                    })
                    .setNegativeButton("No", null)
                    .create().show();
        }
    }

}
