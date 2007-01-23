package com.topcoder.web.common.dao.hibernate;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.web.common.dao.SchoolDAO;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.SchoolType;
import com.topcoder.web.reg.Constants;

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

        query.append("SELECT (SELECT count(*) from CurrentSchool cs WHERE cs.school.id = s.id AND cs.coder.user.status=?), s ");
        query.append("FROM School s ");
        query.append("WHERE LOWER(s.name) like LOWER(?) ");
        query.append(" AND s.viewable=1");
        query.append("ORDER BY 1 DESC ");

        Query q = session.createQuery(query.toString());
        q.setString(0, String.valueOf(Constants.ACTIVE_STATI[1]));
        q.setString(1, name);
        q.setMaxResults(maxResults);

        return q.list();

    }

    public List searchByNameAndType(String name, SchoolType type, int maxResults) {
        StringBuffer query = new StringBuffer(100);

        query.append("SELECT (SELECT count(*) from CurrentSchool cs WHERE cs.school.id = s.id AND cs.coder.user.status=?), s ");
        query.append("FROM School s ");
        query.append("WHERE LOWER(s.name) like LOWER(?) ");
        query.append(" AND s.type.id = ?");
        query.append(" AND s.viewable=1");
        query.append("ORDER BY 1 DESC ");

        Query q = session.createQuery(query.toString());
        q.setString(0, String.valueOf(Constants.ACTIVE_STATI[1]));
        q.setString(1, name);
        q.setInteger(2, type.getId().intValue());
        q.setMaxResults(maxResults);

        return q.list();

    }

    public List search(SchoolType type, Date creationAfter, String countryCode, int startRow, int maxResults) {
        StringBuffer query = new StringBuffer(100);

        query.append("SELECT (SELECT count(*) from CurrentSchool cs WHERE cs.school.id = s.id AND cs.coder.user.status=?), s ");
        query.append("FROM School s ");
        query.append("WHERE (SELECT count(*) from CurrentSchool cs WHERE cs.school.id = s.id AND cs.coder.user.status=?) > 0 ");
        query.append("AND s.type.id = ?");

        if (countryCode != null) {
        	query.append(" AND s.address.country.code=?");
        }
        
        query.append(" AND s.viewable=1");
        query.append("ORDER BY s.address.country.name, s.name ");

        Query q = session.createQuery(query.toString());
        q.setString(0, String.valueOf(Constants.ACTIVE_STATI[1]));
        q.setString(1, String.valueOf(Constants.ACTIVE_STATI[1]));
        q.setInteger(2, type.getId().intValue());
        int idx = 3;
        if (countryCode != null) {                
        	q.setString(idx++, countryCode);
        }
        
        
        q.setFirstResult(startRow);        
        q.setMaxResults(maxResults);

        return q.list();
    }

}

