/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.studio.dao.ContestChannelDAO;
import com.topcoder.web.studio.dao.ContestDAO;
import com.topcoder.web.studio.dao.ContestMilestonePrizeDAO;
import com.topcoder.web.studio.dao.ContestMultiRoundInformationDAO;
import com.topcoder.web.studio.dao.ContestPropertyDAO;
import com.topcoder.web.studio.dao.ContestRegistrationDAO;
import com.topcoder.web.studio.dao.ContestStatusDAO;
import com.topcoder.web.studio.dao.ContestTypeDAO;
import com.topcoder.web.studio.dao.DocumentDAO;
import com.topcoder.web.studio.dao.DocumentTypeDAO;
import com.topcoder.web.studio.dao.FileTypeDAO;
import com.topcoder.web.studio.dao.MediumDAO;
import com.topcoder.web.studio.dao.MimeTypeDAO;
import com.topcoder.web.studio.dao.PrizeTypeDAO;
import com.topcoder.web.studio.dao.ReviewStatusDAO;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dao.SubmissionReviewDAO;
import com.topcoder.web.studio.dao.SubmissionStatusDAO;
import com.topcoder.web.studio.dao.SubmissionTypeDAO;
import com.topcoder.web.studio.dao.ElectronicAffirmationDAO;

/**
 * <p>Hibernate implementation for the DAO Factory.</p>
 *
 * <p>
 *   Version 1.1 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) Change notes:
 *   <ol>
 *       Added method to get Contest Milestone Prize DAO
 *   </ol>
 *   <ol>
 *       Added method to get Contest Multi Round Information DAO
 *   </ol>
 * </p>
 * <p>
 *   Version 1.2 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) Change notes:
 *   <ol>
 *       Added method to get ElectronicAffirmation DAO
 *   </ol>
 * </p>
 * @author dok, pulky, Vitta
 * @version 1.2
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

    /**
     * <p>Gets the DAO to be used for accessing/managing contest milestone prize.</p>
     *
     * @return a <code>ContestMilestonePrizeDAO</code> to be used for accessing/managing contest milestone prize
     * in underlying persistent data store.
     * @since 1.1
     */
    public ContestMilestonePrizeDAO getContestMilestonePrizeDAO() {
        return new ContestMilestonePrizeDAOHibernate();
    }

    /**
     * <p>Gets the DAO to be used for accessing/managing contest multi round information.</p>
     *
     * @return a <code>ContestMultiRoundInformationDAO</code> to be used for accessing/managing contest multi round
     * information in underlying persistent data store.
     * @since 1.1
     */
    public ContestMultiRoundInformationDAO getContestMultiRoundInformationDAO() {
        return new ContestMultiRoundInformationDAOHibernate();
    }

    public ElectronicAffirmationDAO getElectronicAffirmationDAO() {
        return new ElectronicAffirmationDAOHibernate();
    }
}
