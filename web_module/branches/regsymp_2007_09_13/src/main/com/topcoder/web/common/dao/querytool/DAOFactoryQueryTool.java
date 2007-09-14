package com.topcoder.web.common.dao.querytool;

import com.topcoder.web.common.dao.*;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class DAOFactoryQueryTool implements DAOFactory {

    // This DAO exists because hibernate is currently not caching and we need a faster implementation

    public UserPreferenceDAO getUserPreferenceDAO() {
        return new UserPreferenceDAOQueryTool();
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
    public IntroEventPropertyTypeDAO getIntroEventPropertyTypeDAO(){
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

    public PreferenceDAO getPreferenceDAO() {
        throw new RuntimeException("Not supported");
    }

    public PreferenceValueDAO getPreferenceValueDAO() {
        throw new RuntimeException("Not supported");
    }

    public PreferenceGroupDAO getPreferenceGroupDAO() {
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

    public SchoolTypeDAO getSchoolTypeDAO() {
        throw new RuntimeException("Not supported");
    }

    public SecurityGroupDAO getSecurityGroupDAO() {
        throw new RuntimeException("Not supported");
    }

    public StateDAO getStateDAO() {
        throw new RuntimeException("Not supported");
    }
    
    public SymposiumRegDAO getSymposiumRegDAO() {
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
}
