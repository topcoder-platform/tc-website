/*
 * CoderSkillHome.java
 *
 * Created on October 8, 2004, 2:22 PM
 */

package com.topcoder.web.ejb.coderskill;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * @author  rfairfax
 */
public interface CoderSkillHome extends EJBHome {

    CoderSkill create() throws CreateException, RemoteException;
}
