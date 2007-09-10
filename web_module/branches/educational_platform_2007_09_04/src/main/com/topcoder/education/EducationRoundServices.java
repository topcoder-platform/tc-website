package com.topcoder.education;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import com.topcoder.education.to.AssignedProblem;
import com.topcoder.web.common.model.algo.Contest;
import com.topcoder.web.common.model.algo.Round;

public class EducationRoundServices extends BaseRoundServices {

    public Long createRound(Long classroomId, String classroomName, String roundName, List<AssignedProblem> assignedProblems, Timestamp start, Timestamp end, Integer codingLength, Boolean showOtherScores, Integer scoreType, Set languages) {
        Contest c = new Contest();
        
        c.setName(classroomName);
        c.setStartDate(start);
        c.setEndDate(end);
        c.setStatus("A");
        
        Round r = new Round();
        r.setContest(c);
        r.setName(roundName);

        return null;
    }

    public void registerInRound(Long roundId, List<Long> userIds) {
        // TODO Auto-generated method stub
        
    }

}
