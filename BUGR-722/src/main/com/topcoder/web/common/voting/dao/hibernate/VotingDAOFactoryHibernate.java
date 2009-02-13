package com.topcoder.web.common.voting.dao.hibernate;

import com.topcoder.web.common.voting.dao.*;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 30, 2007
 */
public class VotingDAOFactoryHibernate implements VotingDAOFactory {
    public RankBallotDAO getRankBallotDAO() {
        return new RankBallotDAOHibernate();
    }

    public CondorcetSchulzeElectionDAO getCondorcetSchulzeElectionDAO() {
        return new CondorcetSchulzeElectionDAOHibernate();
    }

    public CandidatePropertyDAO getContestPropertyDAO() {
        return new CandidatePropertyDAOHibernate();
    }

    public ElectionStatusDAO getElectionStatusDAO() {
        return new ElectionStatusDAOHibernate();
    }

    public CandidateDAO getCandidateDAO() {
        return new CandidateDAOHibernate();
    }
}
