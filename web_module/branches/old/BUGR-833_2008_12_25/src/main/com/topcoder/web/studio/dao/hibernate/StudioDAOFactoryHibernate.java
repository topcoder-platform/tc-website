package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.studio.dao.*;

/**
 * @author dok, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class StudioDAOFactoryHibernate implements StudioDAOFactory {
    public ContestDAO getContestDAO() {
        return new ContestDAOHibernate();
    }

    public ContestPropertyDAO getContestPropertyDAO() {
        return new ContestPropertyDAOHibernate();
    }

    public ContestStatusDAO getContestStatusDAO() {
        return new ContestStatusDAOHibernate();
    }

    public ContestRegistrationDAO getContestRegistrationDAO() {
        return new ContestRegistrationDAOHibernate();
    }

    public DocumentDAO getDocumentDAO() {
        return new DocumentDAOHibernate();
    }

    public SubmissionDAO getSubmissionDAO() {
        return new SubmissionDAOHibernate();
    }

    public SubmissionReviewDAO getSubmissionReviewDAO() {
        return new SubmissionReviewDAOHibernate();
    }

    public SubmissionTypeDAO getSubmissionTypeDAO() {
        return new SubmissionTypeDAOHibernate();
    }

    public DocumentTypeDAO getDocumentTypeDAO() {
        return new DocumentTypeDAOHibernate();
    }

    public ReviewStatusDAO getReviewStatusDAO() {
        return new ReviewStatusDAOHibernate();
    }

    public PrizeTypeDAO getPrizeTypeDAO() {
        return new PrizeTypeDAOHibernate();
    }

    public FileTypeDAO getFileTypeDAO() {
        return new FileTypeDAOHibernate();
    }

    public MimeTypeDAO getMimeTypeDAO() {
        return new MimeTypeDAOHibernate();
    }

    public SubmissionStatusDAO getSubmissionStatusDAO() {
        return new SubmissionStatusDAOHibernate();
    }

    /**
     * <p>Gets the DAO to be used for accessing/managing studio contest types.</p>
     *
     * @return a <code>ContestTypeDAO</code> to be used for accessing/managing contest types in underlying persistent
     *         data store.
     * @since TopCoder Studio Modifications Assembly (Req# 5.1)
     */
    public ContestTypeDAO getContestTypeDAO() {
        return new ContestTypeDAOHibernate();
    }

    /**
     * <p>Gets the DAO to be used for accessing/managing studio contest channels.</p>
     *
     * @return a <code>ContestChannelDAO</code> to be used for accessing/managing contest channels in underlying
     *         persistent data store.
     * @since TopCoder Studio Modifications Assembly (Req# 5.2)
     */
    public ContestChannelDAO getContestChannelDAO() {
        return new ContestChannelDAOHibernate();
    }

    /**
     * <p>Gets the DAO to be used for accessing/managing contest submission medium types.</p>
     *
     * @return a <code>MediumDAO</code> to be used for accessing/managing contest submission medium types in underlying
     *         persistent data store.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public MediumDAO getMediumDAO() {
        return new MediumDAOHibernate();
    }
}
