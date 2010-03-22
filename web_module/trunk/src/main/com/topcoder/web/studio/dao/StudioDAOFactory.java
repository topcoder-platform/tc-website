/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

/**
 * <p>An interface for the DAO Factory.</p>
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
 * @author dok, pulky, VItta
 * @version 1.2
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

    /**
     * <p>Gets the DAO to be used for accessing/managing contest milestone prize.</p>
     *
     * @return a <code>ContestMilestonePrizeDAO</code> to be used for accessing/managing contest milestone prize
     * in underlying persistent data store.
     * @since 1.1
     */
    ContestMilestonePrizeDAO getContestMilestonePrizeDAO();

    /**
     * <p>Gets the DAO to be used for accessing/managing contest multi round information.</p>
     *
     * @return a <code>ContestMultiRoundInformationDAO</code> to be used for accessing/managing contest multi round
     * information in underlying persistent data store.
     * @since 1.1
     */
    ContestMultiRoundInformationDAO getContestMultiRoundInformationDAO();
	
	ElectronicAffirmationDAO getElectronicAffirmationDAO();

}
