package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;

// Version:  1.0
// Date:  04/12/2000

public final class ContestText implements Serializable, TagRenderer {
    private int ContestId;
    private ContestTextType TextType;
    private String Text;
    private String Modified;


    public ContestText() {
        ContestId = 0;
        TextType = new ContestTextType();
        Text = "";
        Modified = "";
    }

// set
    public void setContestId(int ContestId) {
        this.ContestId = ContestId;
    }

    public void setTextType(ContestTextType TextType) {
        this.TextType = TextType;
    }

    public void setText(String Text) {
        this.Text = Text;
    }

    public void setModified(String Modified) {
        this.Modified = Modified;
    }

// get
    public int getContestId() {
        return ContestId;
    }

    public ContestTextType getTextType() {
        return TextType;
    }

    public String getText() {
        return Text;
    }

    public String getModified() {
        return Modified;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("ContestText");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(TextType.getXML());
            result.addTag(new ValueTag("Text", Text));
            result.addTag(new ValueTag("Modified", Modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.ContestText getXML ERROR: " + e);
        }
        return result;
    }
}

