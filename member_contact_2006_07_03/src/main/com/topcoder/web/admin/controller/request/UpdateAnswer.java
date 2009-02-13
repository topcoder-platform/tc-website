package com.topcoder.web.admin.controller.request;

import com.topcoder.web.admin.Constants;
import com.topcoder.web.ejb.survey.Answer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.ApplicationServer;

import javax.transaction.TransactionManager;
import javax.transaction.Status;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 9, 2005
 */
public class UpdateAnswer extends Base {

    protected void businessProcessing() throws Exception {
        String sId = getRequest().getParameter(Constants.SURVEY_ID);
        String qId = getRequest().getParameter(Constants.QUESTION_ID);
        String aId = getRequest().getParameter(Constants.ANSWER_ID);

        String text = StringUtils.checkNull(getRequest().getParameter(Constants.ANSWER_TEXT));
        String sort = StringUtils.checkNull(getRequest().getParameter(Constants.SORT));

        if (text.equals("")) {
            addError(Constants.ANSWER_TEXT, "You must provide answer text");
        }
        if (sort.equals("")) {
            addError(Constants.SORT, "You must provide a sort value");
        } else if (!StringUtils.isNumber(sort)) {
            addError(Constants.SORT, "Please enter a numeric value");
        }

        if (hasErrors()) {
            setDefault(Constants.SURVEY_ID, sId);
            setDefault(Constants.QUESTION_ID, qId);
            setDefault(Constants.QUESTION_ID, qId);
            setDefault(Constants.ANSWER_TEXT, text);
            setDefault(Constants.SORT, sort);
            setNextPage("/editAnswer.jsp");
            setIsNextPageInContext(true);
        } else {

            TransactionManager tm = null;
            try {
                Answer answer = (Answer) createEJB(getInitialContext(), Answer.class);
                tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                tm.begin();
                long answerId = 0;
                if (StringUtils.checkNull(aId).equals("")) {
                    answerId = answer.createAnswer(Long.parseLong(qId), text,
                            Integer.parseInt(sort), DBMS.JTS_OLTP_DATASOURCE_NAME);
                } else {
                    answerId = Long.parseLong(aId);
                    answer.setSort(answerId, Integer.parseInt(sort), DBMS.JTS_OLTP_DATASOURCE_NAME);
                    answer.setText(answerId, text, DBMS.JTS_OLTP_DATASOURCE_NAME);
                }
                tm.commit();
                SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                setNextPage(info.getServletPath() + "?module=EditAnswer&" + Constants.ANSWER_ID + "=" + answerId +
                        "&" + Constants.SURVEY_ID + "=" + sId + "&" + Constants.QUESTION_ID + "=" + qId);
                setIsNextPageInContext(false);
            } catch (Exception e) {
                if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                    tm.rollback();
                }
                throw e;
            }
        }
    }
}
