package com.topcoder.server.ejb.EmailServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.*;

/**
 * This class allows the creation and manipulation of email_template objects.
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
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
  * @return     the template id for the newly created template.
  */
    public int createTemplate(int group, String name, String data) throws RemoteException;

 /**
  * Returns a map of template ids and names.
  *
  * @return     the returned Map contains template ids as the key (type Integer) and the template names as the value (type String).
  */
    public Map getTemplates() throws RemoteException;
    
 /**
  * Returns a map of template ids and names for a group.
  *
  * @return     the returned Map contains template ids as the key (type Integer) and the template names as the value (type String).
  */
    public Map getTemplates(int groupId) throws RemoteException;
    
 /**
  * Returns the name of a template.
  *
  * @return     a String containing the template name.
  */
    public String getTemplateName(int listId) throws RemoteException;

 /**
  * Returns the group a template belongs to.
  *
  * @return     a int containing the groupId for the template.
  */
    public int getTemplateGroupId(int listId) throws RemoteException;

 /**
  * Returns the template data.
  */
    public String getData(int templateId) throws RemoteException;

 /**
  * Returns true if the template is currently being used by a job.
  */
    public boolean isInUse(int templateId) throws RemoteException;

 /**
  * Updates the template group.
  */
    public void setGroupId(int templateId, int groupId) throws RemoteException;
    
 /**
  * Updates the template name.
  */
    public void setName(int templateId, String name) throws RemoteException;
    
 /**
  * Updates the template data.
  */
    public void setData(int templateId, String data) throws RemoteException;
}

