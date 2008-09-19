package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class MimeTypeDAOTestCase extends TCHibernateTestCase {
    public void testFindById() {
        assertFalse("couldn't find type 1", StudioDAOUtil.getFactory().getMimeTypeDAO().find(new Integer(1)) == null);
    }

    public void testMimeType() {
        assertFalse("couldn't find type text/plain", StudioDAOUtil.getFactory().getMimeTypeDAO().find("text/plain") == null);
    }

}
