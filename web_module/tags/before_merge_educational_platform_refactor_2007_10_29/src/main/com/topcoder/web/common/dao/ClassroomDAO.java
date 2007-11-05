package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.educ.Classroom;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public interface ClassroomDAO extends GenericDAO<Classroom, Long> {

	public List<Classroom>  getClassroomsUsingProfessorId(Long professorId);
    
    public List<Classroom> getClassroomsUsingStudentId(Long studentId, Long statusId);

    public List<Classroom> getClassroomsUsingStudentId(Long studentId);

    List<Classroom> findClassroomUsingNameAndPeriod(Long schoolId, String name, String period);
    
}
