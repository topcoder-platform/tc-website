package com.topcoder.web.ep.util;

/**
 * Simple representation of the report's row
 * 
 * @author Pablo
 */
public class SystemTestRow {
    private String args;
    private String expected;
    private Boolean succeeded;
    
    
    public SystemTestRow() {
        super();
    }

    public SystemTestRow(String args, String expected, Boolean succeeded) {
        super();
        this.args = args;
        this.expected = expected;
        this.succeeded = succeeded;
    }
    
    public String getArgs() {
        return args;
    }
    public void setArgs(String args) {
        this.args = args;
    }
    public String getExpected() {
        return expected;
    }
    public void setExpected(String expected) {
        this.expected = expected;
    }
    public Boolean getSucceeded() {
        return succeeded;
    }
    public void setSucceeded(Boolean succeeded) {
        this.succeeded = succeeded;
    }
}
