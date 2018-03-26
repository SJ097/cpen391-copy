package com.example.flightbooker.Map;

/**
 * Created by Matt on 2018-03-18.
 */

public class Venue {

    private String name;
    private String cls;
    private int resId;

    private int startHour, stopHour;
    private String openHours;
    public Venue(String name, String cls, int resId, int startHour, int stopHour){
        this.name = name;
        this.cls = cls;
        this.startHour = startHour;
        this.stopHour = stopHour;
        this.resId = resId;

        if(startHour == stopHour){
            openHours = "Open 24 hours";
        }
        int s1 = startHour, s2 = stopHour;
        if(s1 > 12){
            s1 -= 12;
        }
        else if(s1 == 0){ s1 = 12;}
        if(s2 > 12){
            s2 -= 12;
        }
        else if(s2 == 0){ s2 = 12;}

        if(startHour == stopHour){
            openHours = "Open 24 hours";
        }
        else if(startHour <= 12 && stopHour <= 12){
            openHours = String.format("Open %d:00-%d:00am",s1,s2);
        }
        else if(startHour > 12 && stopHour > 12){
            openHours = String.format("Open %d:00-%d:0pm",s1,s2);
        }
        else if(startHour <= 12 && stopHour > 12){
            openHours = String.format("Open %d:00am-%d:00pm", startHour, stopHour);
        }
        else{
            openHours = String.format("Open %d:00pm-%d:00am", startHour, stopHour);
        }
    }

    public int getResId(){
        return resId;
    }

    public String getOpenHours(){
        return openHours;
    }

    public String getName(){
        return name;
    }

    public String getCls(){return cls;}

}
