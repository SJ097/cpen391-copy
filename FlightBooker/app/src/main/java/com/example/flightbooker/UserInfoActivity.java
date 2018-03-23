package com.example.flightbooker;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

public class UserInfoActivity extends AppCompatActivity {

    private EditText first_name;
    private EditText last_name;
    private EditText email;
    private EditText dob;
    private EditText phone;
    private EditText passport;
    private EditText streetno;
    private EditText streetaddr;
    private EditText city;
    private EditText postal;
    private Switch gender;
    private Button confirm;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_info);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);

        Toolbar toolbar = (Toolbar) findViewById(R.id.my_toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setTitle("Change User Info");

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        first_name = (EditText) findViewById(R.id.change_first_name);

        last_name = (EditText) findViewById(R.id.change_last_name);

        gender = (Switch) findViewById(R.id.change_gender);

        email = (EditText) findViewById(R.id.change_email);

        dob = (EditText) findViewById(R.id.change_date_of_birth);

        phone = (EditText) findViewById(R.id.change_phone_number);

        passport = (EditText) findViewById(R.id.change_passport_id);

        streetno = (EditText) findViewById(R.id.change_street_number);
        streetaddr = (EditText) findViewById(R.id.change_street_address);

        city = (EditText) findViewById(R.id.change_city);

        postal = (EditText) findViewById(R.id.change_postal_code);

        confirm = (Button) findViewById(R.id.change_button);

        confirm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String fnText, lnText, eText, dobText, phText, paText, stnoText, staddrText, cText, poText, genderVal;

                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());

                SharedPreferences.Editor editor = preferences.edit();

                if (gender.isChecked())
                    genderVal = "Female";

                else genderVal = "Male";
                editor.putString("Gender", genderVal);
                editor.apply();

                if (first_name.getText().toString().isEmpty()) {
                    fnText = preferences.getString("First Name", "");
                }

                else {
                    fnText = first_name.getText().toString();
                    editor.putString("First Name", fnText);
                    editor.apply();
                }

                if (last_name.getText().toString().isEmpty()) {
                    lnText = preferences.getString("Last Name", "");
                }

                else {
                    lnText = last_name.getText().toString();
                    editor.putString("Last Name", lnText);
                    editor.apply();
                }

                if (email.getText().toString().isEmpty()) {
                    eText = preferences.getString("Email", "");
                }

                else {
                    eText = email.getText().toString();
                    editor.putString("Email", eText);
                    editor.apply();
                }

                if (dob.getText().toString().isEmpty()) {
                    dobText = preferences.getString("Date of Birth", "");
                }

                else {
                    dobText = dob.getText().toString();
                    editor.putString("Date of Birth", dobText);
                    editor.apply();
                }

                if (phone.getText().toString().isEmpty()) {
                    phText = preferences.getString("Phone Number", "");
                }

                else {
                    phText = phone.getText().toString();
                    editor.putString("Phone Number", phText);
                    editor.apply();
                }

                if (passport.getText().toString().isEmpty()) {
                    paText = preferences.getString("Passport ID", "");
                }

                else {
                    paText = passport.getText().toString();
                    editor.putString("Passport ID", paText);
                    editor.apply();
                }

                if (streetno.getText().toString().isEmpty()) {
                    stnoText = preferences.getString("Street Number", "");
                }

                else {
                    stnoText = streetno.getText().toString();
                    editor.putString("Street Number", stnoText);
                    editor.apply();
                }

                if (streetaddr.getText().toString().isEmpty()) {
                    staddrText = preferences.getString("Street Address", "");
                }

                else {
                    staddrText = streetaddr.getText().toString();
                    editor.putString("Street Address", staddrText);
                    editor.apply();
                }

                if (city.getText().toString().isEmpty()) {
                    cText = preferences.getString("City", "");
                }

                else {
                    cText = city.getText().toString();
                    editor.putString("City", cText);
                    editor.apply();
                }

                if (postal.getText().toString().isEmpty()) {
                    poText = preferences.getString("Postal Code", "");
                }

                else {
                    poText = postal.getText().toString();
                    editor.putString("Postal Code", poText);
                    editor.apply();
                }

                // POST on database

                //fnText, lnText, eText, dobText, phText, paText, stnoText, staddrText, cText, poText, genderVal;

                Map<String, String> params = new HashMap<>();
                params.put("user_id", preferences.getString("User ID", ""));
                params.put("email", eText);
                params.put("phone_number", phText);
                params.put("passport_id", paText);
                params.put("first_name", fnText);
                params.put("last_name", lnText);
                params.put("street_number", stnoText);
                params.put("street_address", staddrText);
                params.put("city", cText);
                params.put("postal_code", poText);
                params.put("gender", genderVal);
                params.put("dob", dobText);

                String loginURL = "http://34.218.93.237/userRegInfoUpdate.php";
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
                                        //startActivity(new Intent(UserInfoActivity.this, DisplaySuccessActivity.class));
                                    }

                                    //if log in successful
                                    else {
                                        Toast.makeText(getApplicationContext(), "Information updated!", Toast.LENGTH_SHORT).show();
                                        startActivity(new Intent(UserInfoActivity.this, DisplaySuccessActivity.class));
                                    }

                                } catch (JSONException e) {
                                    //problem with receiving JSONObject
                                    //OR
                                    //problem with extracting info from JSONObject
                                    Toast.makeText(getApplicationContext(), "JSON Exception in password activity!!", Toast.LENGTH_SHORT).show();
                                    e.printStackTrace();
                                    //startActivity(new Intent(UserInfoActivity.this, DisplaySuccessActivity.class));
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
    }
}
