package com.topcoder.common.web.data;


/**
 * This class represents a secured sector (an area or resource that needs to be secured).
 *
 * @version  $Revision$
 */
public class Sector implements java.io.Serializable {

    private int SectorId;
    private String SectorDesc;
    private String Modified;

    public Sector() {
        SectorId = 0;
        SectorDesc = "";
        Modified = "";
    }

    public Sector(int SectorId, String SectorDesc, String Modified) {
        this.SectorId = SectorId;
        this.SectorDesc = SectorDesc;
        this.Modified = Modified;
    }

    /**
     * Set the secure object id.
     */
    public void setSectorId(int SectorId) {
        this.SectorId = SectorId;
    }

    /**
     * Set the descriptive name for the secure object.
     */
    public void setSectorDesc(String SectorDesc) {
        this.SectorDesc = SectorDesc;
    }

    /**
     * Set the Modified flag: (A)dd, (U)pdate, (D)elete.
     */
    public void setModified(String Modified) {
        this.Modified = Modified;
    }


    /**
     * Get the secure object id.
     */
    public int getSectorId() {
        return SectorId;
    }

    /**
     * Get the descriptive name for the secure object.
     */
    public String getSectorDesc() {
        return SectorDesc;
    }

    /**
     * Get the Modified flag: (A)dd, (U)pdate, (D)elete.
     */
    public String getModified() {
        return Modified;
    }


}

