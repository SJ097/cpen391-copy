package com.example.flightbooker.Map;

import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.AbstractMap;
import java.util.Queue;
import java.util.Set;
import java.io.Serializable;

/**
 * Created by Matt on 2018-03-24.
 */

public class MapGraph implements Serializable{

    private Set<MapNode> nodes = new HashSet();
    Map<AbstractMap.SimpleEntry<String,String>, MapNode[]> paths = new HashMap();

    public MapGraph(MapNode[] nodes){
        for(int i = 0; i < nodes.length; i++){
            this.nodes.add(nodes[i]);
        }
    }

    public void createPaths(){
        Iterator it1 = nodes.iterator();
        while(it1.hasNext()){
            Iterator it2 = nodes.iterator();
            MapNode n = (MapNode)it1.next();
            while(it2.hasNext()){
                MapNode m = (MapNode)it2.next();
                if(!m.equals(n)){
                    AbstractMap.SimpleEntry pair = new AbstractMap.SimpleEntry(n.getName(),m.getName());
                    AbstractMap.SimpleEntry backwards = new AbstractMap.SimpleEntry(m.getName(),n.getName());
                    if(!paths.containsKey(backwards)){
                        MapNode[] path = Bfs(n,m);
                        paths.put(pair,path);
                    }
                }
            }
        }
    }

    public void connect(String name1, String name2){
        MapNode n1  = null,n2 = null;
        Iterator it = nodes.iterator();
        while(it.hasNext()){
            MapNode n = (MapNode)it.next();
            if(n.getName() == name1){
                n1 = n;
            }
            else if(n.getName() == name2){
                n2 = n;
            }
        }
        if(n1 != null && n2 != null){
            n1.connect(n2);
            n2.connect(n1);
        }
        else{
            throw new IllegalArgumentException("Nodes " + name1 + ", " + name2 + " not found");
        }
    }

    public MapNode[] Bfs(MapNode start, MapNode finish){
        start.visited = true;
        Queue<MapNode> q = new LinkedList();
        q.add(start);

        ArrayList<MapNode> arr = new ArrayList();
        MapNode n,m,p;
        while(!q.isEmpty()){
            n = q.remove();
            while((m=n.getUnvisitedNeighbor()) != null){
                m.visited = true;
                m.parent = n;
                if(m.equals(finish)){
                    p = m;
                    arr.add(p);
                    while(p.parent != null && !p.equals(start)){
                        p = p.parent;
                        arr.add(p);
                    }
                    Collections.reverse(arr);
                    resetNodes();
                    return arr.toArray(new MapNode[0]);
                }
                q.add(m);
            }
        }
        resetNodes();
        return null;
    }

    private void resetNodes(){
        Iterator it = nodes.iterator();
        MapNode n;
        while(it.hasNext()){
            n = (MapNode)it.next();
            n.visited = false;
            n.parent = null;
        }
    }

    public int[] getPath(String start,String end){
        System.out.println("size " + paths.size());
        AbstractMap.SimpleEntry<Integer,Integer> pforward = new AbstractMap.SimpleEntry(start,end);
        AbstractMap.SimpleEntry<Integer,Integer> pbackward = new AbstractMap.SimpleEntry(end,start);

        MapNode[] nodes;
        if(paths.containsKey(pforward)){
            nodes = paths.get(pforward);
        }
        else if(paths.containsKey(pbackward)){
            MapNode[] arr = paths.get(pbackward);
            nodes = new MapNode[arr.length];
            for(int i = 0; i < arr.length; i++){
                nodes[i] = arr[arr.length - 1 - i];
            }
        }
        else{
            throw new IllegalArgumentException("Points not found");
        }
        int[] path = new int[nodes.length*2];
        for(int i = 0; i < nodes.length; i++){
            path[2*i] = nodes[i].getX();
            path[2*i+1] = nodes[i].getY();
        }
        return path;
    }

    public MapNode getNode(String name){
        Iterator it = nodes.iterator();
        while(it.hasNext()){
            MapNode n = (MapNode) it.next();
            if(n.getName() == name){
                return n;
            }
        }
        return null;
    }

    public static MapGraph getMap(){
        MapNode[] nodes = new MapNode[36];
        nodes[0] = new MapNode(775,40,"entrance0");
        nodes[1] = new MapNode(770,79,"entrance1");
        nodes[2] = new MapNode(686,157,"cars");
        nodes[3] = new MapNode(766,111,"firsthall0");
        nodes[4] = new MapNode(766,174,"firsthall1");
        nodes[5] = new MapNode(865,167,"baggage");
        nodes[6] = new MapNode(766,326,"firsthall2");
        nodes[7] = new MapNode(743,337,"bathroom0");
        nodes[8] = new MapNode(766,376,"firsthall3");
        nodes[9] = new MapNode(853,362,"checkin");
        nodes[10] = new MapNode(763,498,"firsthall4");
        nodes[11] = new MapNode(687,499,"shop0");
        nodes[12] = new MapNode(844,503,"food0");
        nodes[13] = new MapNode(782,684,"firsthall5");
        nodes[14] = new MapNode(902,605,"elevators");
        nodes[15] = new MapNode(791,751,"security0");
        nodes[16] = new MapNode(555,733,"security2");
        nodes[17] = new MapNode(784,832,"security1");
        nodes[18] = new MapNode(899,836,"securityoffice1");
        nodes[19] = new MapNode(883,303,"securityoffice0");
        nodes[20] = new MapNode(541,680,"secondhall0");
        nodes[21] = new MapNode(609,652,"bathroom1");
        nodes[22] = new MapNode(419,680,"secondhall1");
        nodes[23] = new MapNode(419,625,"food1");
        nodes[24] = new MapNode(295,678,"secondhall2");
        nodes[25] = new MapNode(200,678,"secondhall3");
        nodes[26] = new MapNode(163,620,"secondhall4");
        nodes[27] = new MapNode(66,613,"gate14");
        nodes[28] = new MapNode(80,717,"secondhall5");
        nodes[29] = new MapNode(69,783,"gate13");
        nodes[30] = new MapNode(171,736,"gates1");
        nodes[31] = new MapNode(186,814,"gate12");
        nodes[32] = new MapNode(366,805,"gate11");
        nodes[33] = new MapNode(411,737,"gates0");
        nodes[34] = new MapNode(487,806,"gate10");
        nodes[35] = new MapNode(293,631,"shop1");
        MapGraph m = new MapGraph(nodes);
        m.connect("entrance0","entrance1");
        m.connect("entrance1","firsthall0");
        m.connect("firsthall1","firsthall0");
        m.connect("cars","firsthall0");
        m.connect("cars","firsthall1");
        m.connect("firsthall1","baggage");
        m.connect("firsthall1","firsthall2");
        m.connect("firsthall2","bathroom0");
        m.connect("firsthall3","firsthall2");
        m.connect("firsthall3","checkin");
        m.connect("checkin","securityoffice0");
        m.connect("firsthall4","firsthall3");
        m.connect("firsthall4","shop0");
        m.connect("firsthall4","food0");
        m.connect("firsthall4","firsthall5");
        m.connect("firsthall5","elevators");
        m.connect("firsthall5","security0");
        m.connect("security0","security1");
        m.connect("securityoffice1","security1");
        m.connect("security1","security2");
        m.connect("security0","security2");
        m.connect("secondhall0","security2");
        m.connect("secondhall0","bathroom1");
        m.connect("secondhall0","secondhall1");
        m.connect("secondhall1","food1");
        m.connect("secondhall1","secondhall2");
        m.connect("secondhall1","gates0");
        m.connect("secondhall2","secondhall3");
        m.connect("secondhall2","shop1");
        m.connect("secondhall3","secondhall4");
        m.connect("secondhall4","gate14");
        m.connect("secondhall3","secondhall5");
        m.connect("secondhall5","gate13");
        m.connect("secondhall5","gates1");
        m.connect("gates1","gate12");
        m.connect("gates1","gates0");
        m.connect("gates1","gate11");
        m.connect("gates0","gate10");
        m.connect("gate12","gate11");
        m.createPaths();
        return m;
    }

    public static void main(String[] args){
        MapGraph m = MapGraph.getMap();
        try {
            ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(
                    "macleod-graph.dat"
            ));
            out.writeObject(m);

        }
        catch(IOException e){
            System.out.println(e);
            System.exit(1);
        }
    }
}
