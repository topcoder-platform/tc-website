package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.GenericBase;
import com.topcoder.web.studio.dao.FileTypeDAO;
import com.topcoder.web.studio.model.StudioFileType;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class FileTypeDAOHibernate extends GenericBase<StudioFileType, Integer> implements FileTypeDAO {

    @SuppressWarnings("unchecked")
    public List<StudioFileType> getFileTypes() {
        List ret;
        StringBuffer query = new StringBuffer(100);
        query.append("FROM StudioFileType ft");
        query.append(" ORDER BY ft.sort");
        Query q = getSession().createQuery(query.toString());
        ret = q.list();
        return ret;
    }

    public StudioFileType find(String mimeType) {
        StringBuffer query = new StringBuffer(100);
        query.append("from StudioFileType f");
        query.append(" where LOWER(f.mimeTypes.description) = LOWER(?)");
        Query q = getSession().createQuery(query.toString());
        q.setString(0, mimeType);
        return (StudioFileType) q.uniqueResult();
    }
}
