package com.topcoder.web.privatelabel.view.tag;

import com.topcoder.web.privatelabel.model.DemographicAnswer;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.common.tag.BaseTag;

import javax.servlet.jsp.JspException;
import java.util.*;
import java.io.IOException;

public class DemographicInput extends BaseTag {
    public static final String PREFIX = "demog_";

    private String cssclass;
    private DemographicQuestion question;

    public DemographicInput() {
        super();
        cssclass = null;
    }

    public void setClass(String cssclass) {
        this.cssclass = cssclass;
    }

    public void setQuestion(DemographicQuestion question) {
        this.question = question;
    }

    public int doStartTag()
            throws JspException {
        return doAfterBody();
    }

    public int doAfterBody()
            throws JspException {
        if (question != null) {
            StringBuffer out = new StringBuffer(400);
            setName(PREFIX+question.getDemographicQuestionId());
            switch (question.getAnswerType()) {
                case DemographicQuestion.FREE_FORM:
                    out.append(buildText());
                    break;
                case DemographicQuestion.MULTIPLE_SELECT:
                    out.append("multiselect");
                case DemographicQuestion.SINGLE_SELECT:
                    out.append(buildSelect());
                    break;
                default: break;
            }
            try {
                pageContext.getOut().print(out);
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }
            return EVAL_BODY_TAG;
        } else {
            if (bodyContent != null && bodyContent.getEnclosingWriter() != null) {
                try {
                    bodyContent.writeOut(bodyContent.getEnclosingWriter());
                } catch (Exception e) {
                    throw new JspException(e.toString());
                }
            }
            return SKIP_BODY;
        }
    }

    public int doEndTag()
            throws JspException {
        return EVAL_PAGE;
    }


    private String buildText() {
        StringBuffer s = new StringBuffer(500);
        s.append("<input type=\"text\" size=\"40\" maxlength=\"255\"");
        s.append(" name=\"");
        s.append(name);
        s.append("\"");
        if (cssclass != null) {
            s.append(" class=\"" + cssclass + "\"");
        }
        s.append(" value=\"");
        s.append(getDefaultValue());
        s.append("\"");
        s.append("/>");
        return s.toString();
    }


    private String buildSelect() {

        StringBuffer s = new StringBuffer(2000);
        s.append("<select");
        s.append(" name=\"");
        s.append(name);
        s.append("\"");
        if (cssclass != null) {
            s.append(" class=\"");
            s.append(cssclass);
            s.append("\"");
        }

        s.append(">\n");
        List answers = question.getDemographicAnswers();
        if (answers != null) {
            s.append("<option value=\"\"></option>");
            DemographicAnswer answer = null;
            for (int i = 0; i < answers.size(); i++) {
                answer = (DemographicAnswer)answers.get(i);
                s.append("<option value=\"");
                s.append(answer.getDemographicAnswerId());
                s.append("\"");
                if (getDefaultValue().equals(String.valueOf(answer.getDemographicAnswerId()))) {
                    s.append(" selected");
                }
                s.append(">");
                s.append(answer.getDemographicAnswerText());
                s.append("</option>\n");
            }
        }
        s.append("</select>\n");
        return s.toString();
    }



}


