package com.topcoder.web.winformula.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.winformula.dao.MimeTypeDAO;
import com.topcoder.web.winformula.model.MimeType;
import org.hibernate.Query;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class MimeTypeDAOHibernate extends Base implements MimeTypeDAO {
    public MimeType find(Integer id) {
        return (MimeType) super.find(MimeType.class, id);
    }

    public MimeType find(String description) {
        StringBuffer query = new StringBuffer(100);
        query.append("from MimeType");
        query.append(" where LOWER(description) = LOWER(?)");
        Query q = session.createQuery(query.toString());
        q.setString(0, description);
        return (MimeType) q.uniqueResult();
    }
}
