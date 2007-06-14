package com.topcoder.web.common.dao.querytool;

import com.topcoder.web.common.dao.*;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class DAOFactoryQueryTool implements DAOFactory {
    public AlgoRatingTypeDAO getAlgoRatingTypeDAO() {
        return null;
    }
    
    public CoderDAO getCoderDAO() {
        return null;
    }

    public CoderTypeDAO getCoderTypeDAO() {
        return null;
    }

    public CompanyDAO getCompanyDAO() {
        return null;
    }

    public CompContestDAO getCompContestDAO() {
        return null;
    }
    
    public ContactDAO getContactDAO() {
        return null;
    }
    
    public ContestPrizeDAO getContestPrizeDAO() {
        return null;
    }

    public CountryDAO getCountryDAO() {
        return null;
    }

    public DemographicAnswerDAO getDemographicAnswerDAO() {
        return null;
    }

    public DemographicQuestionDAO getDemographicQuestionDAO() {
        return null;
    }

    public DemographicAssignmentDAO getDemographicAssignmentDAO() {
        return null;
    }

    public EventDAO getEventDAO() {
        return null;
    }

    public IntroEventDAO getIntroEventDAO() {
        return null;
    }
    public IntroEventPropertyTypeDAO getIntroEventPropertyTypeDAO(){
        return null;
    }

    public EventRegistrationDAO getEventRegistrationDAO() {
        return null;
    }

    public EventTypeDAO getEventTypeDAO() {
        return null;
    }

    public FileTypeDAO getFileTypeDAO() {
        return null;
    }

    public ImageDAO getImageDAO() {
        return null;
    }

    public MemberContactMessageDAO getMemberContactMessageDAO() {
        return null;
    }

    public MemberContactBlackListDAO getMemberContactBlackListDAO() {
        return null;
    }

    public NotificationDAO getNotificationDAO() {
        return null;
    }

    public PasswordRecoveryDAO getPasswordRecoveryDAO() {
        return null;
    }

    public PreferenceDAO getPreferenceDAO() {
        return null;
    }

    public PreferenceValueDAO getPreferenceValueDAO() {
        return null;
    }

    public PreferenceGroupDAO getPreferenceGroupDAO() {
        return null;
    }

    public ProjectDAO getProjectDAO() {
        return null;
    }

    public RegistrationTypeDAO getRegistrationTypeDAO() {
        return null;
    }

    public ReferralDAO getReferralDAO() {
        return null;
    }

    public RoundDAO getRoundDAO() {
        return null;
    }

    public SchoolDAO getSchoolDAO() {
        return null;
    }

    public SchoolTypeDAO getSchoolTypeDAO() {
        return null;
    }

    public SecurityGroupDAO getSecurityGroupDAO() {
        return null;
    }

    public StateDAO getStateDAO() {
        return null;
    }

    public TeamDAO getTeamDAO() {
        return null;
    }

    public TeamTypeDAO getTeamTypeDAO() {
        return null;
    }

    public TermsOfUseDAO getTermsOfUse() {
        return null;
    }

    public QuestionTypeDAO getQuestionTypeDAO() {
        return null;
    }

    public QuestionStyleDAO getQuestionStyleDAO() {
        return null;
    }

    public TimeZoneDAO getTimeZoneDAO() {
        return null;
    }

    public UserDAO getUserDAO() {
        return null;
    }

    public UserPreferenceDAO getUserPreferenceDAO() {
        return new UserPreferenceDAOQueryTool();
    }

    public VisaLetterRequestDAO getVisaLetterRequestDAO() {
        return null;
    }

    public VisaLetterEventDAO getVisaLetterEventDAO() {
        return null;
    }

}
