package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.model.School;
import com.topcoder.web.reg.dao.SchoolDAO;
import org.hibernate.Session;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 12, 2006
 */
public class SchoolDAOHibernate extends Base implements SchoolDAO {
    public SchoolDAOHibernate() {
        super();
    }

    public SchoolDAOHibernate(Session session) {
        super(session);
    }

    public School find(Long id) {
        return (School) find(School.class, id);
    }


    public List searchByName(String name, int maxResults) {
        StringBuffer query = new StringBuffer(100);

        query.append("SELECT s, (SELECT count(*) from CurrentSchool cs WHERE cs.school.id = s.id) ");
        query.append("FROM School s ");
        query.append("WHERE LOWER(s.name) like LOWER(?) ");

        Query q = session.createQuery(query.toString());
        q.setString(0, name);
        q.setMaxResults(maxResults);

        return q.list();

    }


}

