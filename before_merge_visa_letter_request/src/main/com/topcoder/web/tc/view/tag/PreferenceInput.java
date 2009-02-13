/*
 * PreferenceInput.java
 *
 * Created on October 5, 2004, 11:19 AM
 */

package com.topcoder.web.tc.view.tag;

/**
 *
 * @author  rfairfax
 */

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.tag.BaseTag;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.Preference;
import com.topcoder.web.tc.model.PreferenceValue;

import javax.servlet.jsp.JspException;
import java.io.IOException;
import java.util.List;

public class PreferenceInput extends BaseTag {
    protected static Logger log = Logger.getLogger(PreferenceInput.class);

    private String styleClass;
    private Preference preference;

    public PreferenceInput() {
        super();
        styleClass = null;
    }

    public void setStyleClass(String cssclass) {
        this.styleClass = cssclass;
    }

    public void setPreference(Preference preference) {
        this.preference = preference;
    }

    public int doStartTag()
            throws JspException {
        if (preference != null) {
            StringBuffer output = new StringBuffer(400);
            setName(Constants.PREFERENCE_PREFIX + preference.getID());
            if (preference.getType() == Constants.PREFERENCE_MULTIPLE_ANSWER) {
                output.append(buildSelect());
            } else if (preference.getType() == Constants.PREFERENCE_TEXT_ANSWER) {
                output.append(buildText());
            } else {
                output.append(buildCheckbox());
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
        s.append("<input type=\"text\" size=50 ");
        s.append(" name=\"");
        s.append(name);
        s.append("\"");
        if (styleClass != null) {
            s.append(" class=\"" + styleClass + "\"");
        }
        s.append(" value=\"");
        if (getDefaultValue() != null) {
            s.append(getDefaultValue());
        }
        s.append("\" ");
        s.append("/>");
        return s.toString();
    }


    private String buildCheckbox() {
        StringBuffer s = new StringBuffer(500);
        s.append("<input type=\"checkbox\" ");
        s.append(" name=\"");
        s.append(name);
        s.append("\"");
        if (styleClass != null) {
            s.append(" class=\"" + styleClass + "\"");
        }
        s.append(" value=\"");
        s.append(getTrueValue());
        s.append("\" ");
        if (getDefaultValue() != null && getDefaultValue().equals(getTrueValue())) {
            s.append("checked ");
        }

        s.append("/>");
        return s.toString();
    }

    private String getTrueValue() {
        List answers = preference.getPrefValues();
        if (answers != null) {
            PreferenceValue answer = null;
            for (int i = 0; i < answers.size(); i++) {
                answer = (PreferenceValue) answers.get(i);
                if (answer.getText().equals("true"))
                    return String.valueOf(answer.getID());
            }
        }
        return "";
    }

    private String buildSelect() {
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
        s.append(">\n");
        List answers = preference.getPrefValues();
        if (answers != null) {
            s.append("<option value=\"\"> - </option>");
            PreferenceValue answer = null;
            for (int i = 0; i < answers.size(); i++) {
                answer = (PreferenceValue) answers.get(i);
                s.append("<option value=\"");
                s.append(answer.getID());
                s.append("\"");
                if (getDefaultValue() != null && getDefaultValue().equals(String.valueOf(answer.getID()))) {
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

    protected void init() {
        this.styleClass = null;
        this.preference = null;

    }


}

