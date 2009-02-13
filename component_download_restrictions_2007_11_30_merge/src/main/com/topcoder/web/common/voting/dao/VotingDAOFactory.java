package com.topcoder.web.common.voting.dao;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 30, 2007
 */
public interface VotingDAOFactory {
    RankBallotDAO getRankBallotDAO();

    CondorcetSchulzeElectionDAO getCondorcetSchulzeElectionDAO();

    CandidatePropertyDAO getContestPropertyDAO();

    ElectionStatusDAO getElectionStatusDAO();

    CandidateDAO getCandidateDAO();
}
