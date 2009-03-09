package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class DAOFactoryHibernate implements DAOFactory {
    public AlgoRatingTypeDAO getAlgoRatingTypeDAO() {
        return new AlgoRatingTypeDAOHibernate();
    }

    public CoderDAO getCoderDAO() {
        return new CoderDAOHibernate();
    }

    public CoderTypeDAO getCoderTypeDAO() {
        return new CoderTypeDAOHibernate();
    }

    public CompanyDAO getCompanyDAO() {
        return new CompanyDAOHibernate();
    }

    public CompContestDAO getCompContestDAO() {
        return new CompContestDAOHibernate();
    }

    public ContactDAO getContactDAO() {
        return new ContactDAOHibernate();
    }

    public ContestPrizeDAO getContestPrizeDAO() {
        return new ContestPrizeDAOHibernate();
    }

    public CountryDAO getCountryDAO() {
        return new CountryDAOHibernate();
    }

    public DemographicAnswerDAO getDemographicAnswerDAO() {
        return new DemographicAnswerDAOHibernate();
    }

    public DemographicQuestionDAO getDemographicQuestionDAO() {
        return new DemographicQuestionDAOHibernate();
    }

    public DemographicAssignmentDAO getDemographicAssignmentDAO() {
        return new DemographicAssignmentDAOHibernate();
    }

    public EventDAO getEventDAO() {
        return new EventDAOHibernate();
    }

    public IntroEventDAO getIntroEventDAO() {
        return new IntroEventDAOHibernate();
    }

    public IntroEventPropertyTypeDAO getIntroEventPropertyTypeDAO() {
        return new IntroEventPropertyTypeDAOHibernate();
    }

    public EventRegistrationDAO getEventRegistrationDAO() {
        return new EventRegistrationDAOHibernate();
    }

    public EventTypeDAO getEventTypeDAO() {
        return new EventTypeDAOHibernate();
    }

    public FileTypeDAO getFileTypeDAO() {
        return new FileTypeDAOHibernate();
    }

    public ImageDAO getImageDAO() {
        return new ImageDAOHibernate();
    }

    public MemberContactMessageDAO getMemberContactMessageDAO() {
        return new MemberContactMessageDAOHibernate();
    }

    public MemberContactBlackListDAO getMemberContactBlackListDAO() {
        return new MemberContactBlackListDAOHibernate();
    }

    public NotificationDAO getNotificationDAO() {
        return new NotificationDAOHibernate();
    }

    public PasswordRecoveryDAO getPasswordRecoveryDAO() {
        return new PasswordRecoveryDAOHibernate();
    }

    public PathDAO getPathDAO() {
        return new PathDAOHibernate();
    }

    public PreferenceDAO getPreferenceDAO() {
        return new PreferenceDAOHibernate();
    }

    public PreferenceValueDAO getPreferenceValueDAO() {
        return new PreferenceValueDAOHibernate();
    }

    public PreferenceGroupDAO getPreferenceGroupDAO() {
        return new PreferenceGroupDAOHibernate();
    }

    public ProfessorStatusDAO getProfessorStatusDA0() {
        return new ProfessorStatusDAOHibernate();
    }

    public ProjectDAO getProjectDAO() {
        return new ProjectDAOHibernate();
    }

    public RegistrationTypeDAO getRegistrationTypeDAO() {
        return new RegistrationTypeDAOHibernate();
    }

    public ReferralDAO getReferralDAO() {
        return new ReferralDAOHibernate();
    }

    public RoundDAO getRoundDAO() {
        return new RoundDAOHibernate();
    }

    public SchoolDAO getSchoolDAO() {
        return new SchoolDAOHibernate();
    }

    public SchoolAssociationTypeDAO getSchoolAssociationTypeDAO() {
        return new SchoolAssociationTypeDAOHibernate();
    }

    public SchoolTypeDAO getSchoolTypeDAO() {
        return new SchoolTypeDAOHibernate();
    }

    public SeasonDAO getSeasonDAO() {
        return new SeasonDAOHibernate();
    }

    public SecurityGroupDAO getSecurityGroupDAO() {
        return new SecurityGroupDAOHibernate();
    }

    public StateDAO getStateDAO() {
        return new StateDAOHibernate();
    }

    public SubmissionDAO getSubmissionDAO() {
        return new SubmissionDAOHibernate();
    }

    public TeamDAO getTeamDAO() {
        return new TeamDAOHibernate();
    }

    public TeamTypeDAO getTeamTypeDAO() {
        return new TeamTypeDAOHibernate();
    }

    public TermsOfUseDAO getTermsOfUse() {
        return new TermsOfUseDAOHibernate();
    }

    public QuestionTypeDAO getQuestionTypeDAO() {
        return new QuestionTypeDAOHibernate();
    }

    public QuestionStyleDAO getQuestionStyleDAO() {
        return new QuestionStyleDAOHibernate();
    }

    public TimeZoneDAO getTimeZoneDAO() {
        return new TimeZoneDAOHibernate();
    }

    public UserDAO getUserDAO() {
        return new UserDAOHibernate();
    }

    public UserPreferenceDAO getUserPreferenceDAO() {
        return new UserPreferenceDAOHibernate();
    }

    public UserSchoolDAO getUserSchoolDAO() {
        return new UserSchoolDAOHibernate();
    }

    public VisaLetterRequestDAO getVisaLetterRequestDAO() {
        return new VisaLetterRequestDAOHibernate();
    }

    public VisaLetterEventDAO getVisaLetterEventDAO() {
        return new VisaLetterEventDAOHibernate();
    }

    public ProfessorDAO getProfessorDAO() {
        return new ProfessorDAOHibernate();
    }

    public ClassroomDAO getClassroomDAO() {
        return new ClassroomDAOHibernate();
    }

    public StudentClassroomDAO getStudentClassroomDAO() {
        return new StudentClassroomDAOHibernate();
    }

    public RoundTypeDAO getRoundTypeDAO() {
        return new RoundTypeDAOHibernate();
    }

    public ContestDAO getContestDAO() {
        return new ContestDAOHibernate();
    }

    public ComponentDAO getComponentDAO() {
        return new ComponentDAOHibernate();
    }

    public LanguageDAO getLanguageDAO() {
        return new LanguageDAOHibernate();
    }

    public ProblemSetDAO getProblemSetDAO() {
        return new ProblemSetDAOHibernate();
    }

    public RoomResultDAO getRoomResultDAO() {
        return new RoomResultDAOHibernate();
    }

    public ComponentStateDAO getComponentStateDAO() {
        return new ComponentStateDAOHibernate();
    }

    public SystemTestResultDAO getSystemTestResultDAO() {
        return new SystemTestResultDAOHibernate();
    }

    public AlgoSubmissionDAO getAlgoSubmissionDAO() {
        return new AlgoSubmissionDAOHibernate();
    }

}
