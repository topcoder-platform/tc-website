package com.topcoder.web.reg.dao;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface DAOFactory {
    CoderDAO getCoderDAO();
    CoderTypeDAO getCoderTypeDAO();
    CompanyDAO getCompanyDAO();
    ContactDAO getContactDAO();
    CountryDAO getCountryDAO();
    DemographicAnswerDAO getDemographicAnswerDAO();
    DemographicQuestionDAO getDemographicQuestionDAO();
    NotificationDAO getNotificationDAO();
    RegistrationTypeDAO getRegistrationTypeDAO();
    SchoolDAO getSchoolDAO();
    StateDAO getStateDAO();
    TimeZoneDAO getTimeZoneDAO();
    UserDAO getUserDAO();
}
