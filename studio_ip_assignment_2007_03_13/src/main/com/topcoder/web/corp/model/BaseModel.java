package com.topcoder.web.corp.model;

public abstract class BaseModel implements java.io.Serializable {

    private boolean isNew;

    /** by default isNew is true */
    protected BaseModel() {
        isNew = true;
    }

    /**
     * Set the variable isNew
     *
     * @param val The value to set isNew to
     */
    public void setIsNew(boolean val) {
        isNew = val;
    }

    /**
     * Get the value of isNew
     *
     * @return boolean The value of isNew
     */
    public boolean getIsNew() {
        return isNew;
    }

    /**
     * Alternative method to retrieve the value of isNew
     * @return
     */
    public boolean isNew() {
        return isNew;
    }

}
