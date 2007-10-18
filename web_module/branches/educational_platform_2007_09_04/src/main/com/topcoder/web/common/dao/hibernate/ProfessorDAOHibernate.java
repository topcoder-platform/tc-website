package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.ProfessorDAO;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.common.model.educ.ProfessorStatus;
import com.topcoder.web.common.model.educ.StudentClassroom;
import org.hibernate.Criteria;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import java.util.List;


/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class ProfessorDAOHibernate extends GenericBase<Professor, Long> implements ProfessorDAO {

    public List<Professor> getProfessorsUsingStudentId(Long studentId) {
        Criteria c = getSession().createCriteria(Professor.class);

        c.createCriteria("classrooms")
                .createCriteria("studentClassrooms")
                .add(Restrictions.eq("id.student.id", studentId))
                .add(Restrictions.or(
                        Restrictions.eq("statusId", StudentClassroom.PENDING_STATUS),
                        Restrictions.eq("statusId", StudentClassroom.ACTIVE_STATUS)));
        c.addOrder(Order.asc("user"));

        c.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);

        return c.list();
    }


    public List<Professor> getProfessors(ProfessorStatus status) {
        Criteria c = getSession().createCriteria(Professor.class);
        c.add(Restrictions.eq("status.id", status.getId()));
        return c.list();

    }

    public Boolean hasActiveProfessors(Long studentId) {
        Criteria c = getSession().createCriteria(Professor.class);
        c.setProjection(Projections.projectionList()
                .add(Projections.rowCount())
        );

        c.createCriteria("classrooms")
                .createCriteria("studentClassrooms")
                .add(Restrictions.eq("id.student.id", studentId))
                .add(Restrictions.or(
                        Restrictions.eq("statusId", StudentClassroom.PENDING_STATUS),
                        Restrictions.eq("statusId", StudentClassroom.ACTIVE_STATUS)));


        return ((Integer) c.uniqueResult()) > 0;
    }

    public Boolean isActiveProfessor(Long professorId) {
        Criteria c = getSession().createCriteria(Professor.class);
        c.setProjection(Projections.projectionList()
                .add(Projections.rowCount())
        );

        c.add(Restrictions.eq("id", professorId));
        c.add(Restrictions.eq("status.id", ProfessorStatus.ACTIVE));

        return ((Integer) c.uniqueResult()) > 0;
    }

    public Boolean isProfessor(Long professorId) {
        Criteria c = getSession().createCriteria(Professor.class);
        c.setProjection(Projections.projectionList()
                .add(Projections.rowCount())
        );

        c.add(Restrictions.eq("id", professorId));

        return ((Integer) c.uniqueResult()) > 0;
    }

}
