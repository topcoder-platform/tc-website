package com.topcoder.web.common.voting.dao;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.common.voting.RankBallot;
import com.topcoder.web.common.voting.CondorcetSchulzeElection;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 30, 2007
 */
public class RankBallotDAOTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(RankBallotDAOTestCase.class);


    public void testFindUsingElectionAndUser() {
        CondorcetSchulzeElection e = Helper.makeElection();
        VotingDAOUtil.getFactory().getCondorcetSchulzeElectionDAO().saveOrUpdate(e);
        tearDown();
        setUp();
        RankBallot rb = VotingDAOUtil.getFactory().getRankBallotDAO().find(e.getId(),
                ((RankBallot) e.getBallots().iterator().next()).getUser().getId());
        assertFalse("couldn't find ballot", rb == null);
    }

    public void testFind() {
        CondorcetSchulzeElection e = Helper.makeElection();
        VotingDAOUtil.getFactory().getCondorcetSchulzeElectionDAO().saveOrUpdate(e);
        tearDown();
        setUp();
        RankBallot rb = VotingDAOUtil.getFactory().getRankBallotDAO().find(((RankBallot) e.getBallots().iterator().next()).getId());
        assertFalse("couldn't find ballot", rb == null);
    }

    public void testGetBallots() {
        CondorcetSchulzeElection e = Helper.makeElection();
        VotingDAOUtil.getFactory().getCondorcetSchulzeElectionDAO().saveOrUpdate(e);
        tearDown();
        setUp();
        List l = VotingDAOUtil.getFactory().getRankBallotDAO().getBallots(e.getId());
        assertFalse("couldn't find ballots", l == null || l.size() == 0);

    }

}





