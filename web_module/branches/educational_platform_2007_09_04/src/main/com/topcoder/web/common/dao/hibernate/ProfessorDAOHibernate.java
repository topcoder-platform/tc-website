package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.ProfessorDAO;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.educ.Professor;
 

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class ProfessorDAOHibernate extends GenericBase<Professor, Long> implements ProfessorDAO {

    @SuppressWarnings("unchecked")
    public List<Professor> getProfessors(School school) {
        return getSession().createCriteria(Professor.class)
        .add(Restrictions.sqlRestriction("{alias}.school_id = ?", school.getId(), Hibernate.LONG))
        .list();
        
        // this didn't work
//        return getSession().createCriteria(Professor.class)
//        .add(Restrictions.eq("school", school))
//        .list();
    }
}
