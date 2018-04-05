package com.example.flightbooker;

import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.preference.PreferenceManager;
import android.support.v4.app.FragmentActivity;
import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.Polyline;
import com.google.android.gms.maps.model.PolylineOptions;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MapsActivity extends FragmentActivity implements OnMapReadyCallback {

    private GoogleMap mMap;
    private SharedPreferences preferences;
    private String userID;
    private List<String> cities;
    static private Map<String, String> history;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_maps);

        preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        userID = preferences.getString("User ID", "");

        // Obtain the SupportMapFragment and get notified when the map is ready to be used.
        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager()
                .findFragmentById(R.id.map);
        mapFragment.getMapAsync(this);
    }


    /**
     * Manipulates the map once available.
     * This callback is triggered when the map is ready to be used.
     * This is where we can add markers or lines, add listeners or move the camera. In this case,
     * we just add a marker near Sydney, Australia.
     * If Google Play services is not installed on the device, the user will be prompted to install
     * it inside the SupportMapFragment. This method will only be triggered once the user has
     * installed Google Play services and returned to the app.
     */
    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;

        cities = new ArrayList<>();
        history = new HashMap<>();

        getFlightQuery();

        SharedPreferences.Editor editor = preferences.edit();

        for (String villes : cities) {
            editor.remove(villes);
            editor.commit();
        }
    }

    private void getFlightQuery() {

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
                            }

                            //if log in successful
                            else {
                                //Toast.makeText(getApplicationContext(), "Password changed!", Toast.LENGTH_SHORT).show();
                                JSONArray ongoing_reservations = response.getJSONArray("ongoing_reservations");
                                JSONArray past_reservations = response.getJSONArray("past_reservations");

                                for (int i = 0; i < ongoing_reservations.length(); i++) {
                                    String depCity = ongoing_reservations.getJSONObject(i).getString("dep_airport")+"+Airport";
                                    String destCity = ongoing_reservations.getJSONObject(i).getString("arr_airport")+"+Airport";

                                    if (!cities.contains(depCity)) {
                                        displayOnMap(depCity);
                                        cities.add(depCity);
                                        history.put(depCity, preferences.getString(depCity, ""));
                                    }

                                    if (!cities.contains(destCity)) {
                                        displayOnMap(destCity);
                                        cities.add(destCity);
                                        history.put(destCity, preferences.getString(destCity, ""));
                                    }

                                    String departure = history.get(depCity);
                                    String arrival = history.get(destCity);

                                    double depLat = Double.parseDouble(departure.substring(departure.indexOf("(")+1, departure.indexOf(",")));
                                    double depLong = Double.parseDouble(departure.substring(departure.indexOf(",")+1, departure.indexOf(")")));

                                    double arrLat = Double.parseDouble(arrival.substring(arrival.indexOf("(")+1, arrival.indexOf(",")));
                                    double arrLong = Double.parseDouble(arrival.substring(arrival.indexOf(",")+1, arrival.indexOf(")")));

                                    Polyline polyline1 = mMap.addPolyline(new PolylineOptions()
                                            .clickable(true)
                                            .color(Color.BLUE)
                                            .add(
                                                    new LatLng(depLat, depLong),
                                                    new LatLng(arrLat, arrLong)));
                                }

                                for (int i = 0; i < past_reservations.length(); i++) {
                                    String depCity = past_reservations.getJSONObject(i).getString("dep_airport")+"+Airport";
                                    String destCity = past_reservations.getJSONObject(i).getString("arr_airport")+"+Airport";

                                    if (!cities.contains(depCity)) {
                                        displayOnMap(depCity);
                                        cities.add(depCity);
                                        history.put(depCity, preferences.getString(depCity, ""));
                                    }

                                    if (!cities.contains(destCity)) {
                                        displayOnMap(destCity);
                                        cities.add(destCity);
                                        history.put(destCity, preferences.getString(destCity, ""));
                                    }

                                    String departure = history.get(depCity);
                                    String arrival = history.get(destCity);

                                    double depLat = Double.parseDouble(departure.substring(departure.indexOf("(")+1, departure.indexOf(",")));
                                    double depLong = Double.parseDouble(departure.substring(departure.indexOf(",")+1, departure.indexOf(")")));

                                    System.out.println(arrival);

                                    double arrLat = Double.parseDouble(arrival.substring(arrival.indexOf("(")+1, arrival.indexOf(",")));
                                    double arrLong = Double.parseDouble(arrival.substring(arrival.indexOf(",")+1, arrival.indexOf(")")));

                                    Polyline polyline1 = mMap.addPolyline(new PolylineOptions()
                                            .clickable(true)
                                            .add(
                                                    new LatLng(depLat, depLong),
                                                    new LatLng(arrLat, arrLong)));

                                    /*Marker centerOneMarker = mMap.addMarker(new MarkerOptions()
                                            .position(new LatLng((depLat+arrLat)/2, (depLong+arrLong)/2)));*/
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
                                String address = data.getJSONObject(0).getJSONArray("address_components").getJSONObject(0).getString("long_name");
                                final double longitude = data.getJSONObject(0).getJSONObject("geometry").getJSONObject("location").getDouble("lng");
                                final double latitude = data.getJSONObject(0).getJSONObject("geometry").getJSONObject("location").getDouble("lat");
                                LatLng mtl = new LatLng(latitude, longitude);
                                mMap.addMarker(new MarkerOptions().position(mtl).title(address));
                                SharedPreferences.Editor editor = preferences.edit();

                                do {
                                    editor.putString(ville, mtl.toString());
                                    editor.apply();
                                } while (!preferences.getString(ville, "").equals(mtl.toString()));
                                //getCoords(ville, mtl, 0);
                                //editor.commit();
                                //System.out.println(ville + preferences.getString(ville, ""));
                                //mMap.moveCamera(CameraUpdateFactory.newLatLng(mtl));
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

}
