package com.topcoder.dde.user;

import java.io.Serializable;
import java.util.Date;

/**
 * Encapsulates all of the information about a user: id, last logon time, number of logins,
 * status, RegistrationInfo.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class User implements Serializable {

    private long id;
    private Date lastLogonTime;
    private int numLogins;
    private long status;
    private RegistrationInfo regInfo;

    /* this empty constructor is just for skeleton classes, testing,
     * should eventually be removed. --- actually, may need it, wait on that */
    public User() {
    }

    public User(long id) {
        this.id = id;
    }

    //Lots of standard getter and setter methods

    /**
     * Get the user's id.  This id is the primary key tied to this user in the database,
     * login_id in our case.
     *
     * @return The long id
     */
    public long getId() {
        return id;
    }

    /**
     * Get the user's last logon date/time.
     *
     * @return A Date object
     */
    public Date getLastLogonTime() {
        return lastLogonTime;
    }

    /**
     * Set user's last logon time.
     *
     * @param lastLogonTime
     */
    public void setLastLogonTime(Date lastLogonTime) {
        this.lastLogonTime = lastLogonTime;
    }

    /**
     * Get the number of times a user has logged in.
     *
     * @return numLogins
     */
    public int getNumLogins() {
        return numLogins;
    }

    /**
     * Set the number of times this user has logged in
     *
     * @param numLogins
     */
    public void setNumLogins(int numLogins) {
        this.numLogins = numLogins;
    }

    /**
     * Get a user's status
     *
     * @return The long representing that status
     */
    public long getStatus() {
        return status;
    }

    /**
     * Set this user's status
     *
     * @param status
     */
    public void setStatus(long status) {
        this.status = status;
    }

    /**
     * Get this user's RegistrationInfo
     *
     * @return a RegistrationInfo object
     */
    public RegistrationInfo getRegInfo() {
        return regInfo;
    }

    /**
     * Set this user's RegistrationInfo
     *
     * @param regInfo
     */
    public void setRegInfo(RegistrationInfo regInfo) {
        this.regInfo = regInfo;
    }
}
