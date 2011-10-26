/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.AlgoRatingTypeDAO;
import com.topcoder.web.common.dao.AlgoSubmissionDAO;
import com.topcoder.web.common.dao.ClassroomDAO;
import com.topcoder.web.common.dao.CoderDAO;
import com.topcoder.web.common.dao.CoderTypeDAO;
import com.topcoder.web.common.dao.CompContestDAO;
import com.topcoder.web.common.dao.CompanyDAO;
import com.topcoder.web.common.dao.ComponentDAO;
import com.topcoder.web.common.dao.ComponentStateDAO;
import com.topcoder.web.common.dao.ContactDAO;
import com.topcoder.web.common.dao.ContestDAO;
import com.topcoder.web.common.dao.ContestPrizeDAO;
import com.topcoder.web.common.dao.CountryDAO;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DemographicAnswerDAO;
import com.topcoder.web.common.dao.DemographicAssignmentDAO;
import com.topcoder.web.common.dao.DemographicQuestionDAO;
import com.topcoder.web.common.dao.EventDAO;
import com.topcoder.web.common.dao.EventRegistrationDAO;
import com.topcoder.web.common.dao.EventTypeDAO;
import com.topcoder.web.common.dao.FileTypeDAO;
import com.topcoder.web.common.dao.ImageDAO;
import com.topcoder.web.common.dao.IntroEventDAO;
import com.topcoder.web.common.dao.IntroEventPropertyTypeDAO;
import com.topcoder.web.common.dao.LanguageDAO;
import com.topcoder.web.common.dao.MemberContactBlackListDAO;
import com.topcoder.web.common.dao.MemberContactMessageDAO;
import com.topcoder.web.common.dao.NotificationDAO;
import com.topcoder.web.common.dao.PasswordRecoveryDAO;
import com.topcoder.web.common.dao.PathDAO;
import com.topcoder.web.common.dao.PreferenceDAO;
import com.topcoder.web.common.dao.PreferenceGroupDAO;
import com.topcoder.web.common.dao.PreferenceValueDAO;
import com.topcoder.web.common.dao.ProblemSetDAO;
import com.topcoder.web.common.dao.PaymentDAO;
import com.topcoder.web.common.dao.ProfessorDAO;
import com.topcoder.web.common.dao.ProfessorStatusDAO;
import com.topcoder.web.common.dao.ProjectDAO;
import com.topcoder.web.common.dao.QuestionStyleDAO;
import com.topcoder.web.common.dao.QuestionTypeDAO;
import com.topcoder.web.common.dao.ReferralDAO;
import com.topcoder.web.common.dao.RegistrationTypeDAO;
import com.topcoder.web.common.dao.RoomResultDAO;
import com.topcoder.web.common.dao.RoundDAO;
import com.topcoder.web.common.dao.RoundTypeDAO;
import com.topcoder.web.common.dao.SchoolAssociationTypeDAO;
import com.topcoder.web.common.dao.SchoolDAO;
import com.topcoder.web.common.dao.SchoolTypeDAO;
import com.topcoder.web.common.dao.SeasonDAO;
import com.topcoder.web.common.dao.SecurityGroupDAO;
import com.topcoder.web.common.dao.SpecReviewDAO;
import com.topcoder.web.common.dao.StateDAO;
import com.topcoder.web.common.dao.StudentClassroomDAO;
import com.topcoder.web.common.dao.SubmissionDAO;
import com.topcoder.web.common.dao.SystemTestResultDAO;
import com.topcoder.web.common.dao.TeamDAO;
import com.topcoder.web.common.dao.TeamTypeDAO;
import com.topcoder.web.common.dao.TermsOfUseDAO;
import com.topcoder.web.common.dao.TimeZoneDAO;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.dao.UserPermissionGrantDAO;
import com.topcoder.web.common.dao.UserPreferenceDAO;
import com.topcoder.web.common.dao.UserSchoolDAO;
import com.topcoder.web.common.dao.VisaLetterEventDAO;
import com.topcoder.web.common.dao.VisaLetterRequestDAO;

/**
 * <p>Hibernate implementation for the DAO Factory.</p>
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
 * @author dok, TCSDEVELOPER
 * @version 1.1
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

    public PaymentDAO getPaymentDAO() {
        return new PaymentDAOHibernate();
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

    /**
     * This method constructs the corresponding Specification Review DAO object
     *
     * @return hibernate implementation of the <code>SpecReviewDAO</code>
     * @since 1.1
     */
    public SpecReviewDAO getSpecReviewDAO() {
        return new SpecReviewDAOHibernate();
    }

    /**
     * This method constructs the corresponding User Permission Grant DAO object
     *
     * @return hibernate implementation of the <code>UserPermissionGrantDAO</code>
     * @since 1.1
     */
    public UserPermissionGrantDAO getUserPermissionGrantDAO() {
        return new UserPermissionGrantDAOHibernate();
    }

}
