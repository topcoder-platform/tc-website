package com.topcoder.web.tc.view.reg.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.util.ArrayList;
import java.io.IOException;

public abstract class Select
        extends TagSupport {
    private String name = null;
/*
    private String value = null;
*/
    private String styleClass = null;
    private String onChange = null;
    private String selectedValue = null;
    private String selectedText = null;
    private boolean selectedOnly = false;

    public void setName(String name) {
        this.name = name;
    }

/*
    public void setValue(String value) {
        this.value = value;
    }
*/

    public void setStyleClass(String ccsclass) {
        this.styleClass = ccsclass;
    }

    public void setOnChange(String onChange) {
        this.onChange = onChange;
    }

    public void setSelectedValue(String selectedValue) {
        this.selectedValue = selectedValue;
    }

    public void setSelectedText(String selectedText) {
        this.selectedText = selectedText;
    }

    public void setSelectedOnly(String selectedOnly) {
        this.selectedOnly = selectedOnly != null && (selectedOnly.equalsIgnoreCase("yes") || selectedOnly.equalsIgnoreCase("true"));
    }

    public int doStartTag()
            throws JspException {
        return SKIP_BODY;
    }

    public int doEndTag()
            throws JspException {
        JspWriter out = pageContext.getOut();
        try {
            if (selectedOnly) {
                out.write(getSelected());
            } else {
                out.write(buildSelect());
            }
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return EVAL_PAGE;
    }

    String getSelected()
            throws JspException {
        return getSelected(getSelectOptions());
    }

    String getSelected(ArrayList options) {
        for (int i = 0; i < options.size(); i++) {
            Object option = options.get(i);
            String optionValue = getOptionValue(option);
            String optionText = getOptionText(option);
            if (selectedValue != null && optionValue != null && selectedValue.equals(optionValue)) {
                return optionText;
            } else if (selectedText != null && optionText != null && selectedText.equals(optionText)) {
                return optionValue;
            }
        }
        return "";
    }

    String buildSelect()
            throws JspException {
        return buildSelect(getSelectOptions());
    }

    String buildSelect(ArrayList options)
            throws JspException {
        StringBuffer s = new StringBuffer(2000);
        s.append("<select");
        if (name != null) {
            s.append(" name=\"" + name + "\"");
        }
        //if (value != null)
        //{
        //s.append(" value=\""+value+"\"");
        //}
        //else
        //{
        //s.append(" value=\"\"");
        //}
        if (styleClass != null) {
            s.append(" class=\"" + styleClass + "\"");
        }
        if (onChange != null) {
            s.append(" onChange=\"" + onChange + "\"");
        }
        s.append(">\n");
        if (options != null) {
            //////////// BEG -ADDED BY SB ///////////////
            s.append("<option value=\"\"></option>");
            //////////// END -ADDED BY SB ///////////////
            for (int i = 0; i < options.size(); i++) {
                Object option = options.get(i);
                String optionValue = getOptionValue(option);
                String optionText = getOptionText(option);
                s.append("<option value=\"");
                s.append(optionValue);
                s.append("\"");
                if (selectedValue != null && selectedValue.equals(optionValue) || selectedText != null && selectedText.equals(optionText)) {
                    s.append(" selected");
                }
                s.append(">");
                s.append(optionText);
                s.append("</option>\n");
            }
        }
        s.append("</select>\n");
        return s.toString();
    }

    abstract String getOptionValue(Object o);

    abstract String getOptionText(Object o);

    abstract ArrayList getSelectOptions()
            throws JspException;
}
