package com.topcoder.web.tc.view.tag;

import com.topcoder.web.common.tag.BaseTag;
import com.topcoder.web.tc.model.Question;
import com.topcoder.web.tc.model.Answer;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import java.util.*;
import java.io.IOException;

public class AnswerInput extends BaseTag {
    protected static Logger log = Logger.getLogger(AnswerInput.class);

    public static final String PREFIX = "question_";

    private String cssclass;
    private Question question;
    private Answer answer;

    public AnswerInput() {
        super();
        cssclass = null;
    }

    public void setClass(String cssclass) {
        this.cssclass = cssclass;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public int doStartTag() throws JspException {
        StringBuffer output = new StringBuffer(400);
        switch (question.getStyleId()) {
            case Question.MULTIPLE_CHOICE:
                output.append(buildCheckBox(answer.getId()));
            case Question.SINGLE_CHOICE:
                output.append(buildRadioButton());
                break;
            case Question.LONG_ANSWER
                output.append(buildText());
                break;
            case Question.SHORT_ANSWER
                output.append(buildText());
                break;
            default:
                break;
        }
        try {
            pageContext.getOut().print(output.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

    /* should this be a text area? */
    private String buildText() {
        setName(PREFIX + question.getId());
        StringBuffer s = new StringBuffer(500);
        s.append("<input type=\"text\" size=\"40\" maxlength=\"255\"");
        s.append(" name=\"");
        s.append(name);
        s.append("\"");
        if (cssclass != null) {
            s.append(" class=\"" + cssclass + "\"");
        }
        s.append(" value=\"");
        s.append(getDefaultValue() == null ? "" : getDefaultValue());
        s.append("\"");
        s.append("/>");
        return s.toString();
    }



    private String buildCheckBox(long answerId) {
        setName(PREFIX + question.getId() + "," + answerId);
        StringBuffer s = new StringBuffer(200);
        s.append("<input type=\"checkbox\" name=\"");
        s.append(name);
        if (cssclass != null) {
            s.append(" class=\"");
            s.append(cssclass);
            s.append("\"");
        }
        if (getDefaultValue().equals("true")) {
            s.append(" checked");
        }
        s.append("/>");

        return s.toString();
    }

    private String buildRadioButton() {
        setName(PREFIX + question.getId());
        StringBuffer s = new StringBuffer(200);
        s.append("<input type=\"radio\" name=\"");
        s.append(name);
        if (cssclass != null) {
            s.append(" class=\"");
            s.append(cssclass);
            s.append("\"");
        }
        s.append(" value=\"");
        s.append(getDefaultValue());
        s.append("\"");
        if (getDefaultValue() != null && getDefaultValue().equals(new Long(answer.getId()))) {
            s.append(" checked");
        }
        s.append("/>");
        return s.toString();

    }

}


