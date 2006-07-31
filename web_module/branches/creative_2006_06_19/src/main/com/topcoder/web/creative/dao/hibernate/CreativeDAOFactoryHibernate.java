package com.topcoder.web.creative.dao.hibernate;

import com.topcoder.web.creative.dao.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class CreativeDAOFactoryHibernate implements CreativeDAOFactory {
    public ContestDAO getContestDAO() {
        return new ContestDAOHibernate();
    }

    public ContestPropertyDAO getContestPropertyDAO() {
        return new ContestPropertyDAOHibernate();
    }

    public ContestRegistrationDAO getContestRegistrationDAO() {
        return new ContestRegistrationDAOHibernate();
    }

    public SubmissionPathDAO getPathDAO() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
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

    public ReviewStatusDAO getReviewStatusDAO() {
        return new ReviewStatusDAOHibernate();
    }
}
