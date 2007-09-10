package com.topcoder.education;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import com.topcoder.education.to.AssignedProblem;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.RoundDAO;
import com.topcoder.web.common.model.algo.Contest;
import com.topcoder.web.common.model.algo.Round;

public abstract class BaseRoundServices {

    public Long createRound(Long classroomId, String contestName, String roundName, List<AssignedProblem> assignedProblems, Timestamp start, Timestamp end, Integer codingLength, Boolean showOtherScores, Integer scoreType, Set languages) {
        Contest c = createContest(contestName, start, end);
        
        Round r = new Round();
        r.setContest(c);
        r.setName(roundName);
        
        // TODO: DAO call
        
        getRoundDao().saveOrUpdate(r);

        return r.getId();
    }

    /**
     * @return
     */
    private RoundDAO getRoundDao() {
        return DAOUtil.getFactory().getRoundDAO();
    }

    /**
     * @param classroomName
     * @param start
     * @param end
     * @return
     */
    private Contest createContest(String classroomName, Timestamp start, Timestamp end) {
        Contest c = new Contest();
        
        c.setName(classroomName);
        c.setStartDate(start);
        c.setEndDate(end);
        c.setStatus("A");
        return c;
    }

    public void registerInRound(Long roundId, List<Long> userIds) {
        // TODO Auto-generated method stub
        
    }

}
