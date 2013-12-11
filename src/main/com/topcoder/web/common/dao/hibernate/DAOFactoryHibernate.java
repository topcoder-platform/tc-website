/*
 * Copyright (C) 2001 - 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.*;

/**
 * 
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
 * <p>
 * Version 1.2 Change notes:
 *   <ol>
 *     <li>Added {@link #getGovernmentIdDAO()} method.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.3( Release Assembly - TopCoder Password Recovery Revamp v1.0 ) Change notes:
 *   <ol>
 *     <li>Added {@link #getPasswordResetTokenDAO()} method.</li>
 *     <li>Added {@link #getSecondEmailRequestDAO()} method.</li>
 *   </ol>
 * </p>
 *
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
 * @author dok, TCSDEVELOPER, isv, Standlove, TCSASSEMBLER
 * @version 1.6
 */
public class DAOFactoryHibernate implements DAOFactory {
    /**
     * <p>Gets the instance of {@link PasswordResetTokenDAO}.</p>
     *
     * @return a <code>PasswordResetTokenDAO</code> to be used for keeping password reset token.
     * @since 1.3
     */
    public PasswordResetTokenDAO getPasswordResetTokenDAO(){
        return new PasswordResetTokenDAOHibernate();
    }

    /**
     * <p>Gets the instance of {@link EmailRequestDAO}.</p>
     *
     * @return a <code>EmailRequestDAO</code> to be used for keeping add second email token.
     * @since 1.3
     */
    public EmailRequestDAO getEmailRequestDAO() {
        return new EmailRequestDAOHibernate();
    }
    
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

	
	public InvalidHandleDAO getInvalidHandleDAO(){
		throw new RuntimeException("Not supported");
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

    /**
     * <p>Gets the instance of {@link GovernmentIDDAO}.</p>
     *
     * @return a <code>GovernmentIDDAO</code> to be used for managing government IDs.
     * @since 1.2
     */
    public GovernmentIDDAO getGovernmentIdDAO() {
        return new GovernmentIDAOHibernate();
    }

    /**
     * Gets the instance of {@link UserSocialLoginDAO}.
     *
     * @return the dao.
     * @since 1.5
     */
    public UserSocialLoginDAO getUserSocialLoginDAO() {
        return new UserSocialLoginDAOHibernate();
    }

    /**
     * Gets the instance of {@link UserApiSpinDAO}.
     *
     * @return the dao.
     * @since 1.6
     */
    public UserApiSpinDAO getUserApiSpinDAO() {
        return new UserApiSpinDAOHibernate();
    }
}
