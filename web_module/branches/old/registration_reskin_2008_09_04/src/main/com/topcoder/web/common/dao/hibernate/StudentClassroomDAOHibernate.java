package com.topcoder.web.common.dao.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.StudentClassroomDAO;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.ep.model.StudentClassroom;
 

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

    @SuppressWarnings("unchecked")
    public List<Coder> findUsingProfessorIdSchoolId(Long professorId, Long schoolId) {
        List ret;
        StringBuffer query = new StringBuffer(100);
        query.append("SELECT distinct sc.id.student.user.lastName, sc.id.student.user.firstName, sc.id.student FROM StudentClassroom sc WHERE ");
        query.append("sc.id.classroom.professor.id = :professorId");
        query.append(" and sc.id.classroom.school.id = :schoolId");
        query.append(" order by sc.id.student.user.lastName, sc.id.student.user.firstName");
        Query q = getSession().createQuery(query.toString());
        q.setLong("professorId", professorId);
        q.setLong("schoolId", schoolId);

        List tmp = q.list();

        // this is informix fault, forcing to add the sort columns to the select clause.
        // so we need to take it out before returning the list
        ret = new ArrayList();
        for (Object[] obj : (List<Object[]>) tmp) {
            ret.add(obj[2]);
        }

        return ret;
    }

    @SuppressWarnings("unchecked")
    public List<Coder> findUsingClassroomIdStatusId(Long classroomId, Long statusId) {
        List ret;
        StringBuffer query = new StringBuffer(100);
        query.append("SELECT distinct sc.id.student.user.lastName, sc.id.student.user.firstName, sc.id.student FROM StudentClassroom sc WHERE ");
        query.append("sc.statusId = :statusId");
        query.append(" and sc.id.classroom.id = :classroomId");
        query.append(" order by sc.id.student.user.lastName, sc.id.student.user.firstName");
        Query q = getSession().createQuery(query.toString());
        q.setLong("classroomId", classroomId);
        q.setLong("statusId", statusId);

        List tmp = q.list();

        // this is informix fault, forcing to add the sort columns to the select clause.
        // so we need to take it out before returning the list
        ret = new ArrayList();
        for (Object[] obj : (List<Object[]>) tmp) {
            ret.add(obj[2]);
        }

        return ret;
    }
}
