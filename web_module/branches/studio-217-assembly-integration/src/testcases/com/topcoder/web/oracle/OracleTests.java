package com.topcoder.web.oracle;

import com.topcoder.web.oracle.dao.CandidateDAOTestCase;
import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 19, 2007
 */
public class OracleTests extends TCHibernateTestCase {
    public static Test suite() {
        final TestSuite suite = new TestSuite();

        suite.addTest(new TestSuite(CandidateDAOTestCase.class));
        /*
                suite.addTest(new TestSuite(PrizeTypeDAOTestCase.class));
                suite.addTest(new TestSuite(RoundStatusDAOTestCase.class));
                suite.addTest(new TestSuite(ContestStatusDAOTestCase.class));
                suite.addTest(new TestSuite(ContestTypeDAOTestCase.class));
                suite.addTest(new TestSuite(ContestDAOTestCase.class));
                suite.addTest(new TestSuite(CandidatePropertyDAOTestCase.class));
                suite.addTest(new TestSuite(CandidateDAOTestCase.class));
                suite.addTest(new TestSuite(PredictionDAOTestCase.class));
                suite.addTest(new TestSuite(CandidateRoomResultDAOTestCase.class));
                suite.addTest(new TestSuite(PredictionDAOTestCase.class));
                suite.addTest(new TestSuite(RoundDAOTestCase.class));
                suite.addTest(new TestSuite(RoomDAOTestCase.class));
                suite.addTest(new TestSuite(RoundRegistrationDAOTestCase.class));
                suite.addTest(new TestSuite(RandomAssignerTestCase.class));
                suite.addTest(new TestSuite(ScorerTestCase.class));
        */
        return suite;
    }
}
