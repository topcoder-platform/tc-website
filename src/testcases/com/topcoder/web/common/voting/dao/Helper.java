package com.topcoder.web.common.voting.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.voting.*;

import java.sql.Timestamp;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 31, 2007
 */
public class Helper {
    static CondorcetSchulzeElection makeElection() {
        CondorcetSchulzeElection e = new CondorcetSchulzeElection();
        e.setName("test" + System.currentTimeMillis());
        e.setEndTime(new Timestamp(System.currentTimeMillis()));
        e.setStartTime(new Timestamp(System.currentTimeMillis()));

        CandidateInfo ci;

        Candidate c;
        c = new Candidate("candidate1");
        c.setElection(e);
        ci = new CandidateInfo();
        ci.setValue("hell in a hand basket1");
        ci.getId().setProperty(VotingDAOUtil.getFactory().getContestPropertyDAO().find(new Integer(1)));
        ci.getId().setCandidate(c);
        c.getInfo().add(ci);
        e.getCandidates().add(c);
        c = new Candidate("candidate2");
        c.setElection(e);
        ci = new CandidateInfo();
        ci.setValue("hell in a hand basket2");
        ci.getId().setProperty(VotingDAOUtil.getFactory().getContestPropertyDAO().find(new Integer(1)));
        ci.getId().setCandidate(c);
        c.getInfo().add(ci);
        e.getCandidates().add(c);
        c = new Candidate("candidate3");
        c.setElection(e);
        ci = new CandidateInfo();
        ci.setValue("hell in a hand basket3");
        ci.getId().setProperty(VotingDAOUtil.getFactory().getContestPropertyDAO().find(new Integer(1)));
        ci.getId().setCandidate(c);
        c.getInfo().add(ci);
        e.getCandidates().add(c);
        c = new Candidate("candidate4");
        c.setElection(e);
        ci = new CandidateInfo();
        ci.setValue("hell in a hand basket4");
        ci.getId().setProperty(VotingDAOUtil.getFactory().getContestPropertyDAO().find(new Integer(1)));
        ci.getId().setCandidate(c);
        c.getInfo().add(ci);
        e.getCandidates().add(c);
        c = new Candidate("candidate5");
        c.setElection(e);
        ci = new CandidateInfo();
        ci.setValue("hell in a hand basket5");
        ci.getId().setProperty(VotingDAOUtil.getFactory().getContestPropertyDAO().find(new Integer(1)));
        ci.getId().setCandidate(c);
        c.getInfo().add(ci);
        e.getCandidates().add(c);


        User u = DAOUtil.getFactory().getUserDAO().find("dokkah", true);
        RankBallot b = new RankBallot(e, u);
        e.getBallots().add(b);


        Vote v = new Vote();
        v.getId().setCandidate(c);
        v.getId().setBallot(b);
        v.setRank(new Integer(1));
        b.getVotes().add(v);
        //c.getVotes().add(v);

        return e;

    }
}
