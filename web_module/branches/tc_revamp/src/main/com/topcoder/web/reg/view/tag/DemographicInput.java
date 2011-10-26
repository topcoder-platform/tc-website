package com.topcoder.web.reg.view.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.DemographicAnswer;
import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.common.tag.BaseTag;
import com.topcoder.web.reg.Constants;

import javax.servlet.jsp.JspException;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class DemographicInput extends BaseTag {
    protected static Logger log = Logger.getLogger(DemographicInput.class);

    private String styleClass;
    private DemographicQuestion question;
    private boolean showMulti;
    private String onchange;

    public DemographicInput() {
        super();
        styleClass = null;
        showMulti = true;
    }

    public void setOnchange(String s) {
        onchange = s;
    }

    public String getOnchange() {
        return onchange;
    }

    public void setShowMulti(boolean b) {
        showMulti = b;
    }

    public boolean getShowMulti() {
        return showMulti;
    }

    public void setStyleClass(String cssclass) {
        this.styleClass = cssclass;
    }

    public void setQuestion(DemographicQuestion question) {
        this.question = question;
    }

    public int doStartTag()
            throws JspException {
        if (question != null) {
            StringBuffer output = new StringBuffer(400);
            setName(Constants.DEMOG_PREFIX + question.getId());
            if (question.isFreeForm()) {
                output.append(buildText());
            } else if (question.isMultipleSelect()) {
                if (showMulti) {
                    output.append(buildSelect(true));
                } else {
                    output.append(buildSelect(false));
                }
            } else if (question.isSingleSelect()) {
                output.append(buildSelect(false));

            }
            try {
                //log.debug("output: " + output.toString());
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
        if (styleClass != null) {
            s.append(" class=\"").append(styleClass).append("\"");
        }
        if (onchange != null) {
            s.append(" onchange=\"").append(onchange).append("\"");
        }
        s.append(" value=\"");
        s.append(getDefaultValue() == null ? "" : getDefaultValue());
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
        if (styleClass != null) {
            s.append(" class=\"");
            s.append(styleClass);
            s.append("\"");
        }
        if (onchange != null) {
            s.append(" onchange=\"").append(onchange).append("\"");
        }
        if (multiple) {
            s.append(" size=\"4\" multiple");
        }
        s.append(">\n");
        if (question.getAnswers() != null) {
            if (!multiple) {
                s.append("<option value=\"\"></option>");
            }
            DemographicAnswer answer;
            for (Iterator it = question.getAnswers().iterator(); it.hasNext();) {
                answer = (DemographicAnswer) it.next();
                s.append("<option value=\"");
                s.append(answer.getId());
                s.append("\"");
                if (!question.isMultipleSelect()) {
                    if (getDefaultValue() != null && getDefaultValue().equals(String.valueOf(answer.getId()))) {
                        s.append(" selected");
                    }
                } else {
                    if (getDefaultValue() != null && ((List) getDefaultValue()).contains(String.valueOf(answer.getId())))
                    {
                        s.append(" selected");
                    }
                }
                s.append(">");
                s.append(answer.getText());
                s.append("</option>\n");
            }
        }
        s.append("</select>\n");
        return s.toString();
    }


    protected void init() {
        this.styleClass = null;
        this.question = null;
        this.showMulti = true;
        this.onchange = null;

    }

}
