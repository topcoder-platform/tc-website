package com.topcoder.common.web.data;

/**
 * This class defines the type of user.
 *
 * @version  $Revision$
 */
public class UserType implements java.io.Serializable, Cloneable {

    private int UserTypeId;
    private String UserTypeDesc;
    private String Modified;


    public UserType() {
        UserTypeId = 0;
        UserTypeDesc = "";
        Modified = "";
    }


    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        UserType result = null;
        try {
            result = new UserType();
            result.setUserTypeId(getUserTypeId());
            result.setUserTypeDesc(getUserTypeDesc());
            result.setModified(getModified());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    /**
     * Sets the User Type Id for the user attempting to login.
     */
    public void setUserTypeId(int UserTypeId) {
        this.UserTypeId = UserTypeId;
    }

    /**
     * Sets the descriptive name for the type of user.
     */
    public void setUserTypeDesc(String UserTypeDesc) {
        this.UserTypeDesc = UserTypeDesc;
    }

    /**
     * Sets the modified flag (A)dd, (U)pdate, (D)elete.
     */
    public void setModified(String Modified) {
        this.Modified = Modified;
    }


    /**
     * Gets the User Type Id for the user attempting to login.
     */
    public int getUserTypeId() {
        return UserTypeId;
    }

    /**
     * Gets the descriptive name for the type of user.
     */
    public String getUserTypeDesc() {
        return UserTypeDesc;
    }

    /**
     * Gets the modified flag (A)dd, (U)pdate, (D)elete.
     */
    public String getModified() {
        return Modified;
    }


}
