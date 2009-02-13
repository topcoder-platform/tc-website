package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class TermsOfUseDAOTestCase extends TCHibernateTestCase {

    public void testFind() {
        assertFalse("couldn't find site terms", Util.getFactory().getTermsOfUse().find(new Integer(Constants.REG_TERMS_ID))==null);
    }
}
