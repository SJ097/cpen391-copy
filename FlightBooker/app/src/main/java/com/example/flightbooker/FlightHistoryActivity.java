package com.example.flightbooker;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v4.content.res.TypedArrayUtils;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
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

public class FlightHistoryActivity extends AppCompatActivity implements AdapterView.OnItemClickListener {

    private ListView listView;
    private String[] noFlights = {"You have no flights."};
    private SharedPreferences preferences;
    private String userID;
    private String[] ongoingArray;// = new String[5];
    private String[] pastArray;// = new String[5];
    private String[] cancelledArray;// = new String[5];
    private String[] allFlights = new String[15];
    private ProgressBar progressBar;

    private int ongoingSize, pastSize, cancelledSize;

    public static final String CANCEL_FLIGHT = "com.example.myfirstapp.MESSAGE";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_flight_history);

        Toolbar toolbar = (Toolbar) findViewById(R.id.my_toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setTitle("Flight History");

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);


        preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        userID = preferences.getString("User ID", "");

        // POST on database

        Map<String, String> params = new HashMap<>();
        params.put("user_id", userID.toString());

        String loginURL = "http://34.218.93.237/fetchBookings.php";
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
                                startActivity(new Intent(FlightHistoryActivity.this, DisplaySuccessActivity.class));
                            }

                            //if log in successful
                            else {
                                //Toast.makeText(getApplicationContext(), "Password changed!", Toast.LENGTH_SHORT).show();
                                JSONArray ongoing_reservations = response.getJSONArray("ongoing_reservations");
                                JSONArray past_reservations = response.getJSONArray("past_reservations");
                                JSONArray cancelled_reservations = response.getJSONArray("cancelled_reservations");

                                int i = 0;

                                ongoingArray = new String[ongoing_reservations.length()];

                                while (!ongoing_reservations.isNull(i)) {
                                    JSONObject reservation = ongoing_reservations.getJSONObject(i);

                                    ongoingArray[i] = "ONGOING\nReservation ID: " + reservation.getString("reservation_id") + "\nFlight ID: " + reservation.get("flight_id") + "\n"
                                            + reservation.getString("dep_city") + " to " + reservation.getString("arr_city") + "\n" + reservation.getString("dep_datetime")
                                            + " to " + reservation.getString("arr_datetime") + "\nSeat #" + reservation.getString("seat_num");
                                    i++;
                                }

                                ongoingSize = i;
                                //System.out.println(ongoingArray);

                                pastArray = new String[past_reservations.length()];
                                i = 0;

                                while (!past_reservations.isNull(i)) {
                                    JSONObject reservation = past_reservations.getJSONObject(i);

                                    pastArray[i] = "PAST\nReservation ID: " + reservation.getString("reservation_id") + "\nFlight ID: " + reservation.get("flight_id") + "\n"
                                            + reservation.getString("dep_city") + " to " + reservation.getString("arr_city") + "\n" + reservation.getString("dep_datetime")
                                            + " to " + reservation.getString("arr_datetime") + "\nSeat #" + reservation.getString("seat_num");
                                    i++;
                                    //System.out.println(pastArray[i]);
                                }

                                pastSize = i;
                                cancelledArray = new String[cancelled_reservations.length()];
                                i = 0;

                                while (!cancelled_reservations.isNull(i)) {
                                    JSONObject reservation = cancelled_reservations.getJSONObject(i);

                                    cancelledArray[i] = "CANCELLED\nReservation ID: " + reservation.getString("reservation_id") + "\nFlight ID: " + reservation.get("flight_id") + "\n"
                                            + reservation.getString("dep_city") + " to " + reservation.getString("arr_city") + "\n" + reservation.getString("dep_datetime")
                                            + " to " + reservation.getString("arr_datetime") + "\nSeat #" + reservation.getString("seat_num");
                                    i++;
                                    //System.out.println(cancelledArray[i]);
                                }

                                cancelledSize = i;
                                afterFetch();

                            }

                        } catch (JSONException e) {
                            //problem with receiving JSONObject
                            //OR
                            //problem with extracting info from JSONObject
                            Toast.makeText(getApplicationContext(), "JSON Exception in flight history activity!", Toast.LENGTH_SHORT).show();
                            e.printStackTrace();
                            startActivity(new Intent(FlightHistoryActivity.this, DisplaySuccessActivity.class));
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
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
        TextView flight = (TextView) view;
        String plane = flight.getText().toString();

        if (plane.contains("ONGOING")) {
            Intent intent = new Intent(FlightHistoryActivity.this, CancelActivity.class);
            intent.putExtra(CANCEL_FLIGHT, plane.substring(plane.indexOf("\n")+1));
            startActivity(intent);
        }
    }

    private void afterFetch() {

        if (ongoingArray.length != 0 || pastArray.length != 0  || cancelledArray.length != 0) {

            String[] finalArray = new String[ongoingSize+pastSize+cancelledSize];


            for (int i = 0; i < ongoingSize; i++) {
                finalArray[i] = ongoingArray[i];
            }

            for (int i = 0; i < pastSize; i++) {
                finalArray[i+ongoingSize] = pastArray[i];
            }

            for (int i = 0; i < cancelledSize; i++) {
                finalArray[i+ongoingSize+pastSize] = cancelledArray[i];
            }

            listView = (ListView) findViewById(R.id.flight_history);
            ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, finalArray);
            listView.setAdapter(adapter);
            listView.setOnItemClickListener(this);
        }

        else {
            listView = (ListView) findViewById(R.id.flight_history);
            ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, noFlights);
            listView.setAdapter(adapter);
            listView.setOnItemClickListener(this);
        }
    }
}
