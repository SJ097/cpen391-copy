package com.example.flightbooker;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class CheckFlightsActivity extends AppCompatActivity implements AdapterView.OnItemSelectedListener, AdapterView.OnItemClickListener {

    private EditText dep_airport;
    private EditText arr_airport;
    private EditText from_date;
    private EditText until_date;
    private Spinner dropdown;
    private Button get_flights;
    private ListView listView;
    private String[] flight_info;
    private String[] flight_info_dummy;
    private String[] items = new String[]{"Economy Class", "Business Class", "First Class"};
    private String selectedClass;
    private String seatClass;
    private int[] numSeats;
    private int[] numSeatsDummy;
    private int selectedFlightSeats;
    private Date c;

    private LinearLayout keyboard;

    public static final String SEAT_CLASS = "com.example.myfirstapp.MESSAGE";
    public static final String FLIGHT_ID = "com.example.myfirstapp.MESSAGE2";
    public static final String NUM_SEATS = "com.example.myfirstapp.MESSAGE3";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_check_flights);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);

        Toolbar toolbar = (Toolbar) findViewById(R.id.my_toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setTitle("Check Flights");

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        keyboard = (LinearLayout)findViewById(R.id.flightsLayout);

        dep_airport = (EditText) findViewById(R.id.dep_airport);
        arr_airport = (EditText) findViewById(R.id.arr_airport);
        from_date = (EditText) findViewById(R.id.from_date);
        until_date = (EditText) findViewById(R.id.until_date);
        get_flights = (Button) findViewById(R.id.get_flights);

        dropdown = findViewById(R.id.seat_class);
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_dropdown_item, items);
        dropdown.setAdapter(adapter);

        dropdown.setOnItemSelectedListener((AdapterView.OnItemSelectedListener) this);

        get_flights.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                InputMethodManager imm = (InputMethodManager)getSystemService(Context.INPUT_METHOD_SERVICE);
                imm.hideSoftInputFromWindow(keyboard.getWindowToken(), 0);
                boolean flag = false;

                c = Calendar.getInstance().getTime();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String formattedDate = df.format(c);

                Date today = null;

                try {
                    today = new SimpleDateFormat("yyyy-MM-dd").parse(formattedDate);
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                if (dep_airport.getText().toString().isEmpty()) {
                    dep_airport.setError("This field is required");
                    flag = true;
                }

                Date from = null;

                if (from_date.getText().toString().isEmpty()) {
                    from_date.setError("This field is required");
                    flag = true;
                }

                else if (!today.equals(null)) {

                    try {
                        from = new SimpleDateFormat("yyyy-MM-dd").parse(from_date.getText().toString());

                        if (from.before(today)) {
                            from_date.setError("Entered date is before today");
                            flag = true;
                        }

                    } catch (ParseException e) {
                        Toast.makeText(getApplicationContext(), "Error parsing date!", Toast.LENGTH_SHORT).show();
                        flag = true;
                        e.printStackTrace();
                    }

                }

                if (!until_date.getText().toString().isEmpty() && !from.equals(null)) {

                    try {
                        Date to = new SimpleDateFormat("yyyy-MM-dd").parse(until_date.getText().toString());

                        if (to.before(from)) {
                            until_date.setError("End date is before start date");
                            flag = true;
                        }

                    } catch(ParseException e) {
                        Toast.makeText(getApplicationContext(), "Error parsing date!", Toast.LENGTH_SHORT).show();
                        flag = true;
                        e.printStackTrace();
                    }
                }

                if (!flag) {

                    Map<String, String> params = new HashMap<>();
                    params.put("dep_airport", dep_airport.getText().toString());
                    params.put("from", from_date.getText().toString());
                    if (arr_airport.getText().toString().isEmpty())
                        params.put("arr_airport", "any");
                    else params.put("arr_airport", arr_airport.getText().toString());
                    if (until_date.getText().toString().isEmpty())
                        params.put("until", "inf");
                    else params.put("until", until_date.getText().toString());

                    String loginURL = "http://34.218.93.237/queryFlights.php";

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
                                            //Toast.makeText(getApplicationContext(), "Flight cancelled!", Toast.LENGTH_SHORT).show();
                                            //startActivity(new Intent (CancelActivity.this, DisplaySuccessActivity.class));
                                            JSONArray flights = response.getJSONArray("flights");

                                            int numFlights = flights.length();
                                            flight_info_dummy = new String[numFlights];
                                            numSeatsDummy = new int[numFlights];

                                            int j = 0;

                                            for (int i = 0; i < numFlights; i++) {
                                                JSONObject aFlight = flights.getJSONObject(i);

                                                boolean flag = true;


                                                try {
                                                    Date depTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(aFlight.getString("dep_datetime"));

                                                    System.out.println(depTime);
                                                    System.out.println(c);

                                                    if (depTime.before(c)) {
                                                        flag = false;
                                                    }

                                                } catch (ParseException e) {
                                                    Toast.makeText(getApplicationContext(), "Error parsing time!", Toast.LENGTH_SHORT).show();
                                                    flag = false;
                                                    e.printStackTrace();
                                                }

                                                if (flag) {

                                                    flight_info_dummy[j] = "Flight ID: " + aFlight.getString("flight_id") + "\n" + aFlight.getString("dep_city").replaceAll("/+", " ") + " (" + aFlight.getString("dep_airport") + ") to " + aFlight.getString("arr_city").replaceAll("/+", " ") +
                                                            " (" + aFlight.getString("arr_airport") + ")\n" + aFlight.getString("dep_datetime") + " to " + aFlight.getString("arr_datetime");


                                                    if (selectedClass.equals(items[2])) {
                                                        numSeatsDummy[j] = Integer.parseInt(aFlight.getString("fr_cl_seat_max_row"))
                                                                * Integer.parseInt(aFlight.getString("fr_cl_seat_max_column"));
                                                        seatClass = "first";
                                                    } else if (selectedClass.equals(items[1])) {
                                                        numSeatsDummy[j] = Integer.parseInt(aFlight.getString("bn_cl_seat_max_row"))
                                                                * Integer.parseInt(aFlight.getString("bn_cl_seat_max_column"));
                                                        seatClass = "business";
                                                    } else {
                                                        numSeatsDummy[j] = Integer.parseInt(aFlight.getString("econ_cl_seat_max_row"))
                                                                * Integer.parseInt(aFlight.getString("econ_cl_seat_max_column"));
                                                        seatClass = "economy";
                                                    }

                                                    j++;
                                                }
                                            }

                                            numSeats = new int[j];
                                            flight_info = new String[j];

                                            while (j > 0) {
                                                numSeats[j-1] = numSeatsDummy[j-1];
                                                flight_info[j-1] = flight_info_dummy[j-1];
                                                j--;
                                            }

                                            displayFlights();
                                        }

                                    } catch (JSONException e) {
                                        //problem with receiving JSONObject
                                        //OR
                                        //problem with extracting info from JSONObject
                                        Toast.makeText(getApplicationContext(), "JSON Exception in flight query request!", Toast.LENGTH_SHORT).show();
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
            }
        });

    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
        TextView flight = (TextView) view;
        selectedFlightSeats = numSeats[i];
        bookFlightDialog(flight.getText().toString());
        //Toast.makeText(this, flight.getText(), Toast.LENGTH_SHORT);
    }

    private void displayFlights() {
        listView = (ListView) findViewById(R.id.flight_history);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, flight_info);
        listView.setAdapter(adapter);
        listView.setOnItemClickListener(this);
    }

    public void bookFlightDialog(final String flight_info) {

        new AlertDialog.Builder(this)
                .setTitle("Book Flight?")
                .setMessage(flight_info)
                .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        Intent intent = new Intent(CheckFlightsActivity.this, FetchSeatsActivity.class);
                        intent.putExtra(SEAT_CLASS, seatClass);
                        intent.putExtra(NUM_SEATS, Integer.toString(selectedFlightSeats));
                        intent.putExtra(FLIGHT_ID, flight_info.substring(flight_info.indexOf(":")+2,flight_info.indexOf("\n")));
                        startActivity(intent);
                    }
                })
                .setNegativeButton("No", null)
                .create().show();
    }

    @Override
    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
        selectedClass = adapterView.getItemAtPosition(i).toString();
    }

    @Override
    public void onNothingSelected(AdapterView<?> adapterView) {

    }
}
