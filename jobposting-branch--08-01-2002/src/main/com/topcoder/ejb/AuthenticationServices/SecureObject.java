package com.topcoder.ejb.AuthenticationServices;


/**
 * This abstract class provides a security foundation for a user or group.
 *
 * @version  $Revision$
 *  Log of Changes:
 */
public abstract class SecureObject implements java.io.Serializable {


    private int SId;
    private String SIdType;
    private String Modified;
    private java.util.ArrayList Permissions;


    public SecureObject() {
        SId = 0;
        SIdType = "";
        Modified = "";
        Permissions = new java.util.ArrayList();
    }


    /**
     * Set the secure object id.
     */
    public void setSId(int SId) {
        this.SId = SId;
    }

    /**
     * Set the secure object type (G)roup or (U)ser.
     */
    public void setSIdType(String SIdType) {
        this.SIdType = SIdType;
    }

    /**
     * Set the modified flag (A)dd, (U)pdate, or (D)elete.
     */
    public void setModified(String Modified) {
        this.Modified = Modified;
    }

    /**
     * Set the list of permissions to security sectors for the secure object.
     */
    public void setPermissions(java.util.ArrayList Permissions) {
        this.Permissions = Permissions;
    }


    /**
     * Get the secure object id.
     */
    public int getSId() {
        return SId;
    }

    /**
     * Get the secure object type (G)roup or (U)ser.
     */
    public String getSIdType() {
        return SIdType;
    }

    /**
     * Get the modified flag (A)dd, (U)pdate, or (D)elete.
     */
    public String getModified() {
        return Modified;
    }

    /**
     * Get the list of permissions to security sectors for the secure object.
     */
    public java.util.ArrayList getPermissions() {
        return Permissions;
    }


}

