/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.querytool;

import com.topcoder.web.common.dao.*;

/**
 * <p>Query Tool implementation for the DAO Factory.</p>
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
 * @author pulky
 * @version 1.1
 */
public class DAOFactoryQueryTool implements DAOFactory {

    // This DAO exists because hibernate is currently not caching and we need a faster implementation

    public UserPreferenceDAO getUserPreferenceDAO() {
        return new UserPreferenceDAOQueryTool();
    }

    // The rest of the DAOs are not supported

    public AlgoRatingTypeDAO getAlgoRatingTypeDAO() {
        throw new UnsupportedOperationException();
    }

    public CoderDAO getCoderDAO() {
        throw new UnsupportedOperationException();
    }

    public CoderTypeDAO getCoderTypeDAO() {
        throw new UnsupportedOperationException();
    }

    public CompanyDAO getCompanyDAO() {
        throw new UnsupportedOperationException();
    }

    public CompContestDAO getCompContestDAO() {
        throw new UnsupportedOperationException();
    }

    public ContactDAO getContactDAO() {
        throw new UnsupportedOperationException();
    }

    public ContestPrizeDAO getContestPrizeDAO() {
        throw new UnsupportedOperationException();
    }

    public CountryDAO getCountryDAO() {
        throw new UnsupportedOperationException();
    }

    public DemographicAnswerDAO getDemographicAnswerDAO() {
        throw new UnsupportedOperationException();
    }

    public DemographicQuestionDAO getDemographicQuestionDAO() {
        throw new UnsupportedOperationException();
    }

    public DemographicAssignmentDAO getDemographicAssignmentDAO() {
        throw new UnsupportedOperationException();
    }

    public EventDAO getEventDAO() {
        throw new UnsupportedOperationException();
    }

    public IntroEventDAO getIntroEventDAO() {
        throw new UnsupportedOperationException();
    }

    public IntroEventPropertyTypeDAO getIntroEventPropertyTypeDAO() {
        throw new UnsupportedOperationException();
    }

    public EventRegistrationDAO getEventRegistrationDAO() {
        throw new UnsupportedOperationException();
    }

    public EventTypeDAO getEventTypeDAO() {
        throw new UnsupportedOperationException();
    }

    public FileTypeDAO getFileTypeDAO() {
        throw new UnsupportedOperationException();
    }

    public ImageDAO getImageDAO() {
        throw new UnsupportedOperationException();
    }

    public MemberContactMessageDAO getMemberContactMessageDAO() {
        throw new UnsupportedOperationException();
    }

    public MemberContactBlackListDAO getMemberContactBlackListDAO() {
        throw new UnsupportedOperationException();
    }

    public NotificationDAO getNotificationDAO() {
        throw new UnsupportedOperationException();
    }

    public PasswordRecoveryDAO getPasswordRecoveryDAO() {
        throw new UnsupportedOperationException();
    }

    public PathDAO getPathDAO() {
        throw new UnsupportedOperationException();
    }

    public PreferenceDAO getPreferenceDAO() {
        throw new UnsupportedOperationException();
    }

    public PreferenceValueDAO getPreferenceValueDAO() {
        throw new UnsupportedOperationException();
    }

    public PreferenceGroupDAO getPreferenceGroupDAO() {
        throw new UnsupportedOperationException();
    }

    public ProfessorStatusDAO getProfessorStatusDA0() {
        throw new UnsupportedOperationException();
    }

    public ProjectDAO getProjectDAO() {
        throw new UnsupportedOperationException();
    }

    public RegistrationTypeDAO getRegistrationTypeDAO() {
        throw new UnsupportedOperationException();
    }

    public ReferralDAO getReferralDAO() {
        throw new UnsupportedOperationException();
    }

    public RoundDAO getRoundDAO() {
        throw new UnsupportedOperationException();
    }

    public SchoolDAO getSchoolDAO() {
        throw new UnsupportedOperationException();
    }

    public SchoolAssociationTypeDAO getSchoolAssociationTypeDAO() {
        throw new UnsupportedOperationException();
    }

    public SchoolTypeDAO getSchoolTypeDAO() {
        throw new UnsupportedOperationException();
    }

    public SecurityGroupDAO getSecurityGroupDAO() {
        throw new UnsupportedOperationException();
    }

    public StateDAO getStateDAO() {
        throw new UnsupportedOperationException();
    }

    public TeamDAO getTeamDAO() {
        throw new UnsupportedOperationException();
    }

    public TeamTypeDAO getTeamTypeDAO() {
        throw new UnsupportedOperationException();
    }

    public TermsOfUseDAO getTermsOfUse() {
        throw new UnsupportedOperationException();
    }

    public QuestionTypeDAO getQuestionTypeDAO() {
        throw new UnsupportedOperationException();
    }

    public QuestionStyleDAO getQuestionStyleDAO() {
        throw new UnsupportedOperationException();
    }

    public TimeZoneDAO getTimeZoneDAO() {
        throw new UnsupportedOperationException();
    }

    public UserDAO getUserDAO() {
        throw new UnsupportedOperationException();
    }

    public VisaLetterRequestDAO getVisaLetterRequestDAO() {
        throw new UnsupportedOperationException();
    }

    public VisaLetterEventDAO getVisaLetterEventDAO() {
        throw new UnsupportedOperationException();
    }

    public SeasonDAO getSeasonDAO() {
        throw new UnsupportedOperationException();
    }

    public SubmissionDAO getSubmissionDAO() {
        throw new UnsupportedOperationException();
    }

    public ProfessorDAO getProfessorDAO() {
        throw new UnsupportedOperationException();
    }

    public ClassroomDAO getClassroomDAO() {
        throw new UnsupportedOperationException();
    }

    public StudentClassroomDAO getStudentClassroomDAO() {
        throw new UnsupportedOperationException();
    }

    public RoundTypeDAO getRoundTypeDAO() {
        throw new UnsupportedOperationException();
    }

    public ContestDAO getContestDAO() {
        throw new UnsupportedOperationException();
    }

    public ComponentDAO getComponentDAO() {
        throw new UnsupportedOperationException();
    }

    public LanguageDAO getLanguageDAO() {
        throw new UnsupportedOperationException();
    }

    public ProblemSetDAO getProblemSetDAO() {
        throw new UnsupportedOperationException();
    }

    public RoomResultDAO getRoomResultDAO() {
        throw new UnsupportedOperationException();
    }

    public ComponentStateDAO getComponentStateDAO() {
        throw new UnsupportedOperationException();
    }

    public SystemTestResultDAO getSystemTestResultDAO() {
        throw new UnsupportedOperationException();
    }

    public AlgoSubmissionDAO getAlgoSubmissionDAO() {
        throw new UnsupportedOperationException();
    }

    public UserSchoolDAO getUserSchoolDAO() {
        throw new UnsupportedOperationException();
    }

    /**
     * This method constructs the corresponding Specification Review DAO object
     *
     * Note: this is not currently supported
     *
     * @return Query Tool implementation of the <code>SpecReviewDAO</code>
     * @throws UnsupportedOperationException always since this DAO is not currently supported
     * @since 1.1
     */
    public SpecReviewDAO getSpecReviewDAO() {
        throw new UnsupportedOperationException();
    }

    /**
     * This method constructs the corresponding User Permission Grant DAO object
     *
     * Note: this is not currently supported
     *
     * @return Query Tool implementation of the <code>UserPermissionGrantDAO</code>
     * @throws UnsupportedOperationException always since this DAO is not currently supported
     * @since 1.1
     */
    public UserPermissionGrantDAO getUserPermissionGrantDAO() {
        throw new UnsupportedOperationException();
    }
}
