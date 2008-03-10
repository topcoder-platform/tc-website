package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.model.StudioFileType;
import junit.framework.Assert;

import java.io.Serializable;

/**
 * @author dok, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class FileTypeDAOTestCase extends TCHibernateTestCase {
    public void testGetFileTypes() {
        assertFalse("couldn't find the file types", StudioDAOUtil.getFactory().getFileTypeDAO().getFileTypes().isEmpty());
    }

    public void testFindById() {
        assertFalse("couldn't find type 1", StudioDAOUtil.getFactory().getFileTypeDAO().find(new Integer(1)) == null);
    }

    public void testMimeType() {
        assertFalse("couldn't find type text/plain",
                    StudioDAOUtil.getFactory().getFileTypeDAO().find("text/plain") == null);
    }

    /**
     * <p>Accuracy test. Tests the {@link FileTypeDAO#find(Serializable)} method for accurate behavior.</p>
     *
     * <p>Verifies that for all file types corresponding to bundled files the returned {@link StudioFileType} instances
     * have the <code>bundledFile</code> proeprty set to <code>true</code> while for remaining file types that property
     * is set to <code>false</code>.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.6)
     */
    public void testFind_BundledFile() {
        int[] bundledFileTypeIds = new int[] {StudioFileType.ZIP_ARCHIVE_TYPE_ID};
        int[] nonBundledFileTypeIds = new int[] {1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 15};

        FileTypeDAO fileTypeDAO = StudioDAOUtil.getFactory().getFileTypeDAO();
        
        for (int i = 0; i < bundledFileTypeIds.length; i++) {
            int bundledFileTypeId = bundledFileTypeIds[i];
            StudioFileType fileType = fileTypeDAO.find(bundledFileTypeId);
            Assert.assertTrue("Wrong bundledFile flag for file type " + bundledFileTypeId, fileType.isBundledFile());
        }
        for (int i = 0; i < nonBundledFileTypeIds.length; i++) {
            int nonBundledFileTypeId = nonBundledFileTypeIds[i];
            StudioFileType fileType = fileTypeDAO.find(nonBundledFileTypeId);
            Assert.assertFalse("Wrong bundledFile flag for file type " + nonBundledFileTypeId,
                               fileType.isBundledFile());
        }
    }
}
