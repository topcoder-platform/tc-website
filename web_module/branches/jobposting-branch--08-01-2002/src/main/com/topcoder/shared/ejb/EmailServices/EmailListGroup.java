package com.topcoder.shared.ejb.EmailServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.Map;

/**
 * This class allows the lookup and manipulation of email list groups.
 *
 * An email list group is a logical separation of the email lists.
 * All email lists must be assigned to a single group.
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 *  Log of Changes:
 *           $Log$
 *           Revision 1.3  2002/07/16 21:37:45  gpaul
 *           merging in sord email changes
 *
 *           Revision 1.2.2.1  2002/04/11 18:20:28  apps
 *           SB -- readded EmailServices
 *
 *           Revision 1.2  2002/04/05 04:18:38  apps
 *           Fixed formatting by replacing tabs with spaces.
 *
 *           Revision 1.1.1.1  2002/04/02 10:42:29  apps
 *           no message
 *
 *           Revision 1.1.2.1  2002/04/02 10:34:32  apps
 *           Initial version.
 *           Interface declared.
 *
 */
public interface EmailListGroup extends EJBObject {
    /**
     * Add a group name to the list of possible groups.
     *
     * @param name
     * @return     the id of the new group
     * @throws RemoteException
     */
    public int addGroup(String name) throws RemoteException;

    /**
     * Update the name of a group.
     * @param id
     * @param name
     * @throws RemoteException
     */
    public void updateGroup(int id, String name) throws RemoteException;

    /**
     * Remove a group.
     *
     * A group may only be removed if no email lists are using it.
     * If one or more lists are assigned to the group, an exception is thrown.
     * @param id
     * @throws RemoteException
     */
    public void removeGroup(int id) throws RemoteException;

    /**
     * Returns a map of group ids and names.
     *
     * @return     the returned Map contains group ids as the key (type Integer) and the group names as the value (type String).
     * @throws RemoteException
     */
    public Map getGroups() throws RemoteException;

    /**
     * Returns the group name for the requested id.
     * @param id
     * @return
     * @throws RemoteException
     */
    public String getName(int id) throws RemoteException;
}

