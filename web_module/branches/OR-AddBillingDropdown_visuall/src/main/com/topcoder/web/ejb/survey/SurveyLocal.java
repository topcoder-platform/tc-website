package com.topcoder.web.ejb.survey;

import com.topcoder.web.common.RowNotFoundException;

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

    String getName(long surveyId, String dataSource) throws RowNotFoundException;

    Timestamp getStartDate(long surveyId, String dataSource) throws RowNotFoundException;

    Timestamp getEndDate(long surveyId, String dataSource) throws RowNotFoundException;

    int getStatusId(long surveyId, String dataSource) throws RowNotFoundException;

    String getText(long surveyId, String dataSource) throws RowNotFoundException;


}
