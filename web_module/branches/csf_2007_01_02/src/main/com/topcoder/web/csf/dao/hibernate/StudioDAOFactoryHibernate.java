package com.topcoder.web.csf.dao.hibernate;

import com.topcoder.web.studio.dao.*;
import com.topcoder.web.studio.dao.hibernate.*;
import com.topcoder.web.studio.dao.hibernate.ContestPropertyDAOHibernate;
import com.topcoder.web.studio.dao.hibernate.ContestStatusDAOHibernate;
import com.topcoder.web.studio.dao.hibernate.ContestRegistrationDAOHibernate;
import com.topcoder.web.studio.dao.hibernate.DocumentDAOHibernate;
import com.topcoder.web.studio.dao.hibernate.DocumentTypeDAOHibernate;
import com.topcoder.web.studio.dao.hibernate.ReviewStatusDAOHibernate;
import com.topcoder.web.studio.dao.hibernate.PrizeTypeDAOHibernate;
import com.topcoder.web.studio.dao.hibernate.FileTypeDAOHibernate;
import com.topcoder.web.studio.dao.hibernate.MimeTypeDAOHibernate;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class StudioDAOFactoryHibernate implements StudioDAOFactory {
    public ContestDAO getContestDAO() {
        return new com.topcoder.web.studio.dao.hibernate.ContestDAOHibernate();
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
