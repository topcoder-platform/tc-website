/*
 * DemographicModel.java
 *
 * Created on July 14, 2004, 10:56 AM
 */

package com.topcoder.web.corp.model;

import java.util.*;

/**
 *
 * @author  rfairfax
 */
public class DemographicModel extends BaseModel {
    
    /** Creates a new instance of DemographicModel */
    public DemographicModel() {
        campaignName = "";
        studentCount = 0;
        proCount = 0;
    }
    
    private String campaignName;
    private int studentCount;
    private int proCount;
    private Map studentDemoInfo;
    private Map proDemoInfo;
    
    public void setCampaignName(String s) {
        campaignName = s;
    }
    
    public String getCampaignName() {
        return campaignName;
    }
    
    public void setStudentCount(int i) {
        studentCount = i;
    }
    
    public void setProCount(int i) {
        proCount = i;
    }
    
    public int getStudentCount() {
        return studentCount;
    }
    
    public int getProCount() {
        return proCount;
    }
    
    public void setStudentDemoInfo(Map h) {
        studentDemoInfo = h;
    }
    
    public void setProDemoInfo(Map h) {
        proDemoInfo = h;
    }
    
    public Map getStudentDemoInfo() {
        return studentDemoInfo;
    }
    
    public Map getProDemoInfo() {
        return proDemoInfo;
    }
    
}
