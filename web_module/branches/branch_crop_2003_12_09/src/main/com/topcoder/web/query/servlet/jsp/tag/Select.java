package com.topcoder.web.query.servlet.jsp.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.util.Iterator;
import java.util.List;

public abstract class Select extends TagSupport {

    private String name = null;
    private String ccsclass = null;
    private String onChange = null;
    private String selectedValue = null;
    private String selectedText = null;
    private boolean selectedOnly = false;
    private String size = null;
    private String multiple = null;

    public void setName(String name) {
        this.name = name;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public void setMultiple(String multiple) {
        this.multiple = multiple;
    }

    public void setClass(String ccsclass) {
        this.ccsclass = ccsclass;
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
        this.selectedOnly = selectedOnly != null && (selectedOnly.equalsIgnoreCase("yes")
                || selectedOnly.equalsIgnoreCase("true"));
    }

    public int doStartTag() throws JspException {
        return SKIP_BODY;
    }

    public int doEndTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            if (selectedOnly) {
                out.write(getSelected());
            } else {
                out.write(buildSelect());
            }
        } catch (Exception e) {
            throw new JspException(e.toString());
        }
        return EVAL_PAGE;
    }

    String getSelected() throws JspException {
        return getSelected(getSelectOptions());
    }

    String getSelected(List options) {
        Iterator it = options.iterator();
        for (; it.hasNext();) {
            Object option = it.next();
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

    String buildSelect() throws JspException {
        return buildSelect(getSelectOptions());
    }

    String buildSelect(List options) throws JspException {
        StringBuffer s = new StringBuffer(2000);
        s.append("<select");
        if (name != null) {
            s.append(" name=\"" + name + "\"");
        }
        if (ccsclass != null) {
            s.append(" class=\"" + ccsclass + "\"");
        }
        if (onChange != null) {
            s.append(" onChange=\"" + onChange + "\"");
        }
        if (size != null) {
            s.append(" size=\"" + size + "\"");
        }
        if (multiple != null) {
            s.append(" multiple=\"" + multiple + "\"");
        }
        s.append(">\n");
        if (options != null) {
            s.append("<option value=\"\"></option>");
            Iterator it = options.iterator();
            for (; it.hasNext();) {
                Object option = it.next();
                String optionValue = getOptionValue(option);
                String optionText = getOptionText(option);
                s.append("<option value=\"");
                s.append(optionValue);
                s.append("\"");
                if (selectedValue != null && selectedValue.equals(optionValue) ||
                        selectedText != null && selectedText.equals(optionText)) {
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

    abstract List getSelectOptions() throws JspException;
}
