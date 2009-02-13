package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.studio.dao.FileTypeDAO;
import com.topcoder.web.studio.model.StudioFileType;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class FileTypeDAOHibernate extends Base implements FileTypeDAO {
    public List getFileTypes() {
        List ret;
        StringBuffer query = new StringBuffer(100);
        query.append("FROM StudioFileType ft");
        query.append(" ORDER BY ft.sort");
        Query q = session.createQuery(query.toString());
        ret = q.list();
        return ret;
    }

    public StudioFileType find(Integer id) {
        return (StudioFileType) find(StudioFileType.class, id);
    }

    public StudioFileType find(String mimeType) {
        StringBuffer query = new StringBuffer(100);
        query.append("from StudioFileType f");
        query.append(" where LOWER(f.mimeTypes.description) = LOWER(?)");
        Query q = session.createQuery(query.toString());
        q.setString(0, mimeType);
        return (StudioFileType) q.uniqueResult();
    }
}
