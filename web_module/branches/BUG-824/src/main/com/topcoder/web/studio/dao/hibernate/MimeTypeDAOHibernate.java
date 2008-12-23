package com.topcoder.web.studio.dao.hibernate;

import java.util.List;

import javax.persistence.UniqueConstraint;

import org.hibernate.Query;
import org.hibernate.annotations.Check;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.studio.dao.MimeTypeDAO;
import com.topcoder.web.studio.model.MimeType;

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
    
	@SuppressWarnings("unchecked")    
	public List<MimeType> findAll()
    {
    	return super.findAll(MimeType.class);
    }
}
