package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.Coder;
import com.topcoder.web.ep.model.StudentClassroom;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public interface StudentClassroomDAO extends GenericDAO<StudentClassroom, StudentClassroom.Identifier> {

    public StudentClassroom findUsingStudentIdClassroomId(Long studentId, Long classroomId);
    
    public StudentClassroom findActiveUsingStudentIdClassroomId(Long studentId, Long classroomId);

    public List<Coder> findUsingProfessorIdSchoolId(Long professorId, Long schoolId);

    public List<Coder> findUsingClassroomIdStatusId(Long classroomId, Long statusId);

}
