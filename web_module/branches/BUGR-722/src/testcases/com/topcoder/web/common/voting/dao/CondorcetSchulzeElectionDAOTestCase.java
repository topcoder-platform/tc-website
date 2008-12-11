package com.topcoder.web.common.voting.dao;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.voting.Candidate;
import com.topcoder.web.common.voting.CondorcetSchulzeElection;
import com.topcoder.web.common.voting.RankBallot;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.Iterator;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 30, 2007
 */
public class CondorcetSchulzeElectionDAOTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(CondorcetSchulzeElectionDAOTestCase.class);

    public void setUp() {
        super.setUp();
    }

    public void testSaveNew() {
        CondorcetSchulzeElection e = Helper.makeElection();

        VotingDAOUtil.getFactory().getCondorcetSchulzeElectionDAO().saveOrUpdate(e);
        tearDown();
        setUp();
        CondorcetSchulzeElection e1 = VotingDAOUtil.getFactory().getCondorcetSchulzeElectionDAO().find(e.getId());
        assertFalse("new election doesn't exist", e1 == null);
        assertFalse("new election has no ballots", e1.getBallots().size() == 0);
        assertFalse("new election has no start time", e1.getStartTime() == null);
        assertFalse("new election has no end time", e1.getEndTime() == null);
        assertFalse("new election has no name", e1.getName() == null);
        assertFalse("new election has no candidates", e1.getCandidates().size() == 0);

        RankBallot temp;
        boolean foundVote = false;
        for (Iterator it = e1.getBallots().iterator(); it.hasNext() && !foundVote;) {
            temp = (RankBallot) it.next();
            foundVote |= temp.getVotes().size() > 0;
        }
        assertTrue("new election has no votes", foundVote);

        foundVote = false;
        Candidate tempC;
        for (Iterator it = e1.getCandidates().iterator(); it.hasNext() && !foundVote;) {
            tempC = (Candidate) it.next();
            foundVote |= tempC.getVotes().size() > 0;
        }
        assertTrue("new election candidates have no votes", foundVote);


    }


}
