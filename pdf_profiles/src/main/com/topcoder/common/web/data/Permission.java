package com.topcoder.common.web.data;

import com.topcoder.common.web.data.AccessLevel;


/**
 * This class represents a Permission for a given
 * Secure Object (User or Group) to a secured Sector at a given AccessLevel.
 * @version  $Revision$
 */
public class Permission implements java.io.Serializable {


    private int SId;
    private Sector Sector;
    private AccessLevel AccessLevel;
    private String Modified;


    public Permission() {
        SId = 0;
        Sector = new Sector();
        AccessLevel = new AccessLevel();
        Modified = "";
    }


    /**
     * Set the secure object id (for the Group or User assigned the permission).
     */
    public void setSId(int SId) {
        this.SId = SId;
    }

    /**
     * Set the secured sector.
     */
    public void setSector(Sector Sector) {
        this.Sector = Sector;
    }

    /**
     * Set the access level to the sector.
     */
    public void setAccessLevel(AccessLevel AccessLevel) {
        this.AccessLevel = AccessLevel;
    }

    /**
     * Set the modified flag for the status of the Permission (A)dd, (U)pdate, or (D)elete.
     */
    public void setModified(String Modified) {
        this.Modified = Modified;
    }


    /**
     * Get the secure object id (for the Group or User assigned the permission).
     */
    public int getSId() {
        return SId;
    }

    /**
     * Get the secured sector.
     */
    public Sector getSector() {
        return Sector;
    }

    /**
     * Get the access level to the sector.
     */
    public AccessLevel getAccessLevel() {
        return AccessLevel;
    }

    /**
     * Get the modified flag for the status of the Permission (A)dd, (U)pdate, or (D)elete.
     */
    public String getModified() {
        return Modified;
    }


}

