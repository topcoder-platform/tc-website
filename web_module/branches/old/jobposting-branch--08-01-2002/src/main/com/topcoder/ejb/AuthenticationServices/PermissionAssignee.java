package com.topcoder.ejb.AuthenticationServices;


/**
 * This interface is implemented by users and groups to allow them to be dealt with
 * as generic security objects having permissions and groups affiliations.
 *
 * @version  $Revision$
 *  Log of Changes:
 */
public interface PermissionAssignee {

    /**
     * Get the secure object id.
     */
    public int getSId();

    /**
     * Get the secure object type (G)roup or (U)ser.
     */
    public String getSIdType();

    /**
     * Get the list of security permissions.
     */
    public java.util.ArrayList getPermissions() throws Exception;

    /**
     * Set the list of security permissions.
     */
    public void setPermissions(java.util.ArrayList Permissions) throws Exception;

    /**
     * Set the list of security groups.
     */
    public void setGroups(java.util.ArrayList Groups) throws Exception;

    /**
     * Get the list of security groups.
     */
    public java.util.ArrayList getGroups();

}
