package com.topcoder.web.common.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * <p>
 * JSP Tag that will provide context information for writing a form tag.
 * Specifically, it will prepend the context information to the action
 * part of the form tag.
 * </p>
 *
 * @author Grimicus
 * @version 1.0
 */
public class FormTag extends TagSupport {
    private String action;
    private String method;
    private String onSubmit;
    private String name;

    /**
     * Sets the value of <code>name</code>.
     *
     * @param val
     */
    public void setName(String val) {
        name = val;
    }

    /**
     * Set the action parameter for the form tag.
     *
     * @param action The value of the action.
     *         This should be an absolute reference within the context of the
     *         web application.
     */
    public void setAction(String action) {
        this.action = action;
    }

    /**
     * Set the method for this form tag. For reference,
     * valid values for this are GET and POST.
     *
     * @param method The method.
     */
    public void setMethod(String method) {
        this.method = method;
    }

    /**
     * Set the javascript onSubmit parameter for this form tag. This parameter
     * is optional.
     *
     * @param onSubmit The value of onSubmit.
     */
    public void setOnSubmit(String onSubmit) {
        this.onSubmit = onSubmit;
    }

    /**
     * Method specific to JSP Tags.  Writes the &lt;form&gt; part of the tag.
     *
     * @return The JSP Tag specific return specifying the next action
     *          (Should always throw EVAL_BODY_INCLUDE)
     * @throws JspException Thrown if action or method was not set or if there
     *                  is IO trouble writing out the tag.
     */
    public int doStartTag() throws JspException {
        if (method == null || action == null)
            throw new JspException("method and action must be specified");

        StringBuffer buffer = new StringBuffer("<form ");
        buffer.append("action=\"");
        buffer.append(action + "\" ");
        buffer.append("method=\"" + method + "\"");

        if (onSubmit != null) {
            buffer.append(" onSubmit=\"" + onSubmit + "\"");
        }

        if (name != null) {
            buffer.append(" name=\"" + name + "\"");
        }

        buffer.append(">");

        try {
            pageContext.getOut().println(buffer.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }

        return EVAL_BODY_INCLUDE;
    }

    /**
     * JSP Tag specific method.  Writes out the &lt;/form&gt; tag.
     *
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     *
     * @return JSP TAG specific return (Always returns EVAL_PAGE)
     * @throws JspException Thrown if the write to the page fails.
     */
    public int doEndTag() throws JspException {
        try {
            pageContext.getOut().println("</form>");
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        this.action=null;
        this.method=null;
        this.onSubmit=null;
        this.name=null;


        return super.doEndTag();
    }
}
