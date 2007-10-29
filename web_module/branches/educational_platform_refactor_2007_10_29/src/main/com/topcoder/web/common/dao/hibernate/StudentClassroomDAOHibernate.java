package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.StudentClassroomDAO;
import com.topcoder.web.common.model.educ.StudentClassroom;
 

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class StudentClassroomDAOHibernate extends GenericBase<StudentClassroom, StudentClassroom.Identifier> implements StudentClassroomDAO {

    @SuppressWarnings("unchecked")
    public StudentClassroom findUsingStudentIdClassroomId(Long studentId, Long classroomId) {
        Criteria c = getSession().createCriteria(StudentClassroom.class);
        
        c.add(Restrictions.eq("id.student.id", studentId))
            .add(Restrictions.eq("id.classroom.id", classroomId));
            
        return (StudentClassroom) c.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    public StudentClassroom findActiveUsingStudentIdClassroomId(Long studentId, Long classroomId) {
        Criteria c = getSession().createCriteria(StudentClassroom.class);
        
        c.add(Restrictions.eq("id.student.id", studentId))
            .add(Restrictions.eq("id.classroom.id", classroomId))
            .add(Restrictions.ne("statusId", StudentClassroom.INACTIVE_STATUS));
            
        return (StudentClassroom) c.uniqueResult();
    }
}
