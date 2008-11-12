package com.topcoder.web.ejb.project;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 21, 2005
 */
public interface ProjectLocalHome extends EJBLocalHome {

    public ProjectLocal create() throws CreateException;
}

