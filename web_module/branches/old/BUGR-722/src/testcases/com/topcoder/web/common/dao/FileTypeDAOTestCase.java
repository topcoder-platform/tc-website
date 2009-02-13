package com.topcoder.web.common.dao;

import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class FileTypeDAOTestCase extends TCHibernateTestCase {
    public void testGetFileTypes() {
        assertFalse("couldn't find the file types", DAOUtil.getFactory().getFileTypeDAO().getFileTypes().isEmpty());
    }

    public void testFindById() {
        assertFalse("couldn't find type 1", DAOUtil.getFactory().getFileTypeDAO().find(new Integer(1)) == null);
    }

    public void testMimeType() {
        assertFalse("couldn't find type text/plain", DAOUtil.getFactory().getFileTypeDAO().find("text/plain") == null);
    }
}
