package com.topcoder.web.screening.model;

/** 
 * <p>
 * This is the model for candidate information.  Currently, candidate
 * info consists of email address and password.
 * </p>
 *
 * @author Dan Tomalesky (grim@xynesis.com)
 * @version 1.0
 */
public class CandidateInfo implements java.io.Serializable
{
    private String emailAddress;
    private String password;
    private Long candidateId;

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
     * Sets the value of <code>candidateId</code>.
     *
     * @param candidateId
     */
    public void setCandidateId( Long val )
    {
        candidateId = val;
    }

    /**
     * Gets the value of <code>candidateId</code>.
     *
     * @return 
     */
    public Long getCandidateId()
    {
        return candidateId;
    }

}
