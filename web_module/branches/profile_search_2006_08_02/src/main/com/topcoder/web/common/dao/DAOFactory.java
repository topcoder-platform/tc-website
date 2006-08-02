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

    ContactDAO getContactDAO();

    CountryDAO getCountryDAO();

    DemographicAnswerDAO getDemographicAnswerDAO();

    DemographicQuestionDAO getDemographicQuestionDAO();

    DemographicAssignmentDAO getDemographicAssignmentDAO();

    FileTypeDAO getFileTypeDAO();

    MemberContactMessageDAO getMemberContactMessageDAO();

    MemberContactBlackListDAO getMemberContactBlackListDAO();
    
    NotificationDAO getNotificationDAO();

    PreferenceDAO getPreferenceDAO();

    PreferenceValueDAO getPreferenceValueDAO();
    
    RegistrationTypeDAO getRegistrationTypeDAO();

    ReferralDAO getReferralDAO();

    SchoolDAO getSchoolDAO();

    SchoolTypeDAO getSchoolTypeDAO();

    SecurityGroupDAO getSecurityGroupDAO();

    StateDAO getStateDAO();

    TeamDAO getTeamDAO();

    TeamTypeDAO getTeamTypeDAO();

    TermsOfUseDAO getTermsOfUse();

    TimeZoneDAO getTimeZoneDAO();

    UserDAO getUserDAO();
    
    UserPreferenceDAO getUserPreferenceDAO();    
}
