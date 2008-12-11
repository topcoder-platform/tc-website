package com.topcoder.web.openaim.dao;

import com.topcoder.web.openaim.TCHibernateTestCase;
import com.topcoder.web.openaim.model.DocumentType;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public class DocumentTypeDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("could not find type " + DocumentType.SPECIFICTION,
                OpenAIMDAOUtil.getFactory().getDocumentTypeDAO().find(DocumentType.SPECIFICTION) == null);

    }
}
