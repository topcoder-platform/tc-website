package com.topcoder.web.csf.dao.hibernate;

import com.topcoder.web.csf.dao.*;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class CSFDAOFactoryHibernate implements CSFDAOFactory {
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
}
