package com.topcoder.web.privatelabel.model;

import com.topcoder.web.privatelabel.Constants;

import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

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
        Collections.sort(list);
        return list;
    }

    public void removeResponses(long questionId) {
        for (int i=0; i<responses.size(); i++) {
            if (((DemographicResponse) responses.get(i)).getQuestionId()==questionId) {
                responses.remove(i);
            }
        }
    }

    public void addResponse(DemographicResponse response) {
        responses.add(response);
    }

    public boolean hasResponse(long questionId) {
        boolean found = false;
        for (int i=0; i<responses.size()&&!found; i++) {
            found = ((DemographicResponse) responses.get(i)).getQuestionId()==questionId;
        }
        return found;
    }

}
