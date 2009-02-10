package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.studio.dao.DocumentDAO;
import com.topcoder.web.studio.model.Document;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class DocumentDAOHibernate extends Base implements DocumentDAO {

    public Document find(Long id) {
        return (Document) super.find(Document.class, id);
    }
}
