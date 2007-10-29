package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.educ.StudentClassroom;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public interface StudentClassroomDAO extends GenericDAO<StudentClassroom, StudentClassroom.Identifier> {

    public StudentClassroom findUsingStudentIdClassroomId(Long studentId, Long classroomId);
    
    public StudentClassroom findActiveUsingStudentIdClassroomId(Long studentId, Long classroomId);

}
