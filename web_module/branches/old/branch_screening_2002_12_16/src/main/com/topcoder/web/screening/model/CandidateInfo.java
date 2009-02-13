package com.topcoder.web.screening.model;

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
    private String emailAddress;
    private String password;
    private Long userId;
    private String referrer;

    /** Holds value of property noteList. */
    private ResultSetContainer noteList;
    
    public CandidateInfo() {
        emailAddress = "";
        password = "";
        referrer = "";
    }

    /**
     * Sets the value of <code>emailAddress</code>.
     *
     * @param emailAddress
     */
    public void setEmailAddress( String val ) {
        emailAddress = val;
    }

    /**
     * Gets the value of <code>emailAddress</code>.
     *
     * @return 
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * Sets the value of <code>password</code>.
     *
     * @param password
     */
    public void setPassword( String val ) {
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
     * @param userId
     */
    public void setUserId( Long val ) {
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
     * @param referrer
     */
    public void setReferrer( String val )
    {
        referrer = val;
    }

    /**
     * Gets the value of <code>referrer</code>.
     *
     * @return 
     */
    public String getReferrer()
    {
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
