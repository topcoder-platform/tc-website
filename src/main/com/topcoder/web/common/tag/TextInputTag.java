package com.topcoder.web.common.tag;

public class TextInputTag extends BaseTag {
    private String value;
    private int size = -1;
    private int maxlength = -1;
    private boolean passw = false;
    private String aclass = null;
    private String onKeyPress = null;
    private boolean editable = true;

    public int doStartTag() {
        StringBuffer ret = new StringBuffer();

        if (editable) {
            ret.append("<input type=\"").append(passw ? "password" : "text")
                    .append("\" name=\"").append(name).append("\" ");
            if (size >= 0) {
                ret.append("size=\"").append(size).append("\" ");
            }
            if (maxlength >= 0) {
                ret.append("maxlength=\"").append(maxlength).append("\" ");
            }
            if (aclass != null) {
                ret.append("class=\"").append(aclass).append("\" ");
            }
            if (onKeyPress != null) {
                ret.append("onKeyPress=\"").append(onKeyPress).append("\" ");
            }

            if (value == null) {
                value = (String) getDefaultValue();
            }
            if (value != null) {
                ret.append("value=\"").append(value).append("\" ");
            }
            ret.append("/>");
        } else {
            if (value == null) {
                value = (String) getDefaultValue();
            }
            if (value != null) {
                ret.append(value);
            }
        }
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
     * Sets the maxlength.
     * @param maxlength The maxlength to set
     */
    public void setMaxlength(int maxlength) {
        this.maxlength = maxlength;
    }

    /**
     * Sets the size.
     * @param size The size to set
     */
    public void setSize(int size) {
        this.size = size;
    }

    /**
     * Sets the passw.
     * @param passw The passw to set
     */
    public void setPassw(boolean passw) {
        this.passw = passw;
    }

    /**
     * Sets the aclass.
     * @param aclass The aclass to set
     */
    public void setClass(String aclass) {
        this.aclass = aclass;
    }

    /**
     * Sets the onKeyPress.
     * @param onKeyPress The onKeyPress to set
     */
    public void setOnKeyPress(String onKeyPress) {
        this.onKeyPress = onKeyPress;
    }

    /**
     * Sets the editable.
     * @param edit The editable to set
     */
    public void setEditable(String edit) {
        editable = edit.equalsIgnoreCase("true");
    }

       /**
     * Sets the editable.
     * @param edit The editable to set
     */
    public void setEditable(boolean edit) {
        editable = edit;
    }
}
