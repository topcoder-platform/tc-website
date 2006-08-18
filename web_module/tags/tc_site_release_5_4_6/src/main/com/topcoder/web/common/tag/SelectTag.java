package com.topcoder.web.common.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import java.util.Collection;
import java.util.Iterator;

public abstract class SelectTag extends BaseTag {
    private String styleClass = null;
    private String onChange = null;
    private String selectedValue = null;
    private String selectedText = null;
    private boolean selectedOnly = false;
    private boolean useTopValue = true;
    private String size = null;
    private String multiple = null;
    private String topValue = null;
    private String topText = null;

    public void setUseTopValue(String s) {
        useTopValue = "true".equalsIgnoreCase(s);
    }

    public void setTopValue(String topValue) {
        this.topValue = topValue;
    }

    public void setTopText(String topText) {
        this.topText = topText;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public void setMultiple(String multiple) {
        this.multiple = multiple;
    }

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
        this.selectedOnly = selectedOnly != null && (selectedOnly.equalsIgnoreCase("yes")
                || selectedOnly.equalsIgnoreCase("true"));
    }

    public int doStartTag() throws JspException {
        return SKIP_BODY;
    }

    /**
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     */
    public int doEndTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            if (selectedOnly) {
                out.write(getSelected());
            } else {
                out.write(buildSelect());
            }
        } catch (Exception e) {
            throw new JspException(e.getMessage());
        }
        return super.doEndTag();
    }

    protected void init() {
        this.styleClass = null;
        this.onChange = null;
        this.selectedValue = null;
        this.selectedText = null;
        this.selectedOnly = false;
        this.size = null;
        this.multiple = null;
        this.topValue = null;
        this.topText = null;
        this.useTopValue = true;
    }

    String getSelected() throws JspException {
        if (selectedValue != null && topValue != null && selectedValue.equals(topValue)) {
            return topText;
        } else if (selectedText != null && topText != null && selectedText.equals(topText)) {
            return topValue;
        }
        return getSelected(getSelectOptions());
    }

    String getSelected(Collection options) {
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

    String buildSelect(Collection options) throws JspException {
        StringBuffer s = new StringBuffer(2000);
        s.append("<select");
        if (name != null) {
            s.append(" name=\"" + name + "\"");
        }
        if (styleClass != null) {
            s.append(" class=\"" + styleClass + "\"");
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
        if (useTopValue) {
            s.append("<option value=\"");
            s.append(topValue == null ? "" : topValue);
            s.append("\"");
            if (selectedValue != null && topValue != null && selectedValue.equals(topValue) ||
                    selectedText != null && topText != null && selectedText.equals(topValue)) {
                s.append(" selected");
            }
            s.append(">");
            s.append(topText == null ? "" : topText);
            s.append("</option>");
        }
        if (options != null) {
            if (selectedValue == null) {
                selectedValue = getDefaultValue() == null ? null : getDefaultValue().toString();
            }
            Iterator it = options.iterator();
            for (; it.hasNext();) {
                Object option = it.next();
                String optionValue = getOptionValue(option);
                String optionText = getOptionText(option);
                s.append("<option value=\"");
                s.append(optionValue);
                s.append("\"");
                if (selectedValue != null && selectedValue.equals(optionValue) ||
                        selectedText != null && selectedText.equals(optionText)
                        ) {
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

    protected abstract String getOptionValue(Object o);

    protected abstract String getOptionText(Object o);

    protected abstract Collection getSelectOptions() throws JspException;
}
