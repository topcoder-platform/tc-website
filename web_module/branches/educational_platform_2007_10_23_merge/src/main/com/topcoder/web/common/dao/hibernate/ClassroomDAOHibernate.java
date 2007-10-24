package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.ClassroomDAO;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.educ.Classroom;
 

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class ClassroomDAOHibernate extends GenericBase<Classroom, Long> implements ClassroomDAO {

    @SuppressWarnings("unchecked")
    public List<Round> getAssignments(Long classroomId) {
        Criteria c = getSession().createCriteria(Round.class);
        
        c.createCriteria("roundProperties")
            .add(Restrictions.eq("id.typeId", RoundProperty.CLASSROOM_ID_PROPERTY_ID))
            .add(Restrictions.eq("intValue", classroomId));
        c.addOrder(Order.asc("name"));
        
        return (List<Round>) c.list();
    }
    
    @SuppressWarnings("unchecked")
    public List<Round> getAssignmentsForStudent(Long classroomId, Long coderId) {
        Criteria c = getSession().createCriteria(Round.class);

        c.createCriteria("roundRegistrations")
            .add(Restrictions.eq("id.coder.id", coderId));

        c.createCriteria("roundProperties")
            .add(Restrictions.eq("id.typeId", RoundProperty.CLASSROOM_ID_PROPERTY_ID))
            .add(Restrictions.eq("intValue", classroomId));
        
        c.addOrder(Order.asc("name"));
            
        return (List<Round>) c.list();
    }
    
    @SuppressWarnings("unchecked")
	public List<Classroom> getClassroomsUsingProfessorId(Long professorId) {
		return (List<Classroom>) getSession().createCriteria(Classroom.class)
        	.add(Restrictions.eq("professor.id", professorId))
        	.add(Restrictions.eq("statusId", Classroom.ACTIVE))
        	.addOrder(Order.asc("school"))
        	.addOrder(Order.asc("name"))
            .list();
	}

    @SuppressWarnings("unchecked")
    public List<Classroom> getClassroomsUsingStudentId(Long studentId, Long statusId) {
        Criteria c = getSession().createCriteria(Classroom.class);
        
        c.add(Restrictions.eq("statusId", Classroom.ACTIVE))
            .addOrder(Order.asc("school"))
            .addOrder(Order.asc("name"));
        
        c.createCriteria("studentClassrooms")
            .add(Restrictions.eq("statusId", statusId))
            .add(Restrictions.eq("id.student.id", studentId));
            
        return (List<Classroom>) c.list();
    }
}
