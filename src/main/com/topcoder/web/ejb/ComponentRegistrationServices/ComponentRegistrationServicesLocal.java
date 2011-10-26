package com.topcoder.web.ejb.ComponentRegistrationServices;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision: 62014 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 12, 2006
 */
public interface ComponentRegistrationServicesLocal extends EJBLocalObject {

    boolean isUserRegistered(long projectId, long userId, String dataSource);

    boolean isRegOpen(long projectId, String dataSource);

    boolean hasUserReviewedWinningDesign(long projectId, long userId, String dataSource);

    boolean hasUserReviewedProject(long projectId, long userId, String dataSource);

    boolean hasUserScreenedProject(long projectId, long userId, String dataSource);

    boolean isUserWinningDesigner(long projectId, long userId, String dataSource);

    int getProjectCountSameVersion(long projectId, String dataSource);

    boolean isUserReliableEnough(long phaseId, long userId, String dataSource);

    int getMaxUnratedRegistrants(long projectId, String dataSource);

    int getMaxRatedRegistrants(long projectId, String dataSource);

    int getUnratedRegistrantCount(long projectId, String dataSource);

    int getRatedRegistrantCount(long projectId, String dataSource);

    // Survey methods
    ResultSetContainer getActiveQuestions();

    ResultSetContainer getActiveAnswers();

    ResultSetContainer getAnswers(long questionId);

    void createResponse(long projectId, long userId, long questionId, long answerId);

    void createResponse(long projectId, long userId, long questionId, String text);

    boolean responseExists(long projectId, long userId, long questionId);
}
