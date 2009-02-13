package com.topcoder.web.ejb.email;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author dok
 * @version $Id: EmailLocalHome.java 68744 2008-02-28 17:44:37Z gpaul $
 *          Create Date: Feb 28, 2008
 */
public interface EmailLocalHome extends EJBLocalHome {

    EmailLocal create() throws CreateException;
}

