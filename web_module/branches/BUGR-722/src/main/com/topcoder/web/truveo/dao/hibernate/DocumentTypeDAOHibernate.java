package com.topcoder.web.truveo.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.truveo.dao.DocumentTypeDAO;
import com.topcoder.web.truveo.model.DocumentType;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 70395 $ Date: 2005/01/01 00:00:00
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
