package com.topcoder.common.web.data;




/**
 * This class defines a member of a security group.
 *
 * @version  $Revision$
 */
public final class GroupUser implements java.io.Serializable {


    private Group group;
    private int userId;
    private String modified;


    public GroupUser() {
        group = new Group();
        userId = 0;
        modified = "";
    }


    /**
     * Set the group.
     */
    public void setGroup(Group group) {
        this.group = group;
    }


    /**
     * Set the user id.
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }


    /**
     * Set the Modified flag: (A)dd, (U)pdate, (D)elete.
     */
    public void setModified(String modified) {
        this.modified = modified;
    }


    /**
     * Get the group.
     */
    public Group getGroup() {
        return group;
    }


    /**
     * Get the user id.
     */
    public int getUserId() {
        return userId;
    }


    /**
     * Get the Modified flag: (A)dd, (U)pdate, (D)elete.
     */
    public String getModified() {
        return modified;
    }


}

