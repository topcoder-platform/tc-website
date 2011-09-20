package com.topcoder.web.ejb.survey;


import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface SurveyQuestion extends EJBObject {

    void createSurveyQuestion(long surveyId, long questionId, String dataSource) throws RemoteException;

    void removeSurveyQuestion(long surveyId, long questionId, String dataSource) throws RemoteException;

    ResultSetContainer getQuestions(long surveyId, String dataSource) throws RemoteException;

}
