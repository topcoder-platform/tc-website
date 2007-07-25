package com.topcoder.web.ejb.survey;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface AnswerLocal extends EJBLocalObject {

    long createAnswer(long questionId, String text, int sort, String dataSource);

    void setText(long answerId, String text, String dataSource);

    void setSort(long answerId, int sort, String dataSource);

    String getText(long answerId, String dataSource);

    int getSort(long answerId, String dataSource);

    ResultSetContainer getAnswers(long questionId, String dataSource);

}
