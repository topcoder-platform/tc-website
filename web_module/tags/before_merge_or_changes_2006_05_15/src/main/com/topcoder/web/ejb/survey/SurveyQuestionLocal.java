package com.topcoder.web.ejb.survey;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface SurveyQuestionLocal extends EJBLocalObject {

    void createSurveyQuestion(long surveyId, long questionId, String dataSource);

    void removeSurveyQuestion(long surveyId, long questionId, String dataSource);

    ResultSetContainer getQuestions(long surveyId, String dataSource);

}
