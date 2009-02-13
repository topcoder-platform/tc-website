package com.topcoder.web.admin.controller.request;

import com.topcoder.web.admin.Constants;
import com.topcoder.web.ejb.survey.Question;
import com.topcoder.web.ejb.survey.Answer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.Request;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 9, 2005
 */
public class EditAnswer extends Base {


    protected void businessProcessing() throws Exception {
        String sId = getRequest().getParameter(Constants.SURVEY_ID);
        String qId = getRequest().getParameter(Constants.QUESTION_ID);
        String aId = getRequest().getParameter(Constants.ANSWER_ID);
        setDefault(Constants.SURVEY_ID, sId);
        setDefault(Constants.QUESTION_ID, qId);
        setDefault(Constants.ANSWER_ID, aId);
        getRequest().setAttribute(Constants.SURVEY_ID, sId);
        getRequest().setAttribute(Constants.QUESTION_ID, qId);
        getRequest().setAttribute(Constants.ANSWER_ID, aId);
        if (!StringUtils.checkNull(aId).equals("")) {
            long id = Long.parseLong(aId);
            Answer answer = (Answer)createEJB(getInitialContext(), Answer.class);
            setDefault(Constants.SORT, String.valueOf(answer.getSort(id, DBMS.OLTP_DATASOURCE_NAME)));
            setDefault(Constants.ANSWER_TEXT,  answer.getText(id, DBMS.OLTP_DATASOURCE_NAME));
        }
        setNextPage("/editAnswer.jsp");
        setIsNextPageInContext(true);
    }

}
