package com.topcoder.web.common.tag;

public class ChkBoxTag extends BaseTag {
    private String value;

    public int doStartTag() {
        StringBuffer ret = new StringBuffer();
        try {
            ret.append("<input type=\"checkbox\" name=\"").append(name).append("\" ");

            if (value == null) {
                value = getDefaultValue()==null?null:getDefaultValue().toString();
            }
            if (value != null) {
                boolean checked = "true".equalsIgnoreCase(value);
                if (checked) {
                    ret.append("checked=\"").append(value).append("\" ");
                }
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

    public void setValue(boolean value) {
        this.value = new Boolean(value).toString();
    }

}

