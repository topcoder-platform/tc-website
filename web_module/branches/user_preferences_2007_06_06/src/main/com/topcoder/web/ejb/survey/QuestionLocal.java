package com.topcoder.web.ejb.survey;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface QuestionLocal extends EJBLocalObject {

    long createQuestion(String text, int statusId, String keyword, int questionTypeId,
                        int questionStyleId, boolean required, String dataSource);

    void setText(long questionId, String text, String dataSource);

    void setStatusId(long questionId, int statusId, String dataSource);

    void setKeyword(long questionId, String keyword, String dataSource);

    void setQuestionTypeId(long questionId, int questionTypeId, String dataSource);

    void setQuestionStyleId(long questionId, int questionStyleId, String dataSource);

    void setRequired(long questionId, boolean required, String dataSource);

    String getText(long questionId, String dataSource);

    int getStatusId(long questionId, String dataSource);

    String getKeyword(long questionId, String dataSource);

    int getQuestionTypeId(long questionId, String dataSource);

    int getQuestionStyleId(long questionId, String dataSource);

    boolean isRequired(long questionId, String dataSource);


}
