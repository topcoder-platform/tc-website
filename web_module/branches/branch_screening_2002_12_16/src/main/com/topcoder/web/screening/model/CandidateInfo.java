package com.topcoder.web.screening.model;

/** 
 * <p>
 * This is the model for candidate information.  Currently, candidate
 * info consists of user id, email address, and password. Also, if the
 * data contained is for a new candidate, isNew is true, else it isNew 
 * should be false.
 * </p>
 *
 * @author Dan Tomalesky (grim@xynesis.com)
 * @version 1.0
 */
public class CandidateInfo implements java.io.Serializable
{
    private String emailAddress;
    private String password;
    private Long userId;
    private boolean isNew;

    public CandidateInfo()
    {
        emailAddress = "";
        password = "";
        isNew = true;
    }

    /** 
     * Set the variable isNew 
     *
     * @param val The value to set isNew to
     */
    public void setIsNew(boolean val)
    {
        isNew = val;
    }

    /** 
     * Get the value of isNew
     *
     * @return boolean The value of isNew
     */
    public boolean getIsNew()
    {
        return isNew;
    }

    /** 
     * Alternative method to retrieve the value of isNew
     * @return 
     */
    public boolean isNew()
    {
        return isNew;
    }

    /**
     * Sets the value of <code>emailAddress</code>.
     *
     * @param emailAddress
     */
    public void setEmailAddress( String val )
    {
        emailAddress = val;
    }

    /**
     * Gets the value of <code>emailAddress</code>.
     *
     * @return 
     */
    public String getEmailAddress()
    {
        return emailAddress;
    }

    /**
     * Sets the value of <code>password</code>.
     *
     * @param password
     */
    public void setPassword( String val )
    {
        password = val;
    }

    /**
     * Gets the value of <code>password</code>.
     *
     * @return 
     */
    public String getPassword()
    {
        return password;
    }

    /**
     * Sets the value of <code>userId</code>.
     *
     * @param userId
     */
    public void setUserId( Long val )
    {
        userId = val;
    }

    /**
     * Gets the value of <code>userId</code>.
     *
     * @return 
     */
    public Long getUserId()
    {
        return userId;
    }

}
