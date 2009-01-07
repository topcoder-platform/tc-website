/*
 * GraphData.java
 *
 * Created on June 1, 2005, 2:02 PM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.corp.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rfairfax
 */
public class GraphData implements java.io.Serializable {
    
    /** Creates a new instance of GraphData */
    public GraphData() {
    }
    
    private List colors = new ArrayList();
    private List data = new ArrayList();
    private List legend = new ArrayList();
    private int annotation = -1;
    
    public List getColors() {
        return colors;
    }
    
    public List getLegend() {
        return legend;
    }
    
    public List getData() {
        return data;
    }
    
    public int getAnnotation() {
        return annotation;
    }
    
    public void setAnnotation(int i ) {
        annotation = i;
    }

    public void addItem(String color, int value, String l) {
        colors.add(color);
        data.add(new Integer(value));
        legend.add(l);
    }
}
