package com.topcoder.common.web.data.report;

public class StringResult extends ResultItem {

    String value;

    public StringResult() {
        value = new String();
    }

    public StringResult(String value) {
        this.value = value;
    }


    public String getString() {
        return value;
    }

    public void setString() {
        this.value = value;
    }

    public int compareTo(Object other) {
        return this.toString().compareToIgnoreCase(other.toString());
    }

    public int getType() {
        return ResultItem.STRING;
    }

    public String toString() {
        return value;
    }

}
