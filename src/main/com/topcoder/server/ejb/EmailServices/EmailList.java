package com.topcoder.server.ejb.EmailServices;


import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.*;

/**
 * This class allows the creation and manipulation of email lists.
 *
 * New lists are created using createList().
 * Members are added to a list using addMember().
 *
 * A list of lists can be retrieved using getList().
 *
 * The list members can be retrieved using getMembers().
 *
 * A member's data can be retrieved using getMemberData().
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.2.2.4  2002/04/21 22:21:58  apps
 *           Added functions to set job properties.
 *
 *           Revision 1.2.2.3  2002/04/15 06:12:24  apps
 *           Replaced tabs with spaces.
 *           Added data accessors to EmailList classes for name and groupId
 *
 *           Revision 1.2.2.2  2002/04/12 01:33:56  apps
 *           This is just a test.
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
public interface EmailList extends EJBObject {
 /**
  * Create a new email list.
  *
  * @return     the list id for the newly created email list.
  */
    public int createList(int group, String name) throws RemoteException;

 /**
  * Add a member to an email list.
  *
  * @return     the member id for the new list member.
  */
    public int addMember(int listId, String data) throws RemoteException;

 /**
  * Remove a member from an email list.
  */
    public void removeMember(int listId, int memberId) throws RemoteException;

 /**
  * Returns a map of list ids and names.
  *
  * @return     a Map containing list ids as the key (type Integer) and the list names as the value (type String).
  */
    public Map getLists() throws RemoteException;
    
 /**
  * Returns a map of list ids and names for lists in the specified group.
  *
  * @return     a Map containing list ids as the key (type Integer) and the list names as the value (type String).
  */
    public Map getLists(int groupId) throws RemoteException;
    
 /**
  * Returns the ids for all the list members.
  *
  * @return     a Set containing ids (type Integer) for all the members in the list.
  */
    public Set getMembers(int listId) throws RemoteException;
    
 /**
  * Returns the name of a list.
  *
  * @return     a String containing the list name.
  */
    public String getListName(int listId) throws RemoteException;

 /**
  * Returns the group a list belongs to.
  *
  * @return     a int containing the groupId for the list.
  */
    public int getListGroupId(int listId) throws RemoteException;

 /**
  * Returns the data for a specific list member.
  *
  * @return     a String containing the data for the list member.
  */
    public String getData(int listId, int memberId) throws RemoteException;

 /**
  * Change the group a list belongs to.
  */
    public void setGroupId(int listId, int groupId) throws RemoteException;

 /**
  * Change the name of a list.
  */
    public void setName(int listId, String name) throws RemoteException;

 /**
  * Change the data for a specific list member.
  */
    public void setData(int listId, int memberId, String data) throws RemoteException;

}

