package com.topcoder.web.privatelabel.view.tag;

import com.topcoder.web.privatelabel.model.DemographicAnswer;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.tag.BaseTag;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import java.util.*;
import java.io.IOException;

public class DemographicInput extends BaseTag {
    protected static Logger log = Logger.getLogger(DemographicInput.class);

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
        if (question != null) {
            StringBuffer output = new StringBuffer(400);
            setName(Constants.DEMOG_PREFIX+question.getId());
            switch (question.getAnswerType()) {
                case DemographicQuestion.FREE_FORM:
                    output.append(buildText());
                    break;
                case DemographicQuestion.MULTIPLE_SELECT:
                    output.append(buildSelect(true));
                    break;
                case DemographicQuestion.SINGLE_SELECT:
                    output.append(buildSelect(false));
                    break;
                default: break;
            }
            try {
                pageContext.getOut().print(output.toString());
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }
        }
        return SKIP_BODY;
    }


    private String buildText() {
        StringBuffer s = new StringBuffer(500);
        s.append("<input type=\"text\" size=\"25\" maxlength=\"255\"");
        s.append(" name=\"");
        s.append(name);
        s.append("\"");
        if (cssclass != null) {
            s.append(" class=\"" + cssclass + "\"");
        }
        s.append(" value=\"");
        s.append(getDefaultValue()==null?"":getDefaultValue());
        s.append("\"");
        s.append("/>");
        return s.toString();
    }


    private String buildSelect(boolean multiple) {
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
        if (multiple) {
            s.append(" size=\"4\" multiple");
        }
        s.append(">\n");
        List answers = question.getAnswers();
        if (answers != null) {
            if (!multiple) s.append("<option value=\"\"></option>");
            DemographicAnswer answer = null;
            for (int i = 0; i < answers.size(); i++) {
                answer = (DemographicAnswer)answers.get(i);
                s.append("<option value=\"");
                s.append(answer.getAnswerId());
                s.append("\"");
                if (getDefaultValue()!=null && getDefaultValue().equals(String.valueOf(answer.getAnswerId()))) {
                    s.append(" selected");
                }
                s.append(">");
                s.append(answer.getText());
                s.append("</option>\n");
            }
        }
        s.append("</select>\n");
        return s.toString();
    }



}


