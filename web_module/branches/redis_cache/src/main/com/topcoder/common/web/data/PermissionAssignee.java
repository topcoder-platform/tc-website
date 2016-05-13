package com.topcoder.common.web.data;


/**
 * This interface is implemented by users and groups to allow them to be dealt with
 * as generic security objects having permissions and groups affiliations.
 *
 * @version  $Revision$
 */
public interface PermissionAssignee {

    /**
     * Set the list of security groups.
     */
    public void setGroups(java.util.ArrayList Groups) throws Exception;

    /**
     * Get the list of security groups.
     */
    public java.util.ArrayList getGroups();

}
