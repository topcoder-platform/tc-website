package com.topcoder.common.web.data;

/**
 * This class defines a type of secure object that represents a group of users and/or other groups.
 * A Group implements the PermissionAssignee interface, and thus can be assigned security permissions
 * to secured sectors.  See the GroupUser class for the list of members of the Group.
 *
 * @version  $Revision$
 */
public class Group
        extends SecureObject
        implements java.io.Serializable, PermissionAssignee {


    private java.util.ArrayList groups;
    private String groupDesc;


    public Group() {
        super();
        groupDesc = "";
    }


    /**
     * Set the groups belonged to.
     */
    public void setGroups(java.util.ArrayList groups) throws Exception {
        this.groups = groups;
    }

    /**
     * Set the group id.
     */
    public void setGroupId(int groupId) {
        setSId(groupId);
    }

    /**
     * Set the group descriptive name.
     */
    public void setGroupDesc(String groupDesc) {
        this.groupDesc = groupDesc;
    }


    /**
     * Get the groups belonged to.
     */
    public java.util.ArrayList getGroups() {
        return this.groups;
    }

    /**
     * Get the group id.
     */
    public int getGroupId() {
        return super.getSId();
    }

    /**
     * Get the group descriptive name.
     */
    public String getGroupDesc() {
        return groupDesc;
    }


}

