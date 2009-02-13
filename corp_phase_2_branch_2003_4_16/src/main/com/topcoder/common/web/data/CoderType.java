package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public class CoderType implements Cloneable, Serializable, TagRenderer {


    private int coderTypeId;
    private String coderTypeDesc;
    private String status;


    public CoderType() {
        coderTypeId = 0;
        coderTypeDesc = "";
        status = "";
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        CoderType result = null;
        try {
            result = new CoderType();
            result.setCoderTypeId(getCoderTypeId());
            result.setCoderTypeDesc(getCoderTypeDesc());
            result.setStatus(getStatus());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    //Set
    public void setCoderTypeId(int coderTypeId) {
        this.coderTypeId = coderTypeId;
    }

    public void setCoderTypeDesc(String coderTypeDesc) {
        this.coderTypeDesc = coderTypeDesc;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    // Get
    public int getCoderTypeId() {
        return coderTypeId;
    }

    public String getCoderTypeDesc() {
        return coderTypeDesc;
    }

    public String getStatus() {
        return status;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("CoderType");
            result.addTag(new ValueTag("CoderTypeId", coderTypeId));
            result.addTag(new ValueTag("CoderTypeDesc", coderTypeDesc));
            result.addTag(new ValueTag("Status", status));
        } catch (Exception e) {
            throw new Exception("common.web.data.CoderType:getXML:ERROR:\n" + e);
        }
        return result;
    }


}
