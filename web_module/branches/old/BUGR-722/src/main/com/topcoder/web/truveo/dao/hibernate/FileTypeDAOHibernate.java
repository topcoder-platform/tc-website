package com.topcoder.web.truveo.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.GenericBase;
import com.topcoder.web.truveo.dao.FileTypeDAO;
import com.topcoder.web.truveo.model.TruveoFileType;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 70395 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class FileTypeDAOHibernate extends GenericBase<TruveoFileType, Integer> implements FileTypeDAO {

    @SuppressWarnings("unchecked")
    public List<TruveoFileType> getFileTypes() {
        List ret;
        StringBuffer query = new StringBuffer(100);
        query.append("FROM com.topcoder.web.truveo.model.TruveoFileType ft");
        query.append(" ORDER BY ft.sort");
        Query q = getSession().createQuery(query.toString());
        ret = q.list();
        return ret;
    }

    public TruveoFileType find(String mimeType) {
        StringBuffer query = new StringBuffer(100);
        query.append("select f from com.topcoder.web.truveo.model.TruveoFileType f join f.mimeTypes m");
        query.append(" where lower(m.description) = lower(?)");
        Query q = getSession().createQuery(query.toString());
        q.setString(0, mimeType);
        return (TruveoFileType) q.uniqueResult();
    }
}
