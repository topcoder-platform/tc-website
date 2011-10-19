/*
 * Copyright (C) 2005-2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio;

//import com.topcoder.web.studio.controller.request.admin.DownloadSubmissionTestCase;
//import com.topcoder.web.studio.controller.request.admin.EditContestTestCase;
//import com.topcoder.web.studio.controller.request.admin.AddDocumentTestCase;
//import com.topcoder.web.studio.controller.request.admin.SaveDocumentTestCase;
//import com.topcoder.web.studio.controller.request.admin.DeleteSubmissionTestCase;
//import com.topcoder.web.studio.controller.request.admin.ViewContestTestCase;
//import com.topcoder.web.studio.controller.request.SubmitTestCase;
//import com.topcoder.web.studio.controller.request.ViewSubmissionsTestCase;
import com.topcoder.web.studio.controller.request.ViewMemberProfileTestCase;
import com.topcoder.web.studio.controller.request.MemberNotFoundExceptionTestCase;
//import com.topcoder.web.studio.dao.ContestDAOTestCase;
//import com.topcoder.web.studio.dao.SubmissionTypeDAOTestCase;
//import com.topcoder.web.studio.dao.SubmissionDAOTestCase;
//import com.topcoder.web.studio.dao.ContestRegistrationDAOTestCase;
//import com.topcoder.web.studio.dao.ReviewStatusDAOTestCase;
//import com.topcoder.web.studio.dao.ContestPropertyDAOTestCase;
//import com.topcoder.web.studio.dao.FileTypeDAOTestCase;
//import com.topcoder.web.studio.dao.SubmissionReviewDAOTestCase;
//import com.topcoder.web.studio.dao.MimeTypeDAOTestCase;
//import com.topcoder.web.studio.dao.hibernate.ContestTypeDAOHibernateTestCase;
//import com.topcoder.web.studio.dao.hibernate.ContestChannelDAOHibernateTestCase;
//import com.topcoder.web.studio.dao.hibernate.ContestPropertyDAOHibernateTestCase;
//import com.topcoder.web.studio.dao.hibernate.StudioDAOFactoryHibernateTestCase;
//import com.topcoder.web.studio.dao.hibernate.MediumDAOHibernateTestCase;
//import com.topcoder.web.studio.validation.ContestNameValidatorTestCase;
//import com.topcoder.web.studio.validation.FileTypeValidatorTestCase;
//import com.topcoder.web.studio.validation.MaxHeightValidatorTestCase;
//import com.topcoder.web.studio.validation.MinHeightValidatorTestCase;
//import com.topcoder.web.studio.validation.MaxWidthValidatorTestCase;
//import com.topcoder.web.studio.validation.TimeValidatorTestCase;
//import com.topcoder.web.studio.validation.PlaceValidatorTestCase;
//import com.topcoder.web.studio.validation.StartTimeValidatorTestCase;
//import com.topcoder.web.studio.validation.EndTimeValidatorTestCase;
//import com.topcoder.web.studio.validation.MinWidthValidatorTestCase;
//import com.topcoder.web.studio.validation.MaxSubmissionsValidatorTestCase;
//import com.topcoder.web.studio.validation.SubmissionValidatorTestCase;
//import com.topcoder.web.studio.validation.ClientNameValidatorTestCase;
//import com.topcoder.web.studio.validation.WinnerAnnouncementTimeValidatorTestCase;
//import com.topcoder.web.studio.validation.MediumValidatorTestCase;
//import com.topcoder.web.studio.validation.ContestConfigValueValidatorTestCase;
//import com.topcoder.web.studio.validation.ContestTypeValidatorTestCase;
//import com.topcoder.web.studio.validation.ContestChannelValidatorTestCase;
//import com.topcoder.web.studio.model.StudioFileTypeTestCase;
//import com.topcoder.web.studio.model.ContestTypeTestCase;
//import com.topcoder.web.studio.model.ContestTestCase;
//import com.topcoder.web.studio.model.ContestChannelTestCase;
//import com.topcoder.web.studio.model.MediumTestCase;
//import com.topcoder.web.studio.model.SubmissionTestCase;
//import com.topcoder.web.studio.model.DocumentTestCase;
//import com.topcoder.web.studio.model.SubmissionImageTestCase;
//import com.topcoder.web.studio.model.SubmissionImageIdentifierTestCase;
//import com.topcoder.web.studio.util.SubmissionPresentationFilterTestCase;
//import com.topcoder.web.studio.util.ZipFileAnalyzerTestCase;
//import com.topcoder.web.studio.util.JarFileAnalyzerTestCase;
//import com.topcoder.web.studio.util.UtilTestCase;
//import com.topcoder.web.studio.view.tags.FieldRendererTestCase;
import com.topcoder.web.studio.dto.MemberProfileTestCase;
import com.topcoder.web.studio.dto.ContestStatisticsTestCase;
import com.topcoder.web.studio.view.tags.HandleTagTestCase;
import junit.framework.Test;
import junit.framework.TestSuite;

import java.io.IOException;

/**
 * <p>A test suite combining all unit test cases for the <code>TopCoder Studio Website</code> application classes.</p>
 *
 * @author dok, isv, TCSDEVELOPER
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class StudioTests extends TCHibernateTestCase {

    /**
     * <p>Performs the initialization of entire test suite.</p>
     */
    static {
        try {
            TestFilesHandler.init();
        } catch (IOException e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }

    /**
     * <p>Gets the test suite for <code>TopCoder Studio Website</code> application classes.</p>
     *
     * @return a <code>Test</code> providing the test suite for application classes.
     */
    public static Test suite() {

        final TestSuite suite = new TestSuite();

//        suite.addTest(new TestSuite(SubmissionDAOTestCase.class));
//        suite.addTest(new TestSuite(MimeTypeDAOTestCase.class));
//        suite.addTest(new TestSuite(ContestDAOTestCase.class));
//        suite.addTest(new TestSuite(FileTypeDAOTestCase.class));
//        suite.addTest(new TestSuite(ContestRegistrationDAOTestCase.class));
//        suite.addTest(new TestSuite(SubmissionTypeDAOTestCase.class));
//        suite.addTest(new TestSuite(ReviewStatusDAOTestCase.class));
//        suite.addTest(new TestSuite(SubmissionReviewDAOTestCase.class));
//
//        suite.addTest(new TestSuite(TimeValidatorTestCase.class));
//        suite.addTest(new TestSuite(EndTimeValidatorTestCase.class));
//        suite.addTest(new TestSuite(StartTimeValidatorTestCase.class));
//        suite.addTest(new TestSuite(ContestNameValidatorTestCase.class));
//        suite.addTest(new TestSuite(PlaceValidatorTestCase.class));
//        suite.addTest(new TestSuite(MinWidthValidatorTestCase.class));
//        suite.addTest(new TestSuite(MaxWidthValidatorTestCase.class));
//        suite.addTest(new TestSuite(MinHeightValidatorTestCase.class));
//        suite.addTest(new TestSuite(MaxHeightValidatorTestCase.class));
//        suite.addTest(new TestSuite(FileTypeValidatorTestCase.class));
//        suite.addTest(new TestSuite(MaxSubmissionsValidatorTestCase.class));

        // Since TopCoder Studio Modifications
//        suite.addTest(new TestSuite(ContestTestCase.class));
//        suite.addTest(new TestSuite(StudioFileTypeTestCase.class));
//        suite.addTest(new TestSuite(ContestTypeTestCase.class));
//        suite.addTest(new TestSuite(ContestTypeDAOHibernateTestCase.class));
//        suite.addTest(new TestSuite(ContestChannelTestCase.class));
//        suite.addTest(new TestSuite(ContestChannelDAOHibernateTestCase.class));
//        suite.addTest(new TestSuite(ContestPropertyDAOTestCase.class));
//        suite.addTest(new TestSuite(ContestPropertyDAOHibernateTestCase.class));
//        suite.addTest(new TestSuite(StudioDAOFactoryHibernateTestCase.class));
//        suite.addTest(new TestSuite(SubmitTestCase.class));
//        suite.addTest(new TestSuite(DownloadSubmissionTestCase.class));
//        suite.addTest(new TestSuite(com.topcoder.web.studio.controller.request.DownloadSubmissionTestCase.class));
//        suite.addTest(new TestSuite(SubmissionValidatorTestCase.class));
//        suite.addTest(new TestSuite(SubmissionPresentationFilterTestCase.class));
//        suite.addTest(new TestSuite(ZipFileAnalyzerTestCase.class));
//        suite.addTest(new TestSuite(JarFileAnalyzerTestCase.class));

        // Since TopCoder Studio Modifications v2
//        suite.addTest(new TestSuite(ClientNameValidatorTestCase.class));
//        suite.addTest(new TestSuite(WinnerAnnouncementTimeValidatorTestCase.class));
//        suite.addTest(new TestSuite(EditContestTestCase.class));
//        suite.addTest(new TestSuite(MediumTestCase.class));
//        suite.addTest(new TestSuite(MediumDAOHibernateTestCase.class));
//        suite.addTest(new TestSuite(MediumValidatorTestCase.class));
//        suite.addTest(new TestSuite(ContestConfigValueValidatorTestCase.class));
//        suite.addTest(new TestSuite(DeleteSubmissionTestCase.class));
//        suite.addTest(new TestSuite(SubmissionTestCase.class));
//        suite.addTest(new TestSuite(ContestTypeValidatorTestCase.class));
//        suite.addTest(new TestSuite(ContestChannelValidatorTestCase.class));
//        suite.addTest(new TestSuite(ViewContestTestCase.class));
//        suite.addTest(new TestSuite(FieldRendererTestCase.class));
//        suite.addTest(new TestSuite(DocumentTestCase.class));
//        suite.addTest(new TestSuite(AddDocumentTestCase.class));
//        suite.addTest(new TestSuite(SaveDocumentTestCase.class));
//        suite.addTest(new TestSuite(ViewSubmissionsTestCase.class));
//        suite.addTest(new TestSuite(UtilTestCase.class));

        // Since Studio Submission Slideshow
//        suite.addTest(new TestSuite(SubmissionImageTestCase.class));
//        suite.addTest(new TestSuite(SubmissionImageIdentifierTestCase.class));

        // Since Stdio Member Profile assembly
        suite.addTest(new TestSuite(MemberProfileTestCase.class));
        suite.addTest(new TestSuite(ContestStatisticsTestCase.class));
        suite.addTest(new TestSuite(MemberNotFoundExceptionTestCase.class));
        suite.addTest(new TestSuite(ViewMemberProfileTestCase.class));
        suite.addTest(new TestSuite(HandleTagTestCase.class));

        return suite;
    }
}