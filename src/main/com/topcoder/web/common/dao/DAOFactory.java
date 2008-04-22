package com.topcoder.web.common.dao;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
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
}
