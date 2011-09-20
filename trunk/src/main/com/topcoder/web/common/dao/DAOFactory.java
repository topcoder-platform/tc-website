/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
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
 * @author dok, TCSDEVELOPER, VolodymyrK
 * @version 1.1
 */
public interface DAOFactory {
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

}
