package com.topcoder.common.web.data;


/**
 * This class defines the login credentials and the success or failure of a login attempt.
 * If the UserId is > 0, the login was deemed successful, otherwise the Attempts are
 * incremented and the Lockout could be set to true for a certain number of unsuccessful attempts.
 *
 * @version  $Revision$
 */
public final class Authentication implements java.io.Serializable {


    private Integer UserId;
    private String Status;
    private String Email;
    private String ActivationCode;
    private String Handle;
    private String Password;
    private int Attempts;
    private boolean Lockout;


    public Authentication() {
        UserId = new Integer(0);
        Status = "";
        Email = "";
        ActivationCode = "";
        Handle = "";
        Password = "";
        Attempts = 0;
        Lockout = false;
    }


    /**
     * Sets the UserId for the user attempting to login.
     */
    public void setUserId(int UserId) {
        this.UserId = new Integer(UserId);
    }

    /**
     * Sets the Status for the user attempting to login.
     * "I" or "0" inactive account, no description.
     * "A" or "1" active account.
     * "U" or "2" unactivated account, user has not yet used activation code.
     * "4" member requested to be removed.
     * "5" duplicate account, removed.
     * "6" confirmed cheater, removed.
     * "9" never activated and disabled.
     *
     */
    public void setStatus(String Status) {
        this.Status = Status;
    }

    /**
     * Set the email address of the user attempting to login.
     */
    public void setEmail(String Email) {
        this.Email = Email;
    }

    /**
     * Set the activation code of the user attempting to login.
     * The activation code is the code created during the initial
     * registration, and emailed to the user to activate their
     * member account.
     */
    public void setActivationCode(String ActivationCode) {
        this.ActivationCode = ActivationCode;
    }

    /**
     * Set the handle (user name) of the user attempting to login.
     */
    public void setHandle(String Handle) {
        this.Handle = Handle;
    }

    /**
     * Set the password of the user attempting to login.
     */
    public void setPassword(String Password) {
        this.Password = Password;
    }

    /**
     * Set the number of login attempts for the user.
     */
    public void setAttempts(int Attempts) {
        this.Attempts = Attempts;
    }

    /**
     * Set the Lockout status for this series of login attempts.
     */
    public void setLockout(boolean Lockout) {
        this.Lockout = Lockout;
    }


    /**
     * Get the user id of the user attempting to login.
     */
    public Integer getUserId() {
        return UserId;
    }

    /**
     * Gets the Status for the user attempting to login.
     * "I" or "0" inactive account, no description.
     * "A" or "1" active account.
     * "U" or "2" unactivated account, user has not yet used activation code.
     * "4" member requested to be removed.
     * "5" duplicate account, removed.
     * "6" confirmed cheater, removed.
     * "9" never activated and disabled.
     */
    public String getStatus() {
        return Status;
    }

    /**
     * Get the email of the user attempting to login.
     */
    public String getEmail() {
        return Email;
    }

    /**
     * Get the activation code of the user attempting to login.
     * The activation code is the code created during the initial
     * registration, and emailed to the user to activate their
     * member account.
     */
    public String getActivationCode() {
        return ActivationCode;
    }

    /**
     * Get the handle (user name) of the user attempting to login.
     */
    public String getHandle() {
        return Handle;
    }

    /**
     * Get the password of the user attempting to login.
     */
    public String getPassword() {
        return Password;
    }

    /**
     * Get the number of login attempts made by this session.
     */
    public int getAttempts() {
        return Attempts;
    }

    /**
     * Get the lockout status of this session of login attempts.
     */
    public boolean getLockout() {
        return Lockout;
    }


}

