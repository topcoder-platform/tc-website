package com.topcoder.web.ejb.ComponentRegistrationServices;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public interface ComponentRegistrationServices extends EJBObject {
    /**
     * Number of days that a component will be open for registration.
     */
    public static final int COMPONENT_REGISTRATION_LENGTH = 3;
    /**
     * this is the lowest someone's reliability can be and still be able to register
     * for projects freely.
     */
    public static final double MIN_RELIABLE_PERCENTAGE = 0.7d;

    public static final int MAX_PROJECTS_WHEN_UNRELIABLE = 2;

    boolean isUserRegistered(long projectId, long userId, String dataSource) throws RemoteException, EJBException;

    boolean isRegClosed(long projectId, String dataSource) throws RemoteException, EJBException;

    boolean hasUserReviewedProject(long projectId, long userId, String dataSource) throws RemoteException, EJBException;

    boolean isUserWinningDesigner(long projectId, long userId, String dataSource) throws RemoteException, EJBException;

    boolean isUserReliableEnough(long phaseId, long userId, String dataSource) throws RemoteException, EJBException;

    int getMaxUnratedRegistrants(long projectId, String dataSource) throws RemoteException, EJBException;

    int getMaxRatedRegistrants(long projectId, String dataSource) throws RemoteException, EJBException;

    int getUnratedRegistrantCount(long projectId, String dataSource) throws RemoteException, EJBException;

    int getRatedRegistrantCount(long projectId, String dataSource) throws RemoteException, EJBException;

    // Survey methods
    ResultSetContainer getActiveQuestions() throws RemoteException, EJBException;

    ResultSetContainer getActiveAnswers() throws RemoteException, EJBException;

    ResultSetContainer getAnswers(long questionId) throws RemoteException, EJBException;

    void createResponse(long projectId, long userId, long questionId, long answerId) throws RemoteException, EJBException;

    void createResponse(long projectId, long userId, long questionId, String text) throws RemoteException, EJBException;

    boolean responseExists(long projectId, long userId, long questionId) throws RemoteException, EJBException;
}

