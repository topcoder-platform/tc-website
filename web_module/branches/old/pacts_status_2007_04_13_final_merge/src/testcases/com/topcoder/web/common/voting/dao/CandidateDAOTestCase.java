package com.topcoder.web.common.voting.dao;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.voting.Candidate;
import com.topcoder.web.common.voting.CondorcetSchulzeElection;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 8, 2007
 */
public class CandidateDAOTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(CondorcetSchulzeElectionDAOTestCase.class);

    public void testSaveAndFind() {
        CondorcetSchulzeElection e = Helper.makeElection();

        Candidate c = new Candidate("dumb name " + System.currentTimeMillis());
        c.setElection(e);


        VotingDAOUtil.getFactory().getCondorcetSchulzeElectionDAO().saveOrUpdate(e);
        VotingDAOUtil.getFactory().getCandidateDAO().saveOrUpdate(c);
        tearDown();
        setUp();

        assertFalse("new candidate doesn't exist", VotingDAOUtil.getFactory().getCandidateDAO().find(c.getId()) == null);


    }


}
