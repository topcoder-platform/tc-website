package com.topcoder.web.common.tag;

/**
 * User: dok
 * Date: Jan 3, 2005
 * Time: 5:53:26 PM
 *
 * Version 1.1 (Topcoder - Add New Payment Provider) 08/08/2017
 * - Add "disabled" attribute
 *
 * @author dok, TCSCODER
 * @version 1.1
 */
public class RadioButtonTag extends BaseTag {
    private String value = null;
    private String selected = null;
    private String onClick = null;
    private String disabled = null;

    public int doStartTag() {
        StringBuffer ret = new StringBuffer();
        try {
            ret.append("<input type=\"radio\" name=\"").append(name).append("\" ");
            ret.append(" value=\"").append(value).append("\" ");

            if (selected == null) {
                selected = getDefaultValue() == null ? null : getDefaultValue().toString();
            }
            boolean checked = value.equalsIgnoreCase(selected) || "true".equalsIgnoreCase(selected);
            if (checked) {
                ret.append("checked=\"checked\" ");
            }
            if (onClick != null)
                ret.append("onClick=\"").append(onClick).append("\" ");
            if (disabled != null) {
                ret.append("disabled ");
            }
            ret.append("/>");
            pageContext.getOut().print(ret.toString());
        } catch (java.io.IOException ioe) {
        }
        return SKIP_BODY;
    }

    /**
     * Sets the value.
     * @param value The value to set
     */
    public void setValue(String value) {
        this.value = value;
    }

    public void setSelected(String selected) {
        this.selected = selected;
    }

    public void setOnClick(String onClick) {
        this.onClick = onClick;
    }

    public void setDisabled(String disabled) {
        this.disabled = disabled;
    }

    protected void init() {
        this.value = null;
        this.selected = null;
        this.onClick = null;
    }

}

