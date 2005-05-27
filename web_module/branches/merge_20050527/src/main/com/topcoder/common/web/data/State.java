package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;

public final class State
        implements Serializable, Cloneable, TagRenderer, QueryCriteria {

    public static int NO = 0;
    public static int YES = 1;

    private String stateCode;
    private String stateName;
    private int demographicDecline;

    public State() {
        stateCode = "";
        stateName = "";
        demographicDecline = NO;
    }

    public boolean equals(Object obj) {
        boolean result = false;
        State other = (State) obj;
        if (
                this.getStateCode().equals(other.getStateCode())
                && this.getStateName().equals(other.getStateName())
        ) {
            result = true;
        }
        return result;
    }

    public ArrayList getCriteria(Object obj) {
        ArrayList result = new ArrayList(2);
        State other = (State) obj;
        if (!this.getStateCode().equals(other.getStateCode())) {
            String[] criteria = {"String", "state", "state_code", this.getStateCode()};
            result.add(criteria);
        }
        if (!this.getStateName().equals(other.getStateName())) {
            String[] criteria = {"String", "state", "state_name", this.getStateName()};
            result.add(criteria);
        }
        if (this.getDemographicDecline() == other.getDemographicDecline()) {
            String[] criteria = {"int", "state", "demographic_decline", Integer.toString(this.getDemographicDecline())};
            result.add(criteria);
        }
        result.trimToSize();
        return result;
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        State result = null;
        try {
            result = new State();
            result.setStateCode(getStateCode());
            result.setStateName(getStateName());
            result.setDemographicDecline(getDemographicDecline());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // set methods
    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public void setDemographicDecline(int demographicDecline) {
        this.demographicDecline = demographicDecline;
    }

    // get methods
    public String getStateCode() {
        return stateCode;
    }

    public String getStateName() {
        return stateName;
    }

    public int getDemographicDecline() {
        return demographicDecline;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = getXML("State");
        } catch (Exception e) {
            throw new Exception("common.web.data.State:getXML:ERROR:" + e);
        }
        return result;
    }

    public RecordTag getXML(String name) throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag(name);
            result.addTag(new ValueTag("StateCode", stateCode));
            result.addTag(new ValueTag("StateName", stateName));
            result.addTag(new ValueTag("DemographicDecline", demographicDecline));
        } catch (Exception e) {
            throw new Exception("common.web.data.State:getXML(name):ERROR:" + e);
        }
        return result;
    }


}
