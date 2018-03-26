package com.example.flightbooker.Map;

import java.io.Serializable;
import java.util.LinkedList;

/**
 * Created by Matt on 2018-03-24.
 */

public class MapNode implements Serializable{

    private int id;
    private String name;
    private LinkedList<MapNode> adjList = new LinkedList();
    private int x,y;
    public boolean visited;
    public MapNode parent;
    public MapNode(int x, int y, String name){
        this.x = x;
        this.y = y;
        this.name = name;
        this.id = id;
        visited = false;
        parent = null;
    }

    public String getName(){
        return name;
    }
    public int getX(){
        return x;
    }

    public int getY(){
        return y;
    }

    public int getId(){
        return id;
    }

    public MapNode getUnvisitedNeighbor(){
        MapNode n;
        for(int i = 0; i < adjList.size(); i++){
            n = adjList.get(i);
            if(!n.visited){
                return n;
            }
        }
        return null;
    }

    public LinkedList<MapNode> getAdjList(){
        return adjList;
    }

    public void connect(MapNode n){
        adjList.add(n);
    }
}
