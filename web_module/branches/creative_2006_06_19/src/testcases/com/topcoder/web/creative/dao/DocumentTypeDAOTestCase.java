package com.topcoder.web.creative.dao;

import com.topcoder.web.creative.TCHibernateTestCase;
import com.topcoder.web.creative.model.DocumentType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public class DocumentTypeDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("could not find type " + DocumentType.SPECIFICTION,
                CreativeDAOUtil.getFactory().getDocumentTypeDAO().find(DocumentType.SPECIFICTION) == null);

    }
}
