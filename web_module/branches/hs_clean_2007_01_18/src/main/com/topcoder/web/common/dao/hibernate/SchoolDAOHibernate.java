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
    public List search(SchoolType type, String name, Date creationAfter, String countryCode, boolean orderByCountry) {
        StringBuffer query = new StringBuffer(100);

        if (countryCode != null && countryCode.trim().length() == 0) {
        	countryCode = null;
        }
        if (name != null && name.trim().length() == 0) {
        	name = null;
        }
        
        query.append("SELECT (SELECT count(*) from CurrentSchool cs WHERE cs.school.id = s.id AND cs.coder.user.status=?), s ");
        query.append("FROM School s ");
        query.append("WHERE (SELECT count(*) from CurrentSchool cs WHERE cs.school.id = s.id AND cs.coder.user.status=?) > 0 ");
        
        if (type != null) {
        	query.append("AND s.type.id = ?");
        }
        if (countryCode != null) {
       		query.append(" AND s.address.country.code=?");
        }
        if (creationAfter != null) {
        	query.append(" AND s.modifyDate >= ?");
        }
        if (name != null) {
        	query.append(" AND lower(s.name) like lower(?)");        	
        }
        query.append(" AND s.viewable=1");
        query.append(" ORDER BY " + (orderByCountry? " s.address.country.name, s.name" : " s.name"));

        Query q = session.createQuery(query.toString());
        q.setString(0, String.valueOf(Constants.ACTIVE_STATI[1]));
        q.setString(1, String.valueOf(Constants.ACTIVE_STATI[1]));
        int idx = 2;

        if (type != null) {
        	q.setInteger(idx++, type.getId().intValue());
        }
        if (countryCode != null) {                
        	q.setString(idx++, countryCode);
        }
        if (creationAfter != null) {                
        	q.setDate(idx++, creationAfter);
        }
        if (name != null) {
        	q.setString(idx++, "%" + name + "%");        	
        	
        }

        return q.list();
    }

}

