package com.topcoder.web.common.tag;

/**
 * User: dok
 * Date: Dec 14, 2004
 */
public class HiddenInputTag extends BaseTag {

    private String value;
    private String name;

    public int doStartTag() {
        StringBuffer ret = new StringBuffer();

            ret.append("<input type=\"hidden\" name=\"").append(name).append("\" ");
            if (value == null) {
                value = getDefaultValue()==null?null:getDefaultValue().toString();
            }
            if (value != null) {
                ret.append("value=\"").append(value).append("\" ");
            }
            ret.append("/>");
        try {
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

    /**
     * Sets the name
     * @param name The name to set
     */
    public void setName(String name) {
        this.name = name;
    }




}
