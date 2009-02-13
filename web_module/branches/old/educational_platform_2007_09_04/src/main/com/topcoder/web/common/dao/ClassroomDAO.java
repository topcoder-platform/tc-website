package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.educ.Classroom;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public interface ClassroomDAO extends GenericDAO<Classroom, Long> {

    public List<Round> getAssignments(Long classroomId);

    public List<Round> getAssignmentsForStudent(Long classroomId, Long coderId);

	public List<Classroom>  getClassroomsUsingProfessorId(Long professorId);
    
    public List<Classroom> getClassroomsUsingStudentId(Long studentId, Long statusId);
    
}
