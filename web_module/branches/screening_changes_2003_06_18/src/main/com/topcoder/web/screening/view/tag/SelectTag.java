package com.topcoder.web.screening.view.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public abstract class SelectTag extends TagSupport {
    protected String name;
    protected String selected;

    /**
     * Sets the value of <code>name</code>.
     *
     * @param name
     */
    public void setName( String val )
    {
        name = val;
    }

    /**
     * Sets the value of <code>selected</code>.
     *
     * @param selected
     */
    public void setSelected( String val )
    {
        selected = val;
    }

    /** 
     * Builds an html select. 
     * 
     * @return Always return SKIP_BODY
     * @throws JspException Thrown if name is not set or if there is a problem
     *                      writing out to page.
     */
    public int doStartTag() throws JspException
    {
        if(name == null) {
            throw new JspException("Name must be set");
        }
        StringBuffer buffer = 
            new StringBuffer("<select name=\"" + name + "\">\n");

        buffer.append(writeOptions());
        buffer.append("</select>");

        try {
            pageContext.getOut().println(buffer.toString());
        }
        catch(IOException e) {
            throw new JspException(e.getMessage());
        }

        return SKIP_BODY;
    }

    protected abstract String writeOptions();
}

