package com.topcoder.web.tc.controller.legacy.stat.bean;

/**
 * This class represents a bean holding the QuickStat display name and url.  It serves as a container for an
 * item in quick stat drop-down list.
 *
 *
 * @author tbone
 * @version $Revision$
 */
public class QuickStatBean {
    //generic mapping
    private String msDisplayName;
    private String msURL;

    public QuickStatBean() {
        msDisplayName = "";
        msURL = "";
    }

    public QuickStatBean(String sKey, String sVal) {
        msDisplayName = sKey;
        msURL = sVal;
    }

    /**
     * Gets the URL for this QuickStat bean
     * @param none
     * @return the URL
     */
    public String getURL() {
        return msURL;
    }


    /**
     * Sets the specific URL for this QuickStat bean
     * @param String  The URL
     * @return none
     */
    public void setURL(String sURL) {
        msURL = sURL;
    }

    /**
     * Gets the Display Name for this QuickStat bean
     * @param none
     * @return the Display Name
     */
    public String getDisplayName() {
        return msDisplayName;
    }


    /**
     * Sets the Displayed Name for this QuickStat bean
     * @param String  The Display Name
     * @return none
     */
    public void setDipslayName(String sName) {
        msDisplayName = sName;
    }
}
