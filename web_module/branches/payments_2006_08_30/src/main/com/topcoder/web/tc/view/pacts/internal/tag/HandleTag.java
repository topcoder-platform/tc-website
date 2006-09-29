package com.topcoder.web.tc.view.pacts.internal.tag;        

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Tag for using handles in PACTS.
 * It just provides an appropiate link to the view user page.
 *  
 * @author Cucu
 */
public class HandleTag extends TagSupport {
    private static final Logger log = Logger.getLogger(HandleTag.class);
    private long coderId;
    private String handle;


    public void setCoderId(long coderId) {
        this.coderId = coderId;
    }

    public void setHandle(String handle) {
    	this.handle = handle;
    }

    public int doStartTag() throws JspException {
        try {
            StringBuffer output = new StringBuffer();
            output.append("<a href=\"");
            output.append(PactsConstants.INTERNAL_SERVLET_URL + "?t=view&c=user&" + 
            		PactsConstants.USER_ID + "=" + coderId);
           output.append("\">");           
           output.append(handle);           
           output.append("</a>");
           pageContext.getOut().print(output.toString());
        } catch (Exception e) {
            log.error("PACTS Handle tag, error creating tag.");
            throw new JspException(e);
        }
        return SKIP_BODY;
    }

    /**
     * Because the app server (JBoss) is caching the tag,
     * we have to clear out all the instance variables at the
     * end of execution.
     */
    public int doEndTag() throws JspException {
        coderId = 0;
        handle = null;
        return super.doEndTag();
    }

}