package com.topcoder.common.web.data;


import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;

import java.io.Serializable;
import java.util.ArrayList;


public final class RegionState
        implements Serializable, Cloneable, TagRenderer {


    private UserType UserType;
    private Region Region;
    private ArrayList States;


    public RegionState() {
        UserType = new UserType();
        States = new ArrayList(60);
        Region = new Region();
    }


    // set methods
    public void setUserType(UserType UserType) {
        this.UserType = UserType;
    }

    public void setRegion(Region Region) {
        this.Region = Region;
    }

    public void setStates(ArrayList States) {
        this.States = States;
    }


    // get methods
    public UserType getUserType() {
        return UserType;
    }

    public Region getRegion() {
        return Region;
    }

    public ArrayList getStates() {
        return States;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("RegionState");
            result.addTag(Region.getXML());
            result.addTag(RecordTag.getListXML("States", States));
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.web.data.RegionState:getXML:ERROR:" + e.getMessage());
        }
        return result;
    }


}
