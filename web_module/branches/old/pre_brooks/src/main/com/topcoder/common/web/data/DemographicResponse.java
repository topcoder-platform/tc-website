package com.topcoder.common.web.data;


import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public class DemographicResponse
        implements
        Cloneable
        , Serializable
        , TagRenderer
        , Modifiable {


    private int coderId;
    private int demographicQuestionId;
    private int demographicAnswerId;
    private String demographicResponseText;
    private String modified;

    public DemographicResponse() {
        coderId = 0;
        demographicQuestionId = 0;
        demographicAnswerId = 0;
        demographicResponseText = "";
        modified = "";
    }


    public boolean equals(Object other) {
        boolean result = false;
        DemographicResponse otherResponse = (DemographicResponse) other;
        if (
                demographicAnswerId == otherResponse.getDemographicAnswerId()
                && coderId == otherResponse.getCoderId()
                && demographicQuestionId == otherResponse.getDemographicQuestionId()
                && demographicResponseText.equals(otherResponse.getDemographicResponseText())
        ) {
            result = true;
        }
        return result;
    }


    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        DemographicResponse result = null;
        try {
            result = new DemographicResponse();
            result.setCoderId(getCoderId());
            result.setDemographicQuestionId(getDemographicQuestionId());
            result.setDemographicAnswerId(getDemographicAnswerId());
            result.setDemographicResponseText(getDemographicResponseText());
            result.setModified(getModified());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


// set
    public void setAllModifiedStable() throws Exception {
        setModified("S");
    }

    //Set
    public void setCoderId(int coderId) {
        this.coderId = coderId;
    }

    public void setDemographicQuestionId(int demographicQuestionId) {
        this.demographicQuestionId = demographicQuestionId;
    }

    public void setDemographicAnswerId(int demographicAnswerId) {
        this.demographicAnswerId = demographicAnswerId;
    }

    public void setDemographicResponseText(String demographicResponseText) {
        this.demographicResponseText = demographicResponseText;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }


    // Get
    public int getCoderId() {
        return coderId;
    }

    public int getDemographicQuestionId() {
        return demographicQuestionId;
    }

    public int getDemographicAnswerId() {
        return demographicAnswerId;
    }

    public String getDemographicResponseText() {
        return demographicResponseText;
    }

    public String getModified() {
        return modified;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("DemographicResponse");
            result.addTag(new ValueTag("CoderId", coderId));
            result.addTag(new ValueTag("DemographicQuestionId", demographicQuestionId));
            result.addTag(new ValueTag("DemographicAnswerId", demographicAnswerId));
            result.addTag(new ValueTag("DemographicResponseText", demographicResponseText));
            result.addTag(new ValueTag("Modified", modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.DemographicResponse:getXML:ERROR:\n" + e);
        }
        return result;
    }


}
