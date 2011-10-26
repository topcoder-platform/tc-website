package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.model.DocumentType;

/**
 * @author dok
 * @version $Revision: 69932 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public class DocumentTypeDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("could not find type " + DocumentType.SPECIFICTION,
                StudioDAOUtil.getFactory().getDocumentTypeDAO().find(DocumentType.SPECIFICTION) == null);

    }
}
