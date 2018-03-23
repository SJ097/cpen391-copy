package com.example.flightbooker;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.AutoCompleteTextView;
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


public class SignupActivity extends AppCompatActivity {

    private EditText first_name;
    private EditText last_name;
    private EditText email;
    private EditText password;
    private EditText password2;
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
        setContentView(R.layout.activity_signup);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);

        Toolbar toolbar = (Toolbar) findViewById(R.id.my_toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setTitle("Sign Up");

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        first_name = (EditText) findViewById(R.id.first_name);

        last_name = (EditText) findViewById(R.id.last_name);

        gender = (Switch) findViewById(R.id.gender);

        email = (EditText) findViewById(R.id.signup_email);

        password = (EditText) findViewById(R.id.signup_password);
        password2 = (EditText) findViewById(R.id.signup_password_confirm);

        dob = (EditText) findViewById(R.id.date_of_birth);

        phone = (EditText) findViewById(R.id.phone_number);

        passport = (EditText) findViewById(R.id.passport_id);

        streetno = (EditText) findViewById(R.id.street_number);
        streetaddr = (EditText) findViewById(R.id.street_address);

        city = (EditText) findViewById(R.id.city);

        postal = (EditText) findViewById(R.id.postal_code);

        confirm = (Button) findViewById(R.id.button);

        confirm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                boolean flag = true;
                String genderVal;

                if (gender.isChecked())
                    genderVal = "Female";

                else genderVal = "Male";

                if (password.getText().toString().isEmpty()) {
                    password.setError("This field is required");
                    //password.requestFocus();
                    flag = false;
                }

                else if (password.getText().length() <=4) {
                    //Toast.makeText(view.getContext(), "Password too short!", Toast.LENGTH_SHORT).show();
                    password.setError("Password too short");
                    //focusView = password;
                    //password.requestFocus();
                    flag = false;
                }

                else if (!password.getText().toString().equals(password2.getText().toString())){
                    //Toast.makeText(view.getContext(), "Passwords don't match!", Toast.LENGTH_SHORT).show();
                    password2.setError("Passwords don't match");
                    //password2.requestFocus();
                    flag = false;
                }


                if(postal.getText().toString().isEmpty()) {
                    postal.setError("This field is required");
                    //postal.requestFocus();
                    flag = false;
                }

                if(city.getText().toString().isEmpty()) {
                    city.setError("This field is required");
                    //city.requestFocus();
                    flag = false;
                }

                if(streetaddr.getText().toString().isEmpty()) {
                    streetaddr.setError("This field is required");
                    //streetno.requestFocus();
                    flag = false;
                }

                if(streetno.getText().toString().isEmpty()) {
                    streetno.setError("This field is required");
                    //streetno.requestFocus();
                    flag = false;
                }

                if(passport.getText().toString().isEmpty()) {
                    passport.setError("This field is required");
                    //passport.requestFocus();
                    flag = false;
                }

                if(phone.getText().toString().isEmpty()) {
                    phone.setError("This field is required");
                    //phone.requestFocus();
                    flag = false;
                }

                /*else {



                    if(phone.getText().toString().isEmpty()) {
                        phone.setError("This field is required");
                        //phone.requestFocus();
                        flag = false;
                    }
                }*/

                if(email.getText().toString().isEmpty()) {
                    email.setError("This field is required");
                    //email.requestFocus();
                    flag = false;
                }

                else if(!(email.getText().toString().contains("@") & email.getText().toString().contains("."))) {
                    email.setError("This email is invalid");
                    //email.requestFocus();
                    flag = false;
                }

                if(dob.getText().toString().isEmpty()) {
                    dob.setError("This field is required");
                    //dob.requestFocus();
                    flag = false;
                }

                if(last_name.getText().toString().isEmpty()) {
                    last_name.setError("This field is required");
                    //last_name.requestFocus();
                    flag = false;
                }

                 if(first_name.getText().toString().isEmpty()) {
                     first_name.setError("This field is required");
                     //first_name.requestFocus();
                     flag = false;
                 }

                if (flag == true) {

                    Map<String, String> params = new HashMap<>();
                    params.put("email", email.getText().toString());
                    params.put("phone_number", phone.getText().toString());
                    params.put("first_name", first_name.getText().toString());
                    params.put("last_name", last_name.getText().toString());
                    params.put("encrypted_password", password.getText().toString());
                    params.put("street_number", first_name.getText().toString());
                    params.put("street_address", streetaddr.getText().toString());//first_name.getText().toString());
                    params.put("city", city.getText().toString());
                    params.put("postal_code", postal.getText().toString());
                    params.put("gender", genderVal);
                    params.put("dob", dob.getText().toString());
                    params.put("passport_id", passport.getText().toString());

                    String loginURL = "http://34.218.93.237/signup.php";
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
                                            //startActivity(new Intent(SignupActivity.this, LoginActivity.class));
                                        }

                                        //if log in successful
                                        else {
                                            Toast.makeText(getApplicationContext(), "Profile created!", Toast.LENGTH_SHORT).show();
                                            startActivity(new Intent(SignupActivity.this, LoginActivity.class));
                                        }

                                    } catch (JSONException e) {
                                        //problem with receiving JSONObject
                                        //OR
                                        //problem with extracting info from JSONObject
                                        Toast.makeText(getApplicationContext(), "JSON Exception in password activity!!", Toast.LENGTH_SHORT).show();
                                        e.printStackTrace();
                                        //startActivity(new Intent(SignupActivity.this, LoginActivity.class));
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
}
