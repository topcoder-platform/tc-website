package com.topcoder.common.web.data;

import com.topcoder.common.web.data.PermissionAssignee;
import com.topcoder.common.web.data.SecureObject;


/**
 * This class represents a user (type of secure object) of the system.
 *
 * @version  $Revision$
 */
public class User extends SecureObject implements java.io.Serializable, PermissionAssignee, Cloneable {


    private String Handle;
    private String Password;
    private String ConfirmPassword;
    private String Status;
    private String Email;
    private java.util.ArrayList Groups;
    private UserType DefaultUserType;
    private java.util.HashMap UserTypeDetails;
    private String LoggedIn;
    private String Terms;


    public User() {
        super();
        Handle = "";
        Password = "";
        ConfirmPassword = "";
        Status = "";
        Email = "";
        Groups = new java.util.ArrayList();
        DefaultUserType = new UserType();
        UserTypeDetails = new java.util.HashMap(4);
        LoggedIn = "";
        Terms = "";
    }


    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        User result = null;
        try {
            result = new User();
            result.setUserId(getUserId());
            result.setModified(getModified());
            result.setHandle(getHandle());
            result.setPassword(getPassword());
            result.setConfirmPassword(getConfirmPassword());
            result.setStatus(getStatus());
            result.setEmail(getEmail());
            result.setGroups((java.util.ArrayList) getGroups().clone());
            result.setDefaultUserType((UserType) getDefaultUserType().clone());
            result.setUserTypeDetails((java.util.HashMap) getUserTypeDetails().clone());
            result.setLoggedIn(getLoggedIn());
            result.setTerms(getTerms());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    /**
     * Set the user id (secure object id).
     */
    public void setUserId(int UserId) {
        super.setSId(UserId);
    }

    /**
     * Set the handle (user name).
     */
    public void setHandle(String Handle) {
        this.Handle = Handle;
    }

    /**
     * Set the password.
     */
    public void setPassword(String Password) {
        this.Password = Password;
    }

    /**
     * Set the confirm password.
     */
    public void setConfirmPassword(String ConfirmPassword) {
        this.ConfirmPassword = ConfirmPassword;
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
     * Set the user's email address.
     */
    public void setEmail(String Email) {
        this.Email = Email;
    }

    /**
     * Set the list of groups the user belongs to.
     */
    public void setGroups(java.util.ArrayList Groups) {
        this.Groups = Groups;
    }

    /**
     * <b>depricated</b>
     * Set the default user type.
     */
    public void setDefaultUserType(UserType DefaultUserType) {
        this.DefaultUserType = DefaultUserType;
    }

    /**
     * Set the map of user details specific to the type of user (Coder, Administrator, Sponsor...).
     */
    public void setUserTypeDetails(java.util.HashMap UserTypeDetails) {
        this.UserTypeDetails = UserTypeDetails;
    }

    /**
     * Set the logged in status of the user.
     */
    public void setLoggedIn(String LoggedIn) {
        this.LoggedIn = LoggedIn;
    }

    /**
     * Set the agreement to site terms "Y" or "N".
     */
    public void setTerms(String Terms) {
        this.Terms = Terms;
    }


    /**
     * Get the user id (secure object id).
     */
    public int getUserId() {
        return super.getSId();
    }

    /**
     * Get the handle (user name).
     */
    public String getHandle() {
        return Handle;
    }

    /**
     * Get the password.
     */
    public String getPassword() {
        return Password;
    }

    /**
     * Get the confirm password.
     */
    public String getConfirmPassword() {
        return ConfirmPassword;
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
     *
     */
    public String getStatus() {
        return Status;
    }

    /**
     * Get the user's email address.
     */
    public String getEmail() {
        return Email;
    }

    /**
     * Get the list of groups the user belongs to.
     */
    public java.util.ArrayList getGroups() {
        return Groups;
    }

    /**
     * <b>depricated</b>
     * Get the default user type.
     */
    public UserType getDefaultUserType() {
        return DefaultUserType;
    }

    /**
     * Get the map of user details specific to the type of user (Coder, Administrator, Sponsor...).
     */
    public java.util.HashMap getUserTypeDetails() {
        return UserTypeDetails;
    }

    /**
     * Get the logged in status of the user.
     */
    public String getLoggedIn() {
        return LoggedIn;
    }

    /**
     * Get the agreement to site terms "Y" or "N".
     */
    public String getTerms() {
        return Terms;
    }

    public String toString() {
        return "handle: " + Handle + " userid " + SId;
    }

}
