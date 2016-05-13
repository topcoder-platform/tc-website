/*
 * Copyright (C) 2016 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.tag;

import com.topcoder.web.common.security.synchronizerToken.SynchronizerTokenPattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;

import static com.topcoder.web.common.security.synchronizerToken.SynchronizerTokenPatternConfig.CONTEXT_ATTR_PATTERN_IMPL;

/**
 * <p>A custom JSP tag which is used for rendering a hidden input element carrying the synchronizer token associated
 * with the HTML form.</p>
 *
 * @author isv
 */
public class SynchronizerTokenTag extends BodyTagSupport {

    /**
     * <p>A <code>String</code> providing the value for operationType property.</p>
     */
    private String operationType; 

    /**
     * <p>Constructs new <code>SynchronizerTokenTag</code> instance. This implementation does nothing.</p>
     */
    public SynchronizerTokenTag() {
    }

    /**
     * <p>Handles the event of start of tag. This implementation determines the details for synchronizer token to be
     * sent by client in context of current session for requested operation type and renders respective hidden input
     * element on the page to carry such a synchronizer token.</p>
     * 
     * @return {@link #SKIP_BODY} always.
     * @throws JspTagException if there is no active session or some error encountered while writing to JSP output.
     */
    public int doStartTag() throws JspException {
        HttpSession session = pageContext.getSession();
        if (session != null) {
            ServletContext servletContext = session.getServletContext();
            SynchronizerTokenPattern synchronizerTokenPattern
                = (SynchronizerTokenPattern) servletContext.getAttribute(CONTEXT_ATTR_PATTERN_IMPL);

            String inputName = synchronizerTokenPattern.getParameterName(session, getOperationType());
            String inputValue = synchronizerTokenPattern.getExpectedToken(session, getOperationType());
            
            // This should never happen but it is better to check this before continuing
            if (inputName == null || inputValue == null) {
                throw new JspTagException("Something wrong with security check");
            }

            StringBuilder ret = new StringBuilder();

            ret.append("<input type=\"hidden\" name=\"").append(inputName).append("\" ");
            ret.append("value=\"").append(inputValue).append("\"");
            ret.append("/>");

            try {
                pageContext.getOut().print(ret.toString());
            } catch (IOException ioe) {
                throw new JspException("Error in SynchronizerTokenTag", ioe);
            }

            return SKIP_BODY;
        } else {
            // There is no active session - better throw an exception as there are chances that security might have been
            // compromised
            throw new JspTagException("There is no active session");
        }
    }

    /**
     * <p>Handles the event of end of tag.</p>
     * 
     * @return {@link #EVAL_PAGE} always.
     * @throws JspException if an unexpected error occurs.
     */
    public int doEndTag() throws JspException {
        this.id = null;
        return super.doEndTag();
    }

    /**
     * <p>Gets the operationType property.</p>
     *
     * @return a <code>String</code> providing the value for operationType property.
     */
    public String getOperationType() {
        return this.operationType;
    }

    /**
     * <p>Sets the operationType property.</p>
     *
     * @param operationType a <code>String</code> providing the value for operationType property.
     */
    public void setOperationType(String operationType) {
        this.operationType = operationType;
    }
}
