package com.topcoder.web.corp.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * <p>
 * This is the model for candidate information.  Currently, candidate
 * info consists of user id, email address, and password. Also, if the
 * data contained is for a new candidate, isNew is true, else it isNew
 * should be false.
 * </p>
 *
 * @author Grimicus
 * @version 1.0
 */
public class CandidateInfo extends BaseModel {
    private String userName;
    private String password;
    private Long userId;
    private String referrer;
    private int preference;

    /** Holds value of property noteList. */
    private ResultSetContainer noteList;

    public CandidateInfo() {
        userName = "";
        password = "";
        referrer = "";
        preference = 0;
    }

    /**
     * Sets the value of <code>userName</code>.
     *
     * @param val
     */
    public void setUserName(String val) {
        userName = val;
    }

    public void setPreference(int p) {
        preference = p;
    }

    public int getPreference() {
        return preference;
    }

    /**
     * Gets the value of <code>userName</code>.
     *
     * @return
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Sets the value of <code>password</code>.
     *
     * @param val
     */
    public void setPassword(String val) {
        password = val;
    }

    /**
     * Gets the value of <code>password</code>.
     *
     * @return
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets the value of <code>userId</code>.
     *
     * @param val
     */
    public void setUserId(Long val) {
        userId = val;
    }

    /**
     * Gets the value of <code>userId</code>.
     *
     * @return
     */
    public Long getUserId() {
        return userId;
    }

    /**
     * Sets the value of <code>referrer</code>.
     *
     * @param val
     */
    public void setReferrer(String val) {
        referrer = val;
    }

    /**
     * Gets the value of <code>referrer</code>.
     *
     * @return
     */
    public String getReferrer() {
        return referrer;
    }

    /** Getter for property noteList.
     * @return Value of property noteList.
     */
    public ResultSetContainer getNoteList() {
        return this.noteList;
    }

    /** Setter for property noteList.
     * @param noteList New value of property noteList.
     */
    public void setNoteList(ResultSetContainer noteList) {
        this.noteList = noteList;
    }

}
