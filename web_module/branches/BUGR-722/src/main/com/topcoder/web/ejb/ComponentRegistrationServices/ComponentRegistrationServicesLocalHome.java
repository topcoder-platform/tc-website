package com.topcoder.web.ejb.ComponentRegistrationServices;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author dok
 * @version $Revision: 43007 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 12, 2006
 */
public interface ComponentRegistrationServicesLocalHome extends EJBLocalHome {

    public ComponentRegistrationServicesLocal create() throws CreateException;
}
