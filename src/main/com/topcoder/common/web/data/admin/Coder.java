package com.topcoder.common.web.data.admin;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;

public final class Coder implements Serializable, TagRenderer {

    private int coderId;
    private String handle;

    public Coder() {
        this.coderId = 0;
        this.handle = "";
    }

// set

    public void setCoderId(int coderId) {
        this.coderId = coderId;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

// get

    public int getCoderId() {
        return this.coderId;
    }

    public String getHandle() {
        return this.handle;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Coder");
            result.addTag(new ValueTag("CoderId", coderId));
            result.addTag(new ValueTag("Handle", handle));

        } catch (Exception e) {
            throw e;
        }
        return result;
    }

}

