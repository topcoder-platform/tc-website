/*
 * Copyright (C) 2005-2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio;

import com.topcoder.web.studio.controller.request.admin.DownloadSubmissionTestCase;
import com.topcoder.web.studio.controller.request.SubmitTestCase;
import com.topcoder.web.studio.dao.ContestDAOTestCase;
import com.topcoder.web.studio.dao.SubmissionTypeDAOTestCase;
import com.topcoder.web.studio.dao.SubmissionDAOTestCase;
import com.topcoder.web.studio.dao.ContestChannelDAOTestCase;
import com.topcoder.web.studio.dao.ContestRegistrationDAOTestCase;
import com.topcoder.web.studio.dao.ReviewStatusDAOTestCase;
import com.topcoder.web.studio.dao.ContestPropertyDAOTestCase;
import com.topcoder.web.studio.dao.FileTypeDAOTestCase;
import com.topcoder.web.studio.dao.SubmissionReviewDAOTestCase;
import com.topcoder.web.studio.dao.MimeTypeDAOTestCase;
import com.topcoder.web.studio.dao.ContestTypeDAOTestCase;
import com.topcoder.web.studio.dao.hibernate.ContestTypeDAOHibernateTestCase;
import com.topcoder.web.studio.dao.hibernate.ContestChannelDAOHibernateTestCase;
import com.topcoder.web.studio.dao.hibernate.ContestPropertyDAOHibernateTestCase;
import com.topcoder.web.studio.dao.hibernate.StudioDAOFactoryHibernateTestCase;
import com.topcoder.web.studio.validation.ContestNameValidatorTestCase;
import com.topcoder.web.studio.validation.FileTypeValidatorTestCase;
import com.topcoder.web.studio.validation.MaxHeightValidatorTestCase;
import com.topcoder.web.studio.validation.MinHeightValidatorTestCase;
import com.topcoder.web.studio.validation.MaxWidthValidatorTestCase;
import com.topcoder.web.studio.validation.TimeValidatorTestCase;
import com.topcoder.web.studio.validation.PlaceValidatorTestCase;
import com.topcoder.web.studio.validation.StartTimeValidatorTestCase;
import com.topcoder.web.studio.validation.EndTimeValidatorTestCase;
import com.topcoder.web.studio.validation.MinWidthValidatorTestCase;
import com.topcoder.web.studio.validation.MaxSubmissionsValidatorTestCase;
import com.topcoder.web.studio.validation.SubmissionValidatorTestCase;
import com.topcoder.web.studio.model.StudioFileTypeTestCase;
import com.topcoder.web.studio.model.ContestTypeTestCase;
import com.topcoder.web.studio.model.ContestTestCase;
import com.topcoder.web.studio.model.ContestChannelTestCase;
import com.topcoder.web.studio.util.SubmissionPresentationFilterTestCase;
import com.topcoder.web.studio.util.ZipFileAnalyzerTestCase;
import com.topcoder.web.studio.util.JarFileAnalyzerTestCase;
import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * @author dok, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class StudioTests extends TCHibernateTestCase {
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

        // Since TopCoder Studio Modifications
        suite.addTest(new TestSuite(ContestTestCase.class));
        suite.addTest(new TestSuite(StudioFileTypeTestCase.class));

        suite.addTest(new TestSuite(ContestTypeTestCase.class));
        suite.addTest(new TestSuite(ContestTypeDAOTestCase.class));
        suite.addTest(new TestSuite(ContestTypeDAOHibernateTestCase.class));

        suite.addTest(new TestSuite(ContestChannelTestCase.class));
        suite.addTest(new TestSuite(ContestChannelDAOTestCase.class));
        suite.addTest(new TestSuite(ContestChannelDAOHibernateTestCase.class));

        suite.addTest(new TestSuite(ContestPropertyDAOTestCase.class));
        suite.addTest(new TestSuite(ContestPropertyDAOHibernateTestCase.class));

        suite.addTest(new TestSuite(StudioDAOFactoryHibernateTestCase.class));

        suite.addTest(new TestSuite(SubmitTestCase.class));
        suite.addTest(new TestSuite(DownloadSubmissionTestCase.class));
        suite.addTest(new TestSuite(com.topcoder.web.studio.controller.request.DownloadSubmissionTestCase.class));

        suite.addTest(new TestSuite(SubmissionValidatorTestCase.class));

        suite.addTest(new TestSuite(SubmissionPresentationFilterTestCase.class));
        suite.addTest(new TestSuite(ZipFileAnalyzerTestCase.class));
        suite.addTest(new TestSuite(JarFileAnalyzerTestCase.class));

        return suite;
    }
}