package com.topcoder.web.studio.dao;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public interface StudioDAOFactory {
    ContestDAO getContestDAO();


    ContestPropertyDAO getContestPropertyDAO();

    ContestStatusDAO getContestStatusDAO();

    ContestRegistrationDAO getContestRegistrationDAO();

    DocumentDAO getDocumentDAO();

    SubmissionDAO getSubmissionDAO();

    SubmissionReviewDAO getSubmissionReviewDAO();

    SubmissionTypeDAO getSubmissionTypeDAO();

    DocumentTypeDAO getDocumentTypeDAO();

    ReviewStatusDAO getReviewStatusDAO();

    PrizeTypeDAO getPrizeTypeDAO();

}
