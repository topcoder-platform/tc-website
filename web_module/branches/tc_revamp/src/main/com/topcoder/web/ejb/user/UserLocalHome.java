package com.topcoder.web.ejb.user;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author dok
 * @version $Id: UserLocalHome.java 68744 2008-02-28 17:44:37Z gpaul $
 *          Create Date: Feb 28, 2008
 */
public interface UserLocalHome extends EJBLocalHome {

    UserLocal create() throws CreateException;
}

