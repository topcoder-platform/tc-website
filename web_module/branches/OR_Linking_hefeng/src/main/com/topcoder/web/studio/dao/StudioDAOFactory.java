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

    FileTypeDAO getFileTypeDAO();

    MimeTypeDAO getMimeTypeDAO();

    SubmissionStatusDAO getSubmissionStatusDAO();
    
    /**
     * <p>Gets the DAO to be used for accessing/managing studio contest types.</p>
     *
     * @return a <code>ContestTypeDAO</code> to be used for accessing/managing contest types in underlying persistent
     *         data store.
     * @since TopCoder Studio Modifications Assembly
     */
    ContestTypeDAO getContestTypeDAO();

    /**
     * <p>Gets the DAO to be used for accessing/managing studio contest channels.</p>
     *
     * @return a <code>ContestChannelDAO</code> to be used for accessing/managing contest channels in underlying
     *         persistent data store.
     * @since TopCoder Studio Modifications Assembly
     */
    ContestChannelDAO getContestChannelDAO();

    /**
     * <p>Gets the DAO to be used for accessing/managing contest submission medium types.</p>
     *
     * @return a <code>MediumDAO</code> to be used for accessing/managing contest submission medium types in underlying
     *         persistent data store.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    MediumDAO getMediumDAO();
}
