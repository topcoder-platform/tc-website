package com.topcoder.shared.ejb.EmailServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.Map;

/**
 * This class allows the creation and manipulation of email_template objects.
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 *  Log of Changes:
 *           $Log$
 *           Revision 1.3  2002/07/16 21:37:45  gpaul
 *           merging in sord email changes
 *
 *           Revision 1.2.2.2  2002/04/15 06:16:46  apps
 *           Added accesor functions for Name and GroupId.
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
public interface EmailTemplate extends EJBObject {
    /**
     * Create a new email template object.
     *
     * @param group
     * @param name
     * @param data
     * @return     the template id for the newly created template.
     * @throws RemoteException
     */
    public int createTemplate(int group, String name, String data) throws RemoteException;

    /**
     * Returns a map of template ids and names.
     *
     * @return     the returned Map contains template ids as the key (type Integer) and the template names as the value (type String).
     * @throws RemoteException
     */
    public Map getTemplates() throws RemoteException;

    /**
     * Returns a map of template ids and names for a group.
     *
     * @param groupId
     * @return     the returned Map contains template ids as the key (type Integer) and the template names as the value (type String).
     * @throws RemoteException
     */
    public Map getTemplates(int groupId) throws RemoteException;

    /**
     * Returns the name of a template.
     *
     * @param listId
     * @return     a String containing the template name.
     * @throws RemoteException
     */
    public String getTemplateName(int listId) throws RemoteException;

    /**
     * Returns the group a template belongs to.
     *
     * @param listId
     * @return     a int containing the groupId for the template.
     * @throws RemoteException
     */
    public int getTemplateGroupId(int listId) throws RemoteException;

    /**
     * Returns the template data.
     * @param templateId
     * @return
     * @throws RemoteException
     */
    public String getData(int templateId) throws RemoteException;

    /**
     * Returns true if the template is currently being used by a job.
     * @param templateId
     * @return
     * @throws RemoteException
     */
    public boolean isInUse(int templateId) throws RemoteException;

    /**
     * Updates the template group.
     * @param templateId
     * @param groupId
     * @throws RemoteException
     */
    public void setGroupId(int templateId, int groupId) throws RemoteException;

    /**
     * Updates the template name.
     * @param templateId
     * @param name
     * @throws RemoteException
     */
    public void setName(int templateId, String name) throws RemoteException;

    /**
     * Updates the template data.
     * @param templateId
     * @param data
     * @throws RemoteException
     */
    public void setData(int templateId, String data) throws RemoteException;
}

