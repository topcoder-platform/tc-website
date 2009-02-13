package com.topcoder.web.common.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class DAOTests extends TCHibernateTestCase {
    public static Test suite() {
        final TestSuite suite = new TestSuite();

        suite.addTest(new TestSuite(EventDAOTestCase.class));
/*
        suite.addTest(new TestSuite(CoderTypeDAOTestCase.class));
        suite.addTest(new TestSuite(NotificationDAOTestCase.class));
        suite.addTest(new TestSuite(StateDAOTestCase.class));
        suite.addTest(new TestSuite(FileTypeDAOTestCase.class));
        suite.addTest(new TestSuite(RegistrationTypeDAOTestCase.class));
        suite.addTest(new TestSuite(DemographicQuestionDAOTestCase.class));
        suite.addTest(new TestSuite(TeamDAOTestCase.class));
        suite.addTest(new TestSuite(TeamTypeDAOTestCase.class));
        suite.addTest(new TestSuite(DemographicAssignmentDAOTestCase.class));
        suite.addTest(new TestSuite(CountryDAOTestCase.class));
        suite.addTest(new TestSuite(UserDAOTestCase.class));
        suite.addTest(new TestSuite(TermsOfUseDAOTestCase.class));
        suite.addTest(new TestSuite(CoderDAOTestCase.class));
        suite.addTest(new TestSuite(ReferralDAOTestCase.class));
        suite.addTest(new TestSuite(SchoolDAOTestCase.class));
        suite.addTest(new TestSuite(SecurityGroupDAOTestCase.class));
        suite.addTest(new TestSuite(UserDAOTestCase.class));
        suite.addTest(new TestSuite(UserDAOTestCase.class));
        suite.addTest(new TestSuite(PreferenceGroupDAOTestCase.class));
        suite.addTest(new TestSuite(PreferenceDAOTestCase.class));
        suite.addTest(new TestSuite(PreferenceValueDAOTestCase.class));
        suite.addTest(new TestSuite(UserPreferenceDAOTestCase.class));

        suite.addTest(new TestSuite(CoderDAOTestCase.class));
        suite.addTest(new TestSuite(TimeZoneDAOTestCase.class));
        suite.addTest(new TestSuite(ContactDAOTestCase.class));
        suite.addTest(new TestSuite(CompanyDAOTestCase.class));
        suite.addTest(new TestSuite(CompanyDAOTestCase.class));
        suite.addTest(new TestSuite(SchoolTypeDAOTestCase.class));
        suite.addTest(new TestSuite(DemographicAnswerDAOTestCase.class));
*/

        return suite;
    }
}