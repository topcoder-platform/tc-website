package com.topcoder.web.ejb.termsofuse;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 12, 2006
 */
public interface TermsOfUseLocalHome extends EJBLocalHome {

    public TermsOfUseLocal create() throws CreateException;
}
