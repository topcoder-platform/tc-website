package com.topcoder.web.ejb.email;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 28, 2008
 */
public interface EmailLocalHome extends EJBLocalHome {

    EmailLocal create() throws CreateException;
}

