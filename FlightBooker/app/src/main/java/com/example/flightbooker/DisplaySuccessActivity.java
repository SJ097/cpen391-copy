package com.example.flightbooker;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class DisplaySuccessActivity extends AppCompatActivity {

    private DrawerLayout mDrawerLayout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_success);

        Toolbar myToolbar = (Toolbar) findViewById(R.id.my_toolbar);
        setSupportActionBar(myToolbar);
        ActionBar actionbar = getSupportActionBar();
        actionbar.setDisplayHomeAsUpEnabled(true);
        actionbar.setHomeAsUpIndicator(R.drawable.ic_menu_black_24dp);

        Intent intent = getIntent();
        //String message = intent.getStringExtra(LoginActivity.USER_WELCOME);

        // Capture the layout's TextView and set the string as its text
        TextView textView = findViewById(R.id.textView);
        //textView.setText(message);

        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        String first = preferences.getString("First Name", "");

        getSupportActionBar().setTitle("Welcome, " + first + "!");//message);

        mDrawerLayout = findViewById(R.id.drawer_layout);

        NavigationView navigationView = findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(
                new NavigationView.OnNavigationItemSelectedListener() {
                    @Override
                    public boolean onNavigationItemSelected(MenuItem menuItem) {
                        // set item as selected to persist highlight
                        menuItem.setChecked(true);
                        // close drawer when item is tapped
                        mDrawerLayout.closeDrawers();

                        // Add code here to update the UI based on the item selected
                        // For example, swap UI fragments here
                        Button logout = (Button) findViewById(R.id.logout);
                        Button settings = (Button) findViewById(R.id.settings);
                        Button password = (Button) findViewById(R.id.password);

                        /*logout.setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View view) {
                                //startActivity(new Intent (DisplaySuccessActivity.this, BookFlightActivity.class));
                                //mDrawerLayout.closeDrawers();
                            }
                        });

                        settings.setOnClickListener(new View.OnClickListener() {
                           @Override
                            public void onClick(View view) {
                               //startActivity(new Intent (DisplaySuccessActivity.this, CheckFlightsActivity.class));
                               //mDrawerLayout.closeDrawers();
                           }
                        });*/

                        return true;
                    }
                });

        Button check_flights = (Button) findViewById(R.id.check_flights);
        Button flight_history = (Button) findViewById(R.id.flight_history);
        Button change_password = (Button) findViewById(R.id.change_password);
        Button airport_map = (Button) findViewById(R.id.map_button);
        Button log_out = (Button) findViewById(R.id.log_out);
        Button user_info = (Button) findViewById(R.id.change_user_info);

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

        change_password.setOnClickListener( new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent (DisplaySuccessActivity.this, PasswordActivity.class));
            }
        });

        user_info.setOnClickListener( new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent (DisplaySuccessActivity.this, UserInfoActivity.class));
            }
        });

        airport_map.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // Matt add your code here
                //startActivity(new Intent(DisplaySuccessActivity.this, UserInfoActivity.class));
            }
        });

        log_out.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
                preferences.edit().clear().commit();
                startActivity(new Intent (DisplaySuccessActivity.this, LoginActivity.class));
            }
        });
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                mDrawerLayout.openDrawer(GravityCompat.START);
                return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onBackPressed() {
        /*if (!shouldAllowBack()) {
            doSomething();
        } else {
            super.onBackPressed();
        }*/
    }
}
