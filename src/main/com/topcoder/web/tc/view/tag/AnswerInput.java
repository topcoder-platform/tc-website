package com.topcoder.web.tc.view.tag;

import com.topcoder.web.common.tag.BaseTag;
import com.topcoder.web.tc.model.Question;
import com.topcoder.web.tc.model.Answer;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import java.io.IOException;
import java.util.Iterator;

public class AnswerInput extends BaseTag {
    protected static Logger log = Logger.getLogger(AnswerInput.class);

    public static final String PREFIX = "question_";
    public static final String ANSWER_INPUT = "answerInput";

    private String cssclass;
    private Question question;
    private Iterator answers;

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
        int ret = SKIP_BODY;
        if (question.getStyleId()==Question.MULTIPLE_CHOICE || question.getStyleId()==Question.SINGLE_CHOICE) {
            answers = question.getAnswerInfo().iterator();
            doAfterBody();
        } else if (question.getStyleId()==Question.LONG_ANSWER || question.getStyleId()==Question.SHORT_ANSWER) {
            try {
                pageContext.getOut().print(buildText());
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }
            ret = SKIP_BODY;
        }
        //shouldn't get here
        return ret;
    }

    public int doAfterBody() throws JspException {

        Answer answer = null;
        if (answers.hasNext()) {
            answer = (Answer)answers.next();
            String inputText = null;
            if (question.getStyleId()==Question.MULTIPLE_CHOICE) {
                inputText = buildCheckBox(answer.getId());
            } else if (question.getStyleId()==Question.SINGLE_CHOICE) {
                inputText = buildRadioButton(answer.getId());
            }
            pageContext.setAttribute(ANSWER_INPUT, inputText, PageContext.PAGE_SCOPE);
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


    /* should this be a text area? */
    private String buildText() {
        setName(PREFIX + question.getId());
        StringBuffer s = new StringBuffer(200);
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
        s.append("\"");
        if (cssclass != null) {
            s.append(" class=\"");
            s.append(cssclass);
            s.append("\"");
        }
        if (getDefaultValue()!=null && getDefaultValue().equals("true")) {
            s.append(" checked");
        }
        s.append("/>");

        return s.toString();
    }

    private String buildRadioButton(long answerId) {
        setName(PREFIX + question.getId());
        StringBuffer s = new StringBuffer(200);
        s.append("<input type=\"radio\" name=\"");
        s.append(name);
        s.append("\"");
        if (cssclass != null) {
            s.append(" class=\"");
            s.append(cssclass);
            s.append("\"");
        }
        if (getDefaultValue()!=null) {
            s.append(" value=\"");
            s.append(getDefaultValue());
            s.append("\"");
        }
        if (getDefaultValue() != null && getDefaultValue().equals(new Long(answerId))) {
            s.append(" checked");
        }
        s.append("/>");
        return s.toString();

    }

}


