/*
 * Copyright (C) 2001 - 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.querytool;

import com.topcoder.web.common.dao.*;

/**
 * <p>Query Tool implementation for the DAO Factory.</p>
 *
 * <p>
 *   Version 1.1 (Studio Release Assembly - Spec Review Sign up page v1.0) Change notes:
 *   <ol>
 *       Added method to get Specification Review DAO
 *   </ol>
 *   <ol>
 *       Added method to get User Permission Grant DAO
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2 Change notes:
 *   <ol>
 *     <li>Added {@link #getGovernmentIdDAO()} method.</li>
 *   </ol>
 * </p>
 * <p>
 * Version 1.3 (Release Assembly - TopCoder Password Recovery Revamp v1.0)Change notes:
 *   <ol>
 *     <li>Added {@link #getPasswordResetTokenDAO()} method.</li>
 *     <li>Added {@link #getSecondEmailRequestDAO()} method.</li>
 *   </ol>
 * </p>
 * <p>
 * Version 1.4 (Release Assembly - TopCoder Email Management Update v1.0)Change notes:
 *   <ol>
 *     <li>Renamed <code>getSecondEmailRequestDAO</code> to {@link getEmailRequestDAO()}.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.5 (Release Assembly - Social Login Linking for Existing User) Change notes:
 *   <ol>
 *      <li>Added {@link #getUserSocialLoginDAO()} method.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.6 (Release Assembly - Porting CS Mashathon pages to TopCoder website) Change notes:
 *   <ol>
 *      <li>Added {@link #getUserApiSpinDAO()} method.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Changes in version 1.7 (Module Assembly - DocuSign Integration v1.0):
 * <ol>
 *      <li>Add {@link #getDocuSignEnvelopeDAO()} method with no implementation of interface.</li>
 * </ol>
 * </p>
 * @author pulky, TCSDEVELOPER, isv, Standlove, gonia_119
 * @version 1.7
 */
public class DAOFactoryQueryTool implements DAOFactory {

    // This DAO exists because hibernate is currently not caching and we need a faster implementation

    public UserPreferenceDAO getUserPreferenceDAO() {
        return new UserPreferenceDAOQueryTool();
    }
	
	// The DAO for retrieving invalid handles
	public InvalidHandleDAO getInvalidHandleDAO(){
		return new InvalidHandleDAOQueryTool();
	}

    // The rest of the DAOs are not supported

    public AlgoRatingTypeDAO getAlgoRatingTypeDAO() {
        throw new RuntimeException("Not supported");
    }

    public CoderDAO getCoderDAO() {
        throw new RuntimeException("Not supported");
    }

    public CoderTypeDAO getCoderTypeDAO() {
        throw new RuntimeException("Not supported");
    }

    public CompanyDAO getCompanyDAO() {
        throw new RuntimeException("Not supported");
    }

    public CompContestDAO getCompContestDAO() {
        throw new RuntimeException("Not supported");
    }

    public ContactDAO getContactDAO() {
        throw new RuntimeException("Not supported");
    }

    public ContestPrizeDAO getContestPrizeDAO() {
        throw new RuntimeException("Not supported");
    }

    public CountryDAO getCountryDAO() {
        throw new RuntimeException("Not supported");
    }

    public DemographicAnswerDAO getDemographicAnswerDAO() {
        throw new RuntimeException("Not supported");
    }

    public DemographicQuestionDAO getDemographicQuestionDAO() {
        throw new RuntimeException("Not supported");
    }

    public DemographicAssignmentDAO getDemographicAssignmentDAO() {
        throw new RuntimeException("Not supported");
    }

    public EventDAO getEventDAO() {
        throw new RuntimeException("Not supported");
    }

    public IntroEventDAO getIntroEventDAO() {
        throw new RuntimeException("Not supported");
    }

    public IntroEventPropertyTypeDAO getIntroEventPropertyTypeDAO() {
        throw new RuntimeException("Not supported");
    }

    public EventRegistrationDAO getEventRegistrationDAO() {
        throw new RuntimeException("Not supported");
    }

    public EventTypeDAO getEventTypeDAO() {
        throw new RuntimeException("Not supported");
    }

    public FileTypeDAO getFileTypeDAO() {
        throw new RuntimeException("Not supported");
    }

    public ImageDAO getImageDAO() {
        throw new RuntimeException("Not supported");
    }

    public MemberContactMessageDAO getMemberContactMessageDAO() {
        throw new RuntimeException("Not supported");
    }

    public MemberContactBlackListDAO getMemberContactBlackListDAO() {
        throw new RuntimeException("Not supported");
    }

    public NotificationDAO getNotificationDAO() {
        throw new RuntimeException("Not supported");
    }

    public PasswordRecoveryDAO getPasswordRecoveryDAO() {
        throw new RuntimeException("Not supported");
    }

    public PathDAO getPathDAO() {
        throw new RuntimeException("Not supported");
    }

    public PreferenceDAO getPreferenceDAO() {
        throw new RuntimeException("Not supported");
    }

    public PreferenceValueDAO getPreferenceValueDAO() {
        throw new RuntimeException("Not supported");
    }

    public PreferenceGroupDAO getPreferenceGroupDAO() {
        throw new RuntimeException("Not supported");
    }

    public ProfessorStatusDAO getProfessorStatusDA0() {
        throw new RuntimeException("Not supported");
    }

    public ProjectDAO getProjectDAO() {
        throw new RuntimeException("Not supported");
    }

    public RegistrationTypeDAO getRegistrationTypeDAO() {
        throw new RuntimeException("Not supported");
    }

    public ReferralDAO getReferralDAO() {
        throw new RuntimeException("Not supported");
    }

    public RoundDAO getRoundDAO() {
        throw new RuntimeException("Not supported");
    }

    public SchoolDAO getSchoolDAO() {
        throw new RuntimeException("Not supported");
    }

    public SchoolAssociationTypeDAO getSchoolAssociationTypeDAO() {
        throw new RuntimeException("Not supported");
    }

    public SchoolTypeDAO getSchoolTypeDAO() {
        throw new RuntimeException("Not supported");
    }

    public SecurityGroupDAO getSecurityGroupDAO() {
        throw new RuntimeException("Not supported");
    }

    public StateDAO getStateDAO() {
        throw new RuntimeException("Not supported");
    }

    public TeamDAO getTeamDAO() {
        throw new RuntimeException("Not supported");
    }

    public TeamTypeDAO getTeamTypeDAO() {
        throw new RuntimeException("Not supported");
    }

    public TermsOfUseDAO getTermsOfUse() {
        throw new RuntimeException("Not supported");
    }

    public QuestionTypeDAO getQuestionTypeDAO() {
        throw new RuntimeException("Not supported");
    }

    public QuestionStyleDAO getQuestionStyleDAO() {
        throw new RuntimeException("Not supported");
    }

    public TimeZoneDAO getTimeZoneDAO() {
        throw new RuntimeException("Not supported");
    }

    public UserDAO getUserDAO() {
        throw new RuntimeException("Not supported");
    }

    public VisaLetterRequestDAO getVisaLetterRequestDAO() {
        throw new RuntimeException("Not supported");
    }

    public VisaLetterEventDAO getVisaLetterEventDAO() {
        throw new RuntimeException("Not supported");
    }

    public SeasonDAO getSeasonDAO() {
        throw new RuntimeException("Not supported");
    }

    public SubmissionDAO getSubmissionDAO() {
        throw new RuntimeException("Not supported");
    }

    public ProfessorDAO getProfessorDAO() {
        throw new RuntimeException("Not supported");
    }

    public PaymentDAO getPaymentDAO() {
        throw new RuntimeException("Not supported");
    }

    public ClassroomDAO getClassroomDAO() {
        throw new RuntimeException("Not supported");
    }

    public StudentClassroomDAO getStudentClassroomDAO() {
        throw new RuntimeException("Not supported");
    }

    public RoundTypeDAO getRoundTypeDAO() {
        throw new RuntimeException("Not supported");
    }

    public ContestDAO getContestDAO() {
        throw new RuntimeException("Not supported");
    }

    public ComponentDAO getComponentDAO() {
        throw new RuntimeException("Not supported");
    }

    public LanguageDAO getLanguageDAO() {
        throw new RuntimeException("Not supported");
    }

    public ProblemSetDAO getProblemSetDAO() {
        throw new RuntimeException("Not supported");
    }

    public RoomResultDAO getRoomResultDAO() {
        throw new RuntimeException("Not supported");
    }

    public ComponentStateDAO getComponentStateDAO() {
        throw new RuntimeException("Not supported");
    }

    public SystemTestResultDAO getSystemTestResultDAO() {
        throw new RuntimeException("Not supported");
    }

    public AlgoSubmissionDAO getAlgoSubmissionDAO() {
        throw new RuntimeException("Not supported");
    }

    public UserSchoolDAO getUserSchoolDAO() {
        throw new RuntimeException("Not supported");
    }

    /**
     * This method constructs the corresponding Specification Review DAO object
     *
     * Note: this is not currently supported
     *
     * @return Query Tool implementation of the <code>SpecReviewDAO</code>
     * @throws RuntimeException always since this DAO is not currently supported
     * @since 1.1
     */
    public SpecReviewDAO getSpecReviewDAO() {
        throw new RuntimeException("Not supported");
    }

    /**
     * This method constructs the corresponding User Permission Grant DAO object
     *
     * Note: this is not currently supported
     *
     * @return Query Tool implementation of the <code>UserPermissionGrantDAO</code>
     * @throws RuntimeException always since this DAO is not currently supported
     * @since 1.1
     */
    public UserPermissionGrantDAO getUserPermissionGrantDAO() {
        throw new RuntimeException("Not supported");
    }

    /**
     * <p>Gets the instance of {@link GovernmentIDDAO}.</p>
     *
     * @return a <code>GovernmentIDDAO</code> to be used for managing government IDs.
     * @since 1.2
     */
    public GovernmentIDDAO getGovernmentIdDAO() {
        throw new RuntimeException("Not supported");
    }

    /**
     * Gets the instance of {@link UserSocialLoginDAO}.
     *
     * @return nothing, will throw exception.
     * @since 1.5
     */
    public UserSocialLoginDAO getUserSocialLoginDAO() {
        throw new RuntimeException("Not supported");
    }

    /**
     * Gets the instance of {@link UserApiSpinDAO}.
     *
     * @return nothing, will throw exception.
     * @since 1.6
     */
    public UserApiSpinDAO getUserApiSpinDAO() {
        throw new RuntimeException("Not supported");
    }

    /**
     * <p>Gets the instance of {@link PasswordResetTokenDAO}.</p>
     *
     * @return a <code>PasswordResetTokenDAO</code> to be used for keeping password reset token.
     * @since 1.3
     */
    public PasswordResetTokenDAO getPasswordResetTokenDAO() {
        throw new RuntimeException("Not supported");
    }

    /**
     * <p>Gets the instance of {@link EmailRequestDAO}.</p>
     *
     * @return a <code>EmailRequestDAO</code> to be used for keeping add email token.
     * @since 1.4
     */
    public EmailRequestDAO getEmailRequestDAO() {
        throw new RuntimeException("Not supported");
    }

    /**
     * Return a new DocuSignEnvelopeDAO instance.
     * @return nothing, will throw exception.
     * @throws RuntimeException currently it will always throw runtime exception.
     * @since 1.7
     */
    public DocuSignEnvelopeDAO getDocuSignEnvelopeDAO() {
        throw new RuntimeException("Not supported");
    }
}
