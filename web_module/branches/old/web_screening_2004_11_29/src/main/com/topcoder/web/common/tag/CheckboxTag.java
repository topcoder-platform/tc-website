package com.topcoder.web.common.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class CheckboxTag extends TagSupport {
    protected String name;
    protected String value;
    protected String checked;

    /**
     * Sets the value of <code>name</code>.
     *
     * @param val
     */
    public void setName( String val ) {
        name = val;
    }

    /**
     * Sets the value of <code>value</code>.
     *
     * @param val
     */
    public void setValue( String val ) {
        value = val;
    }

    /**
     * Sets the value of <code>checked</code>.
     *
     * @param val
     */
    public void setChecked( String val ) {
        checked = val;
    }

    public int doStartTag() throws JspException {
        if(name == null || value == null) {
            throw new JspException("Name and value must be set");
        }

        JspWriter out = pageContext.getOut();
        try {
            if(value.equals(checked)) {
                out.print("<input type=\"checkbox\" name=\"" + name + "\" value=\"" + value + "\" CHECKED>");
            }
            else {
                out.print("<input type=\"checkbox\" name=\"" + name + "\" value=\"" + value + "\">");
            }
        }
        catch(IOException e) {
            throw new JspException(e.getMessage());
        }

        return SKIP_BODY;
    }

    /**
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     */
    public int doEndTag() throws JspException {
        this.name = null;;
        this.value = null;
        this.checked = null;

        return super.doEndTag();
    }
}
