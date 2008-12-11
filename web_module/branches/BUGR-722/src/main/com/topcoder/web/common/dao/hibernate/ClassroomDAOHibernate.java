package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.ClassroomDAO;
import com.topcoder.web.ep.model.Classroom;
 

/**
 * @author pulky
 * @version $Revision: 66912 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class ClassroomDAOHibernate extends GenericBase<Classroom, Long> implements ClassroomDAO {

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
    
    @SuppressWarnings("unchecked")
    public List<Classroom> getClassroomsUsingStudentId(Long studentId) {
        Criteria c = getSession().createCriteria(Classroom.class);
        
        c.add(Restrictions.eq("statusId", Classroom.ACTIVE))
            .addOrder(Order.asc("school"))
            .addOrder(Order.asc("name"));
        
        c.createCriteria("studentClassrooms")
            .add(Restrictions.eq("id.student.id", studentId));
        
        return (List<Classroom>) c.list();
    }
    
    @SuppressWarnings("unchecked")
    public List<Classroom> getClassroomsUsingSchoolId(Long schoolId) {
        Criteria c = getSession().createCriteria(Classroom.class)
        .add(Restrictions.eq("school.id", schoolId));

        return (List<Classroom>) c.list();
    }

    @SuppressWarnings("unchecked")
    public List<Classroom> findClassroomUsingNameAndPeriod(Long schoolId, String name, String period) {
        Criteria c = getSession().createCriteria(Classroom.class)
                .add(Restrictions.eq("school.id", schoolId))
                .add(Restrictions.eq("name", name))
                .add(Restrictions.eq("academicPeriod", period));

        return (List<Classroom>) c.list();
    }

}
