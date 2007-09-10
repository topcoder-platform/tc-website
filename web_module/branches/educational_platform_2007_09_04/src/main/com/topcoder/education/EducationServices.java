package com.topcoder.education;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import com.topcoder.education.to.AssignedProblem;
import com.topcoder.education.to.Classroom;

public class EducationServices {
    
    public void createAssignment(String name, Long professorId, Long classroomId, List<AssignedProblem> assignedProblems, 
            List<Long> userIds, Timestamp start, Timestamp end, Integer codingLength, Boolean showOtherScores, 
            Integer scoreType, Set languages) {

        // check if the professor belongs to the classroom
        // check if users ids are students of the course
        // check params
        
        String classroomName = getClassroom(classroomId).getName();
        
        
        // create round
        EducationRoundServices ers = EducationRoundServicesLocator.getService();
        
        
        // TODO: change to properties
        Long roundId = ers.createRound(classroomId, classroomName, name, assignedProblems, start, end, codingLength, showOtherScores, scoreType, languages)
        
        ers.registerInRound(roundId, userIds);
    }

    private Classroom getClassroom(Long classroomId) {
        // TODO Auto-generated method stub
        return null;
    }
}
