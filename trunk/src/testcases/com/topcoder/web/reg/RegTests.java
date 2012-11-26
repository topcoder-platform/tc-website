package com.topcoder.web.reg;

import com.topcoder.web.common.dao.UserDAOTestCase;
import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 3, 2006
 */
public class RegTests extends TCHibernateTestCase {
    public static Test suite() {
        final TestSuite suite = new TestSuite();

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
*/
        suite.addTest(new TestSuite(UserDAOTestCase.class));
/*
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

        suite.addTest(new TestSuite(Address1ValidatorTestCase.class));
        suite.addTest(new TestSuite(Address2ValidatorTestCase.class));
        suite.addTest(new TestSuite(Address3ValidatorTestCase.class));
        suite.addTest(new TestSuite(CityValidatorTestCase.class));
        suite.addTest(new TestSuite(CompanyNameValidatorTestCase.class));
        suite.addTest(new TestSuite(EmailValidatorTestCase.class));
        suite.addTest(new TestSuite(EmailConfirmValidatorTestCase.class));
        suite.addTest(new TestSuite(GivenNameValidatorTestCase.class));
        suite.addTest(new TestSuite(MiddleNameValidatorTestCase.class));
        suite.addTest(new TestSuite(NotificationValidatorTestCase.class));
        suite.addTest(new TestSuite(CoderTypeValidatorTestCase.class));
        suite.addTest(new TestSuite(TimeZoneValidatorTestCase.class));
        suite.addTest(new TestSuite(PasswordConfirmValidatorTestCase.class));
        suite.addTest(new TestSuite(PasswordValidatorTestCase.class));
        suite.addTest(new TestSuite(PostalCodeValidatorTestCase.class));
        suite.addTest(new TestSuite(ProvinceValidatorTestCase.class));
        suite.addTest(new TestSuite(QuoteValidatorTestCase.class));
        suite.addTest(new TestSuite(SurnameValidatorTestCase.class));
        suite.addTest(new TestSuite(TitleValidatorTestCase.class));
        suite.addTest(new TestSuite(UserNameValidatorTestCase.class));
        suite.addTest(new TestSuite(StateValidatorTestCase.class));
        suite.addTest(new TestSuite(CountryValidatorTestCase.class));
        suite.addTest(new TestSuite(DemogMultiSelectValidatorTestCase.class));
        suite.addTest(new TestSuite(DemogSingleSelectValidatorTestCase.class));
        suite.addTest(new TestSuite(DemogFreeFormValidatorTestCase.class));
        suite.addTest(new TestSuite(GPAValidatorTestCase.class));
        suite.addTest(new TestSuite(GPAScaleValidatorTestCase.class));
        suite.addTest(new TestSuite(ResumeValidatorTestCase.class));
        suite.addTest(new TestSuite(SchoolIdValidatorTestCase.class));
        suite.addTest(new TestSuite(SchoolNameValidatorTestCase.class));
        suite.addTest(new TestSuite(ReferralDAOTestCase.class));
        suite.addTest(new TestSuite(ReferralValidatorTestCase.class));
        suite.addTest(new TestSuite(SchoolTypeValidatorTestCase.class));
        suite.addTest(new TestSuite(ReferralDAOTestCase.class));
        suite.addTest(new TestSuite(ReferralValidatorTestCase.class));
        suite.addTest(new TestSuite(TermsOfUseValidatorTestCase.class));
        suite.addTest(new TestSuite(TermsOfUseValidatorTestCase.class));
*/

//        suite.addTest(new TestSuite(DetachedTestCase.class));

        return suite;
    }
}