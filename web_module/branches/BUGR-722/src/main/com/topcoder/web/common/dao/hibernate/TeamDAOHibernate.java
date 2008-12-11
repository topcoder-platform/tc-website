package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.TeamDAO;
import com.topcoder.web.common.model.School;
import org.hibernate.Query;

import java.util.Collections;
import java.util.List;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public class TeamDAOHibernate extends Base implements TeamDAO {
    public List getHighSchoolTeamsForSchool(School s) {
        if (s == null || s.getId() == null) {
            return Collections.EMPTY_LIST;
        } else {
            StringBuffer query = new StringBuffer(100);
            query.append("FROM Team t ");
            query.append(" WHERE t.school.id = ?");
            Query q = session.createQuery(query.toString());
            q.setLong(0, s.getId().longValue());

            return q.list();
        }
    }
}
