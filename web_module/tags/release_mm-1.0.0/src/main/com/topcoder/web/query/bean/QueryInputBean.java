package com.topcoder.web.query.bean;

import java.io.Serializable;

public class QueryInputBean implements Serializable {
    private long inputId;
    private long queryId;
    private String inputCode;
    private String inputDesc;
    private int dataTypeId;
    private boolean optional;
    private String defaultValue;
    private int sortOrder;

    public QueryInputBean() {
        setInputId(0);
        setQueryId(0);
        setInputCode("");
        setInputDesc("");
        setDataTypeId(0);
        setOptional(false);
        setDefaultValue("");
        setSortOrder(0);
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

    public long getQueryId() {
        return queryId;
    }

    public void setQueryId(long queryId) {
        this.queryId = queryId;
    }

    public boolean isOptional() {
        return optional;
    }

    public void setOptional(boolean optional) {
        this.optional = optional;
    }

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    public int getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }

    public boolean equals(Object o) {
        if (o instanceof QueryInputBean) {
            return ((QueryInputBean) o).getInputId() == this.getInputId() &&
                    ((QueryInputBean) o).getInputDesc().equals(this.getInputDesc()) &&
                    ((QueryInputBean) o).getDataTypeId() == this.getDataTypeId() &&
                    ((QueryInputBean) o).getInputCode().equals(this.getInputCode()) &&
                    ((QueryInputBean) o).getQueryId() == this.getQueryId() &&
                    ((QueryInputBean) o).isOptional() == this.isOptional() &&
                    ((QueryInputBean) o).getDefaultValue().equals(this.getDefaultValue()) &&
                    ((QueryInputBean) o).getSortOrder() == this.getSortOrder();
        } else {
            return false;
        }
    }
}
