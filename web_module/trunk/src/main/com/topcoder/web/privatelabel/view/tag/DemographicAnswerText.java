package com.topcoder.web.privatelabel.view.tag;

import com.topcoder.web.privatelabel.model.DemographicResponse;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.privatelabel.model.DemographicAnswer;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspException;
import java.util.Map;
import java.util.Iterator;
import java.io.IOException;

public class DemographicAnswerText  extends TagSupport {
    protected static Logger log = Logger.getLogger(DemographicAnswerText.class);
    private DemographicResponse response = null;
    private Map questions = null;

    public void setResponse(DemographicResponse response) {
        this.response = response;
    }

    public void setQuestions(Map questions) {
        this.questions = questions;
    }

    public int doStartTag() throws JspException {
        try {
            DemographicQuestion question = (DemographicQuestion)questions.get(new Long(response.getQuestionId()));
            String ret = "";


            for (Iterator it = questions.values().iterator(); it.hasNext();) {
                StringBuffer buf = new StringBuffer(100);
                DemographicQuestion q = (DemographicQuestion)it.next();
                buf.append("question: " + q.getText() + "  ");
                for (Iterator it1 = q.getAnswers().iterator(); it1.hasNext();) {
                    DemographicAnswer a = (DemographicAnswer)it1.next();
                    buf.append(a.getText() + " ");
                }
                log.debug(buf.toString());
            }


            if (question.getAnswerType()==DemographicQuestion.FREE_FORM) {
                ret = response.getText();
            } else if (question.getAnswerType()==DemographicQuestion.SINGLE_SELECT) {
                ret = question.getAnswer(response.getAnswerId()).getText();
            } else if (question.getAnswerType()==DemographicQuestion.MULTIPLE_SELECT) {
                //todo handle multiple select
            }
            pageContext.getOut().print(ret);
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

}