package com.topcoder.common.web.data.report;

import java.io.Serializable;

/** Holds a parameter for a query
 *  @author Greg Paul
 *  @version $Revision$
 *
 */
public class Parameter implements Serializable {

    private String columnName;
    private String displayName;
    private String value;

    public Parameter() {
        columnName = new String();
        displayName = new String();
        value = new String();
    }

    public Parameter(String columnName, String displayName) {
        this.columnName = columnName;
        this.displayName = displayName;
        this.value = new String();
    }

    public Parameter(String columnName, String displayName, String value) {
        this.columnName = columnName;
        this.displayName = displayName;
        this.value = value;
    }

    public Parameter(String columnName, String displayName, int value) {
        this.columnName = columnName;
        this.displayName = displayName;
        this.value = String.valueOf(value);
    }

    //sets
    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public void setValue(int value) {
        this.value = String.valueOf(value);
    }

    //gets
    public String getColumnName() {
        return columnName;
    }

    public String getDisplayName() {
        return displayName;
    }

    public String getValue() {
        return value;
    }

    public String toString() {
        return columnName;
    }

}
