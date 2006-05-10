package com.topcoder.web.reg;

import com.topcoder.web.reg.dao.*;
import com.topcoder.web.reg.validation.*;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 3, 2006
 */
public class RegTests extends TestCase {
    public static Test suite() {
        final TestSuite suite = new TestSuite();

        //dao


        suite.addTest(new TestSuite(CoderDAOTestCase.class));
        suite.addTest(new TestSuite(CoderTypeDAOTestCase.class));
        suite.addTest(new TestSuite(CountryDAOTestCase.class));
        suite.addTest(new TestSuite(RegistrationTypeDAOTestCase.class));
        suite.addTest(new TestSuite(SchoolDAOTestCase.class));
        suite.addTest(new TestSuite(StateDAOTestCase.class));
        suite.addTest(new TestSuite(TimeZoneDAOTestCase.class));
        suite.addTest(new TestSuite(UserDAOTestCase.class));
        suite.addTest(new TestSuite(CoderDAOTestCase.class));
        suite.addTest(new TestSuite(ContactDAOTestCase.class));
        suite.addTest(new TestSuite(CompanyDAOTestCase.class));

        suite.addTest(new TestSuite(Address1ValidatorTestCase.class));
        suite.addTest(new TestSuite(Address2ValidatorTestCase.class));
        suite.addTest(new TestSuite(Address3ValidatorTestCase.class));
        suite.addTest(new TestSuite(CityValidatorTestCase.class));
        suite.addTest(new TestSuite(CompanyNameValidatorTestCase.class));
        suite.addTest(new TestSuite(EmailValidatorTestCase.class));
        suite.addTest(new TestSuite(EmailConfirmValidatorTestCase.class));
        suite.addTest(new TestSuite(GivenNameValidatorTestCase.class));
        suite.addTest(new TestSuite(MiddleNameValidatorTestCase.class));
        suite.addTest(new TestSuite(PasswordConfirmValidatorTestCase.class));
        suite.addTest(new TestSuite(PasswordValidatorTestCase.class));
        suite.addTest(new TestSuite(PostalCodeValidatorTestCase.class));
        suite.addTest(new TestSuite(ProvinceValidatorTestCase.class));
        suite.addTest(new TestSuite(QuoteValidatorTestCase.class));
        suite.addTest(new TestSuite(SurnameValidatorTestCase.class));
        suite.addTest(new TestSuite(TitleValidatorTestCase.class));
        suite.addTest(new TestSuite(UserNameValidatorTestCase.class));

        return suite;
    }
}
