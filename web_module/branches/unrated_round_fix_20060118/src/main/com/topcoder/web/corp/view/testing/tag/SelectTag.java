package com.topcoder.web.corp.view.testing.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public abstract class SelectTag extends TagSupport {
    protected String name;
    protected String selected;

    /**
     * Sets the value of <code>name</code>.
     *
     * @param name
     */
    public void setName(String val) {
        name = val;
    }

    /**
     * Sets the value of <code>selected</code>.
     *
     * @param selected
     */
    public void setSelected(String val) {
        selected = val;
    }

    /**
     * Builds an html select.
     *
     * @return Always return SKIP_BODY
     * @throws javax.servlet.jsp.JspException Thrown if name is not set or if there is a problem
     *                      writing out to page.
     */
    public int doStartTag() throws JspException {
        if (name == null) {
            throw new JspException("Name must be set");
        }
        StringBuffer buffer =
                new StringBuffer("<select name=\"" + name + "\">\n");

        buffer.append(writeOptions());
        buffer.append("</select>");

        try {
            pageContext.getOut().println(buffer.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }

        return SKIP_BODY;
    }

    protected abstract String writeOptions();


    public int doEndTag() throws JspException {
        name=null;
        selected=null;
        return super.doEndTag();
    }
}

