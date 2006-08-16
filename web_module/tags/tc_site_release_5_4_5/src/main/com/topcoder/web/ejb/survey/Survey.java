package com.topcoder.web.ejb.survey;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.sql.Timestamp;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface Survey extends EJBObject {

    long createSurvey(String name, Timestamp startDate, Timestamp endDate,
                      int statusId, boolean resultsViewable, String dataSource) throws RemoteException;

    void setName(long surveyId, String name, String dataSource) throws RemoteException;

    void setStartDate(long surveyId, Timestamp startDate, String dataSource) throws RemoteException;

    void setEndDate(long surveyId, Timestamp endDate, String dataSource) throws RemoteException;

    void setStatusId(long surveyId, int statusId, String dataSource) throws RemoteException;

    void setText(long surveyId, String text, String dataSource) throws RemoteException;

    void setResultsViewable(long surveyId, boolean resultsViewAble, String dataSource) throws RemoteException;

    String getName(long surveyId, String dataSource) throws RemoteException;

    Timestamp getStartDate(long surveyId, String dataSource) throws RemoteException;

    Timestamp getEndDate(long surveyId, String dataSource) throws RemoteException;

    int getStatusId(long surveyId, String dataSource) throws RemoteException;

    String getText(long surveyId, String dataSource) throws RemoteException;

    boolean areResultsViewable(long surveyId, String dataSource) throws RemoteException;

}
