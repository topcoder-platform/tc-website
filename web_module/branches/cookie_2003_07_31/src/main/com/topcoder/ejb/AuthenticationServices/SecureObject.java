package com.topcoder.ejb.AuthenticationServices;


/**
 * This abstract class provides a security foundation for a user or group.
 *
 * @version  $Revision$
 */
public abstract class SecureObject implements java.io.Serializable {


    private String Modified;
    int SId;


    public SecureObject() {
        Modified = "";
        SId = 0;
    }


    /**
     * Set the secure object id.
     */
    public void setSId(int SId) {
        this.SId = SId;
    }

    /**
     * Set the modified flag (A)dd, (U)pdate, or (D)elete.
     */
    public void setModified(String Modified) {
        this.Modified = Modified;
    }


    /**
     * Get the secure object id.
     */
    public int getSId() {
        return SId;
    }

    /**
     * Get the modified flag (A)dd, (U)pdate, or (D)elete.
     */
    public String getModified() {
        return Modified;
    }



}

