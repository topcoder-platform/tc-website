package com.topcoder.web.common.tag;

/**
 * User: dok
 * Date: Jan 3, 2005
 * Time: 5:53:26 PM
 */
public class RadioButtonTag extends BaseTag {
    private String value=null;
    private String selected=null;

    public int doStartTag() {
        StringBuffer ret = new StringBuffer();
        try {
            ret.append("<input type=\"radio\" name=\"").append(name).append("\" ");

            if (selected==null) {
                selected = getDefaultValue()==null?null:getDefaultValue().toString();
            }
            boolean checked = value.equalsIgnoreCase(selected)||"true".equalsIgnoreCase(selected);
            if (checked) {
                ret.append("checked=\"").append(value).append("\" ");
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
        this.selected=selected;
    }

    protected void init() {
        this.value =null;
        this.selected=null;
    }

}

