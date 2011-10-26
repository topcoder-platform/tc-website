package com.topcoder.web.openaim.dao;

import com.topcoder.web.openaim.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class MimeTypeDAOTestCase extends TCHibernateTestCase {
    public void testFindById() {
        assertFalse("couldn't find type 1", OpenAIMDAOUtil.getFactory().getMimeTypeDAO().find(new Integer(1)) == null);
    }

    public void testMimeType() {
        assertFalse("couldn't find type text/plain", OpenAIMDAOUtil.getFactory().getMimeTypeDAO().find("text/plain") == null);
    }

}
