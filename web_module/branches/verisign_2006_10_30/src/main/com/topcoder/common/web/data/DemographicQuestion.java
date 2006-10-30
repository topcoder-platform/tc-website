package com.topcoder.common.web.data;


import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;


public class DemographicQuestion implements Serializable, TagRenderer, Cloneable {


    private int demographicQuestionId;
    private String demographicQuestionText;
    private String demographicQuestionDesc;
    private String selectable;
    private String exactQuery;
    private String choiceQuery;
    private ArrayList demographicAnswers;
    private DemographicResponse demographicResponse;


    public DemographicQuestion() {
        demographicQuestionId = 0;
        demographicQuestionText = "";
        demographicQuestionDesc = "";
        selectable = "";
        exactQuery = "";
        choiceQuery = "";
        demographicAnswers = new ArrayList();
        demographicResponse = new DemographicResponse();
    }


    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        DemographicQuestion result = null;
        try {
            result = new DemographicQuestion();
            result.setDemographicQuestionId(getDemographicQuestionId());
            result.setDemographicQuestionText(getDemographicQuestionText());
            result.setDemographicQuestionDesc(getDemographicQuestionDesc());
            result.setSelectable(getSelectable());
            result.setExactQuery(getExactQuery());
            result.setChoiceQuery(getChoiceQuery());
            ArrayList resultArray = result.getDemographicAnswers();
            int size = demographicAnswers.size();
            resultArray.ensureCapacity(size);
            for (int i = 0; i < size; i++) {
                DemographicAnswer answer = (DemographicAnswer) demographicAnswers.get(i);
                resultArray.add((DemographicAnswer) answer.clone());
            }
            result.setDemographicResponse((DemographicResponse) getDemographicResponse().clone());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    //Set
    public void setDemographicQuestionId(int demographicQuestionId) {
        this.demographicQuestionId = demographicQuestionId;
    }

    public void setDemographicQuestionText(String demographicQuestionText) {
        this.demographicQuestionText = demographicQuestionText;
    }

    public void setDemographicQuestionDesc(String demographicQuestionDesc) {
        this.demographicQuestionDesc = demographicQuestionDesc;
    }

    public void setDemographicAnswers(ArrayList demographicAnswers) {
        this.demographicAnswers = demographicAnswers;
    }

    public void setSelectable(String selectable) {
        this.selectable = selectable;
    }

    public void setExactQuery(String exactQuery) {
        this.exactQuery = exactQuery;
    }

    public void setChoiceQuery(String choiceQuery) {
        this.choiceQuery = choiceQuery;
    }

    public void setDemographicResponse(DemographicResponse demographicResponse) {
        this.demographicResponse = demographicResponse;
    }


    // Get
    public int getDemographicQuestionId() {
        return demographicQuestionId;
    }

    public String getDemographicQuestionText() {
        return demographicQuestionText;
    }

    public String getDemographicQuestionDesc() {
        return demographicQuestionDesc;
    }

    public ArrayList getDemographicAnswers() {
        return demographicAnswers;
    }

    public String getSelectable() {
        return selectable;
    }

    public String getExactQuery() {
        return exactQuery;
    }

    public String getChoiceQuery() {
        return choiceQuery;
    }

    public DemographicResponse getDemographicResponse() {
        return demographicResponse;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("DemographicQuestion");
            result.addTag(new ValueTag("DemographicQuestionId", demographicQuestionId));
            result.addTag(new ValueTag("DemographicQuestionText", demographicQuestionText));
            result.addTag(new ValueTag("DemographicQuestionDesc", demographicQuestionDesc));
            result.addTag(RecordTag.getListXML("DemographicAnswers", demographicAnswers));
            result.addTag(new ValueTag("Selectable", selectable));
            result.addTag(new ValueTag("ExactQuery", exactQuery));
            result.addTag(new ValueTag("ChoiceQuery", choiceQuery));
            result.addTag(demographicResponse.getXML());
        } catch (Exception e) {
            throw new Exception("common.web.data.DemographicQuestion:getXML:ERROR:\n" + e);
        }
        return result;
    }


}
