package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.FileTypeDAO;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
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
}
