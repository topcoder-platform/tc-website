package com.topcoder.web.openaim;

import com.topcoder.web.openaim.dao.ContestDAOTestCase;
import com.topcoder.web.openaim.dao.ContestRegistrationDAOTestCase;
import com.topcoder.web.openaim.dao.FileTypeDAOTestCase;
import com.topcoder.web.openaim.dao.MimeTypeDAOTestCase;
import com.topcoder.web.openaim.dao.ReviewStatusDAOTestCase;
import com.topcoder.web.openaim.dao.SubmissionDAOTestCase;
import com.topcoder.web.openaim.dao.SubmissionReviewDAOTestCase;
import com.topcoder.web.openaim.dao.SubmissionTypeDAOTestCase;
import com.topcoder.web.openaim.validation.*;
import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class OpenAIMTests extends TCHibernateTestCase {
    public static Test suite() {
        final TestSuite suite = new TestSuite();

        suite.addTest(new TestSuite(SubmissionDAOTestCase.class));

                suite.addTest(new TestSuite(MimeTypeDAOTestCase.class));
                suite.addTest(new TestSuite(ContestDAOTestCase.class));
                suite.addTest(new TestSuite(FileTypeDAOTestCase.class));
                suite.addTest(new TestSuite(ContestRegistrationDAOTestCase.class));
                suite.addTest(new TestSuite(SubmissionTypeDAOTestCase.class));
                suite.addTest(new TestSuite(ReviewStatusDAOTestCase.class));
                suite.addTest(new TestSuite(SubmissionReviewDAOTestCase.class));

                suite.addTest(new TestSuite(TimeValidatorTestCase.class));
                suite.addTest(new TestSuite(EndTimeValidatorTestCase.class));
                suite.addTest(new TestSuite(StartTimeValidatorTestCase.class));
                suite.addTest(new TestSuite(ContestNameValidatorTestCase.class));
                suite.addTest(new TestSuite(PlaceValidatorTestCase.class));
                suite.addTest(new TestSuite(MinWidthValidatorTestCase.class));
                suite.addTest(new TestSuite(MaxWidthValidatorTestCase.class));
                suite.addTest(new TestSuite(MinHeightValidatorTestCase.class));
                suite.addTest(new TestSuite(MaxHeightValidatorTestCase.class));
                suite.addTest(new TestSuite(FileTypeValidatorTestCase.class));
                suite.addTest(new TestSuite(MaxSubmissionsValidatorTestCase.class));
        return suite;
    }
}