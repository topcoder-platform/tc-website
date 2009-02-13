package com.topcoder.web.csf.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.csf.model.Document;
import com.topcoder.web.csf.dao.DocumentDAO;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class DocumentDAOHibernate extends Base implements DocumentDAO {

    public Document find(Long id) {
        return (Document) super.find(Document.class, id);
    }
}
