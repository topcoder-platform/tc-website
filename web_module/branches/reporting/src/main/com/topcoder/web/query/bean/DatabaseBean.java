package com.topcoder.web.query.bean;

import java.io.Serializable;

public class DatabaseBean implements Serializable {
    private String value;
    private String displayName;

    public DatabaseBean() {
        setValue("");
        setDisplayName("");
    }

    public DatabaseBean(String value, String displayName) {
        setValue(value);
        setDisplayName(displayName);
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String toString() {
        return displayName;
    }

}

