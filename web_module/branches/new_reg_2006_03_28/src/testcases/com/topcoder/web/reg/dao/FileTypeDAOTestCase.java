package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class FileTypeDAOTestCase extends TCHibernateTestCase {
    public void testGetFileTypes() {
        assertFalse("counldn't find the file types", Util.getFactory().getFileTypeDAO().getFileTypes().isEmpty());
    }
}
