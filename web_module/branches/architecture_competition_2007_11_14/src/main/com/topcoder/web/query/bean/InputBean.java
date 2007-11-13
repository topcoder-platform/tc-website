package com.topcoder.web.query.bean;

import java.io.Serializable;

public class InputBean implements Serializable {
    private long inputId;
    private String inputCode;
    private String inputDesc;
    private int dataTypeId;

    public InputBean() {
        setInputId(0);
        setInputCode("");
        setInputDesc("");
        setDataTypeId(0);
    }

    public long getInputId() {
        return inputId;
    }

    public void setInputId(long inputId) {
        this.inputId = inputId;
    }

    public String getInputCode() {
        return inputCode;
    }

    public void setInputCode(String inputCode) {
        this.inputCode = inputCode;
    }

    public String getInputDesc() {
        return inputDesc;
    }

    public void setInputDesc(String inputDesc) {
        this.inputDesc = inputDesc;
    }

    public int getDataTypeId() {
        return dataTypeId;
    }

    public void setDataTypeId(int dataTypeId) {
        this.dataTypeId = dataTypeId;
    }

    /**
     * if the input_id's are the same, then we'll call the
     * objects the same
     * @param o
     * @return
     */
    public boolean equals(Object o) {
        if (o instanceof QueryInputBean) {
            return ((QueryInputBean) o).getInputId() == this.getInputId() &&
                    ((QueryInputBean) o).getInputDesc().equals(this.getInputDesc()) &&
                    ((QueryInputBean) o).getDataTypeId() == this.getDataTypeId() &&
                    ((QueryInputBean) o).getInputCode().equals(this.getInputCode());
        } else {
            return false;
        }
    }
}
