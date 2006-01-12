package com.topcoder.web.ejb.ComponentRegistrationServices;

import com.topcoder.web.ejb.termsofuse.TermsOfUseLocal;

import javax.ejb.EJBLocalHome;
import javax.ejb.CreateException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 12, 2006
 */
public interface ComponentRegistrationServicesLocalHome extends EJBLocalHome {

    public ComponentRegistrationServicesLocal create() throws CreateException;
}
{
}
