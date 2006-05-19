package com.topcoder.web.ejb.survey;

import javax.ejb.EJBLocalObject;
import java.sql.Timestamp;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface SurveyLocal extends EJBLocalObject {

    long createSurvey(String name, Timestamp startDate, Timestamp endDate,
                      int statusId, boolean resultsViewable, String dataSource);

    void setName(long surveyId, String name, String dataSource);

    void setStartDate(long surveyId, Timestamp startDate, String dataSource);

    void setEndDate(long surveyId, Timestamp endDate, String dataSource);

    void setStatusId(long surveyId, int statusId, String dataSource);

    void setText(long surveyId, String text, String dataSource);

    String getName(long surveyId, String dataSource);

    Timestamp getStartDate(long surveyId, String dataSource);

    Timestamp getEndDate(long surveyId, String dataSource);

    int getStatusId(long surveyId, String dataSource);

    String getText(long surveyId, String dataSource);


}
