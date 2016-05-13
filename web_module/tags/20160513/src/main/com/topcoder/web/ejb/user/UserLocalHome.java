package com.topcoder.web.ejb.user;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 28, 2008
 */
public interface UserLocalHome extends EJBLocalHome {

    UserLocal create() throws CreateException;
}

