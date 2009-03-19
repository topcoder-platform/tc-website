package com.topcoder.web.csf.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.csf.model.DocumentType;
import com.topcoder.web.csf.dao.DocumentTypeDAO;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class DocumentTypeDAOHibernate extends Base implements DocumentTypeDAO {

    public DocumentType find(Integer id) {
        return (DocumentType) super.find(DocumentType.class, id);
    }

    public List getDocumentTypes() {
        return findAll(DocumentType.class);
    }
}
