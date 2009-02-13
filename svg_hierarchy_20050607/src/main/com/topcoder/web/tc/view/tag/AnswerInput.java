package com.topcoder.web.tc.view.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.tag.BaseTag;
import com.topcoder.web.tc.model.Answer;
import com.topcoder.web.tc.model.Question;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import java.util.Iterator;
import java.util.List;

public class AnswerInput extends BaseTag {
    protected static Logger log = Logger.getLogger(AnswerInput.class);

    public static final String PREFIX = "question_";
    public static final String ANSWER_TEXT = "answerText";

    private String cssclass;
    private Question question;
    private Iterator answers;
    private boolean processed = false;

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
        List l = question.getAnswerInfo();
        if (l != null) {
            answers = l.iterator();
        }
        return doAfterBody();
    }

    public int doAfterBody() throws JspException {

        Answer answer = null;
        String inputText = null;
        if (question.isFreeForm()) {
            inputText = buildText();
            /* if we haven't done so already, set the information
               to make it accessible from the jsp and evaluate, otherwise, skip the body
             */
            if (processed) {
                return wrapItUp();
            } else {
                pageContext.setAttribute(ANSWER_TEXT, "", PageContext.PAGE_SCOPE);
                pageContext.setAttribute(getId(), inputText, PageContext.PAGE_SCOPE);
                processed = true;
                return EVAL_BODY_TAG;
            }
        } else if (answers != null && answers.hasNext()) {
            answer = (Answer) answers.next();
            if (question.getStyleId() == Question.MULTIPLE_CHOICE) {
                inputText = buildCheckBox(answer.getId());
            } else if (question.getStyleId() == Question.SINGLE_CHOICE) {
                inputText = buildRadioButton(answer.getId());
            }
            pageContext.setAttribute(ANSWER_TEXT, answer.getText(), PageContext.PAGE_SCOPE);
            pageContext.setAttribute(getId(), inputText, PageContext.PAGE_SCOPE);
            return EVAL_BODY_TAG;
        } else {
            return wrapItUp();
        }
    }

    private int wrapItUp() throws JspException {
        if (bodyContent != null && bodyContent.getEnclosingWriter() != null) {
            try {
                bodyContent.writeOut(bodyContent.getEnclosingWriter());
            } catch (Exception e) {
                throw new JspException(e.toString());
            }
        }
        return SKIP_BODY;
    }

    /* should this be a text area? */
    private String buildText() {
        setName(PREFIX + question.getId());
        StringBuffer s = new StringBuffer(200);
        if (question.getStyleId() == Question.LONG_ANSWER) {
            s.append("<textarea ");
            s.append("cols=\"").append(60).append("\" ");
            s.append("rows=\"").append(8).append("\" ");
            s.append("wrap=\"").append("virtual").append("\" ");
            s.append("name=\"").append(name).append("\" ");
            if (cssclass != null) {
                s.append("class=\"").append(cssclass).append("\" ");
            }
            s.append(">");
            s.append(getDefaultValue() == null ? "" : getDefaultValue());
            s.append("</textarea>");
        } else {
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
        }
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
        if (getDefaultValue() != null && getDefaultValue().equals("true")) {
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
        s.append(" value=\"");
        s.append(answerId);
        s.append("\"");
        if (getDefaultValue() != null && getDefaultValue().equals(new Long(answerId))) {
            s.append(" checked");
        }
        s.append("/>");
        return s.toString();

    }

    protected void init() {
        this.cssclass = null;
        this.question = null;
        this.answers = null;
        this.processed = false;
    }
}


