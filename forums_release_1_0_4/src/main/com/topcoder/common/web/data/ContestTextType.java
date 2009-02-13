package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;


public final class ContestTextType implements Serializable, TagRenderer {
    private String TextType;
    private String TextTypeDesc;

    public ContestTextType() {
        TextType = "";
        TextTypeDesc = "";
    }

// set
    public void setTextType(String TextType) {
        this.TextType = TextType;
    }

    public void setTextTypeDesc(String TextTypeDesc) {
        this.TextTypeDesc = TextTypeDesc;
    }

// get
    public String getTextType() {
        return TextType;
    }

    public String getTextTypeDesc() {
        return TextTypeDesc;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("ContestTextType");
            result.addTag(new ValueTag("TextType", TextType));
            result.addTag(new ValueTag("TextTypeDesc", TextTypeDesc));
        } catch (Exception e) {
            throw new Exception("common.web.data.ContestTextType getXML ERROR: " + e);
        }
        return result;
    }
}

