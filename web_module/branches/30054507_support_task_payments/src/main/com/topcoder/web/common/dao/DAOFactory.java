/*
 * Copyright (C) 2001 - 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao;

/**
 * <p>An interface for the DAO Factory.</p>
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
 * Version 1.3 (Release Assembly - TopCoder Password Recovery Revamp v1.0)Change notes:
 *   <ol>
 *     <li>Added {@link #getPasswordResetTokenDAO()} method.</li>
 *     <li>Added {@link #getSecondEmailRequestDAO()} method.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.4 (Release Assembly - TopCoder Email Address Management Update v1.0) Change notes:
 *   <ol>
 *     <li>Renamed <code>getSecondEmailRequestDAO</code> to {@link getEmailRequestDAO()}.</li>
 *     <li>Changed {@link getEmailRequestDAO()} to use the new {@link EmailRequestDAO} entity.</li>
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
 *      <li>Add {@link #getDocuSignEnvelopeDAO()} method to get the docusign dao instance.</li>
 * </ol>
 * </p>
 * @author dok, TCSDEVELOPER, VolodymyrK, isv, Standlove, gonia_119
 * @version 1.7
 */
public interface DAOFactory {
    /**
     * <p>Gets the instance of {@link PasswordResetTokenDAO}.</p>
     *
     * @return a <code>PasswordResetTokenDAO</code> to be used for keeping password reset token.
     * @since 1.3
     */
    PasswordResetTokenDAO getPasswordResetTokenDAO();
    
    /**
     * <p>Gets the instance of {@link EmailRequestDAO}.</p>
     *
     * @return a <code>EmailRequestDAO</code> to be used for keeping add second email token.
     * @since 1.3
     */
    EmailRequestDAO getEmailRequestDAO();
    
    AlgoRatingTypeDAO getAlgoRatingTypeDAO();

    CoderDAO getCoderDAO();

    CoderTypeDAO getCoderTypeDAO();

    CompanyDAO getCompanyDAO();

    CompContestDAO getCompContestDAO();

    ContestPrizeDAO getContestPrizeDAO();

    ContactDAO getContactDAO();

    CountryDAO getCountryDAO();

    DemographicAnswerDAO getDemographicAnswerDAO();

    DemographicQuestionDAO getDemographicQuestionDAO();

    DemographicAssignmentDAO getDemographicAssignmentDAO();

    EventDAO getEventDAO();

    ImageDAO getImageDAO();

    IntroEventDAO getIntroEventDAO();

    IntroEventPropertyTypeDAO getIntroEventPropertyTypeDAO();
	
	InvalidHandleDAO getInvalidHandleDAO();

    EventRegistrationDAO getEventRegistrationDAO();

    EventTypeDAO getEventTypeDAO();

    FileTypeDAO getFileTypeDAO();

    MemberContactMessageDAO getMemberContactMessageDAO();

    MemberContactBlackListDAO getMemberContactBlackListDAO();

    NotificationDAO getNotificationDAO();

    PasswordRecoveryDAO getPasswordRecoveryDAO();

    PathDAO getPathDAO();

    PreferenceDAO getPreferenceDAO();

    PreferenceValueDAO getPreferenceValueDAO();

    PreferenceGroupDAO getPreferenceGroupDAO();

    ProfessorStatusDAO getProfessorStatusDA0();

    ProjectDAO getProjectDAO();

    RegistrationTypeDAO getRegistrationTypeDAO();

    ReferralDAO getReferralDAO();

    RoundDAO getRoundDAO();

    SchoolDAO getSchoolDAO();

    SchoolAssociationTypeDAO getSchoolAssociationTypeDAO();

    SchoolTypeDAO getSchoolTypeDAO();

    SeasonDAO getSeasonDAO();

    SecurityGroupDAO getSecurityGroupDAO();

    StateDAO getStateDAO();

    SubmissionDAO getSubmissionDAO();

    TeamDAO getTeamDAO();

    TeamTypeDAO getTeamTypeDAO();

    TermsOfUseDAO getTermsOfUse();

    QuestionTypeDAO getQuestionTypeDAO();

    QuestionStyleDAO getQuestionStyleDAO();

    TimeZoneDAO getTimeZoneDAO();

    UserDAO getUserDAO();

    UserPreferenceDAO getUserPreferenceDAO();

    UserSchoolDAO getUserSchoolDAO();

    VisaLetterEventDAO getVisaLetterEventDAO();

    VisaLetterRequestDAO getVisaLetterRequestDAO();

    ProfessorDAO getProfessorDAO();

    PaymentDAO getPaymentDAO();

    ClassroomDAO getClassroomDAO();

    StudentClassroomDAO getStudentClassroomDAO();

    RoundTypeDAO getRoundTypeDAO();

    ContestDAO getContestDAO();

    ComponentDAO getComponentDAO();

    LanguageDAO getLanguageDAO();

    ProblemSetDAO getProblemSetDAO();

    RoomResultDAO getRoomResultDAO();

    ComponentStateDAO getComponentStateDAO();

    SystemTestResultDAO getSystemTestResultDAO();

    AlgoSubmissionDAO getAlgoSubmissionDAO();

    /**
     * This method constructs the corresponding Specification Review DAO object
     *
     * @return an instance of the <code>SpecReviewDAO</code>
     * @since 1.1
     */
    SpecReviewDAO getSpecReviewDAO();

    /**
     * This method constructs the corresponding User Permission Grant DAO object
     *
     * @return an instance of the <code>UserPermissionGrantDAO</code>
     * @since 1.1
     */
    UserPermissionGrantDAO getUserPermissionGrantDAO();

    /**
     * <p>Gets the instance of {@link GovernmentIDDAO}.</p>
     * 
     * @return a <code>GovernmentIDDAO</code> to be used for managing government IDs. 
     * @since 1.2
     */
    GovernmentIDDAO getGovernmentIdDAO();

    /**
     * Gets the instance of {@link UserSocialLoginDAO}.
     *
     * @return the dao.
     * @since 1.5
     */
    UserSocialLoginDAO getUserSocialLoginDAO();

    /**
     * Gets the instance of {@link UserApiSpinDAO}.
     *
     * @return the dao.
     * @since 1.6
     */
    UserApiSpinDAO getUserApiSpinDAO();

    /**
     * Return a new DocuSignEnvelopeDAO instance.
     * @return a new DocuSignEnvelopeDAO instance.
     * @since 1.7
     */
    DocuSignEnvelopeDAO getDocuSignEnvelopeDAO();
}
