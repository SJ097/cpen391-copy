package com.example.flightbooker;

import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
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

public class PasswordActivity extends AppCompatActivity {

    private EditText old;
    private EditText newpass;
    private EditText newpass2;
    private Button confirm;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_password);

        Toolbar toolbar = (Toolbar) findViewById(R.id.my_toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setTitle("Change Password");

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        old = (EditText) findViewById(R.id.old_password);
        newpass = (EditText) findViewById(R.id.new_password);
        newpass2 = (EditText) findViewById(R.id.new_password_confirm);
        confirm = (Button) findViewById(R.id.new_password_button);

        confirm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                boolean flag = true;

                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
                String storedPass = preferences.getString("Password", "");
                String user_id = preferences.getString("User ID", "");

                if (!newpass.getText().toString().equals(newpass2.getText().toString())) {
                    newpass.setError("New passwords are different");
                    newpass2.setError("New passwords are different");
                    flag = false;
                }

                if (newpass.getText().toString().length() <= 4) {
                    newpass.setError("New password too short");
                    flag = false;
                }

                if (old.getText().toString().equals(newpass.getText().toString())) {
                    old.setError("New and old passwords are the same");
                    newpass.setError("New and old passwords are the same");
                    flag = false;
                }

                if (!old.getText().toString().equals(storedPass)) {
                    old.setError("Old password is incorrect");
                    flag = false;
                }

                if (flag == true) {
                    SharedPreferences.Editor editor = preferences.edit();
                    editor.putString("Password", newpass.getText().toString());
                    editor.apply();

                    // POST on database

                    Map<String, String> params = new HashMap<>();
                    params.put("user_id", user_id.toString());
                    params.put("old_password", old.getText().toString());
                    params.put("new_password", newpass.getText().toString());

                    String loginURL = "http://34.218.93.237/userPasswordUpdate.php";
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
                                            startActivity(new Intent(PasswordActivity.this, DisplaySuccessActivity.class));
                                        }

                                        //if log in successful
                                        else {
                                            Toast.makeText(getApplicationContext(), "Password changed!", Toast.LENGTH_SHORT).show();
                                            startActivity(new Intent(PasswordActivity.this, DisplaySuccessActivity.class));
                                        }

                                    } catch (JSONException e) {
                                        //problem with receiving JSONObject
                                        //OR
                                        //problem with extracting info from JSONObject
                                        Toast.makeText(getApplicationContext(), "JSON Exception in password activity!!", Toast.LENGTH_SHORT).show();
                                        e.printStackTrace();
                                        startActivity(new Intent(PasswordActivity.this, DisplaySuccessActivity.class));
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
