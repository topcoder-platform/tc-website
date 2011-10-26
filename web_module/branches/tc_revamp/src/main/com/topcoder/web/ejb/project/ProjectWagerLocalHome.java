package com.topcoder.web.ejb.project;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author dok
 * @version $Revision: 44584 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 17, 2006
 */
public interface ProjectWagerLocalHome extends EJBLocalHome {

    public ProjectWagerLocal create() throws CreateException;
}
