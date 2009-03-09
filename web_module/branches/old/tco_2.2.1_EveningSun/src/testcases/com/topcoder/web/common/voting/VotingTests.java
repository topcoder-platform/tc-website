package com.topcoder.web.common.voting;

import com.topcoder.web.common.voting.dao.CandidateDAOTestCase;
import com.topcoder.web.common.voting.dao.CandidatePropertyDAOTestCase;
import com.topcoder.web.common.voting.dao.CondorcetSchulzeElectionDAOTestCase;
import com.topcoder.web.common.voting.dao.RankBallotDAOTestCase;
import com.topcoder.web.reg.TCHibernateTestCase;
import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 30, 2007
 */
public class VotingTests extends TCHibernateTestCase {
    public static Test suite() {
        final TestSuite suite = new TestSuite();

        suite.addTest(new TestSuite(CandidatePropertyDAOTestCase.class));
        suite.addTest(new TestSuite(RankBallotDAOTestCase.class));
        suite.addTest(new TestSuite(CondorcetSchulzeElectionDAOTestCase.class));
        suite.addTest(new TestSuite(CondorcetSchulzeTestCase.class));
        suite.addTest(new TestSuite(CandidateDAOTestCase.class));

        return suite;
    }
}