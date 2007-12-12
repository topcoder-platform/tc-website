package com.topcoder.common.web.data;

/**
 * This class defines the levels of access given for a sector (secured resource).
 *
 * @version  $Revision$
 */
public final class AccessLevel implements java.io.Serializable {

    private int AccessLevelId;
    private String AccessLevelDescription;
    private String Modified;


    public AccessLevel() {
        AccessLevelId = 0;
        AccessLevelDescription = "";
        Modified = "";
    }


    public AccessLevel(int AccessLevelId, String AccessLevelDescription, String Modified) {
        this.AccessLevelId = AccessLevelId;
        this.AccessLevelDescription = AccessLevelDescription;
        this.Modified = Modified;
    }


    /**
     * Set the access level id.
     */
    public void setAccessLevelId(int AccessLevelId) {
        this.AccessLevelId = AccessLevelId;
    }

    /**
     * Set the description for the access level (for example: read, write...)
     */
    public void setAccessLevelDescription(String AccessLevelDescription) {
        this.AccessLevelDescription = AccessLevelDescription;
    }

    /**
     * Set the Modified flag: (A)dd, (U)pdate, (D)elete.
     */
    public void setModified(String Modified) {
        this.Modified = Modified;
    }


    /**
     * Get the access level id.
     */
    public int getAccessLevelId() {
        return AccessLevelId;
    }

    /**
     * Get the description for the access level (for example: read, write...)
     */
    public String getAccessLevelDescription() {
        return AccessLevelDescription;
    }

    /**
     * Get the Modified flag to determine status: (A)dd, (U)pdate, (D)elete.
     */
    public String getModified() {
        return Modified;
    }


}
