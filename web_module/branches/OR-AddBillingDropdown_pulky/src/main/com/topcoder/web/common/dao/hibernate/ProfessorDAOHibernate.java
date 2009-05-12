package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.ProfessorDAO;
import com.topcoder.web.common.model.educ.Professor;


/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class ProfessorDAOHibernate extends GenericBase<Professor, Long> implements ProfessorDAO {
//    public Boolean hasActiveProfessors(Long studentId) {
//        Criteria c = getSession().createCriteria(Professor.class);
//        c.setProjection(Projections.projectionList()
//                .add(Projections.rowCount())
//        );
//
//        c.createCriteria("classrooms")
//                .createCriteria("studentClassrooms")
//                .add(Restrictions.eq("id.student.id", studentId))
//                .add(Restrictions.or(
//                        Restrictions.eq("statusId", StudentClassroom.PENDING_STATUS),
//                        Restrictions.eq("statusId", StudentClassroom.ACTIVE_STATUS)));
//
//
//        return ((Integer) c.uniqueResult()) > 0;
//    }

    public Boolean isProfessor(Long professorId) {
        Criteria c = getSession().createCriteria(Professor.class);
        c.setProjection(Projections.projectionList()
                .add(Projections.rowCount())
        );

        c.add(Restrictions.eq("id", professorId));

        return ((Integer) c.uniqueResult()) > 0;
    }

}
