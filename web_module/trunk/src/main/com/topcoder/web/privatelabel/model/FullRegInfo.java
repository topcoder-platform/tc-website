package com.topcoder.web.privatelabel.model;

import com.topcoder.web.privatelabel.Constants;

import java.util.List;
import java.util.ArrayList;

public class FullRegInfo extends SimpleRegInfo {

    private int coderType;
    private List responses;

    public FullRegInfo() {
        responses = new ArrayList();
    }

    public FullRegInfo(SimpleRegInfo info) {
        super(info);
        responses = new ArrayList();
    }

    public int getCoderType() {
        return coderType;
    }

    public void setCoderType(int coderType) {
        this.coderType = coderType;
    }

    public boolean isStudent() {
        return coderType==Constants.STUDENT;
    }

    public boolean isProfessional() {
        return coderType==Constants.PROFESSIONAL;
    }

    public List getResponses() {
        List list = null;
        if (responses!=null) {
            list = new ArrayList(responses.size());
            for (int i=0; i<responses.size(); i++) {
                list.add(((DemographicResponse)responses.get(i)).clone());
            }
        }
        return list;
    }

    public void setResponses(List responses) {
        this.responses = responses;
    }
}
