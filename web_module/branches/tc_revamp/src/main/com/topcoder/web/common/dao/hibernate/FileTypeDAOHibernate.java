package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.FileTypeDAO;
import com.topcoder.web.common.model.FileType;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class FileTypeDAOHibernate extends Base implements FileTypeDAO {
    public List getFileTypes() {
        List ret;
        StringBuffer query = new StringBuffer(100);
        query.append("FROM FileType ft");
        query.append(" ORDER BY ft.sort");
        Query q = session.createQuery(query.toString());
        ret = q.list();
        return ret;
    }

    public FileType find(Integer id) {
        return (FileType) find(FileType.class, id);
    }

    public FileType find(String mimeType) {
        StringBuffer query = new StringBuffer(100);
        query.append("from FileType");
        query.append(" where LOWER(mimeType) = LOWER(?)");
        Query q = session.createQuery(query.toString());
        q.setString(0, mimeType);
        return (FileType) q.uniqueResult();
    }
}
