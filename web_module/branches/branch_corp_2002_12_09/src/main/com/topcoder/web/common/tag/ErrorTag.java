package com.topcoder.web.common.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTag;

public class ErrorTag extends BaseTag implements BodyTag {
    private BodyContent content;
    private String msg = null;

    /**
     * 
     * @see javax.servlet.jsp.tagext.Tag#doStartTag()
     */	
	public int doStartTag() {
        msg = (String)getErrorMessage();
        if( msg != null && msg.length() != 0 ) {
            return EVAL_BODY_TAG;
        }
        else {
            return SKIP_BODY;
        }
	}

    /**
     * @see javax.servlet.jsp.tagext.Tag#doEndTag()
     */
    public int doEndTag() throws JspException {
        try {
            pageContext.getOut().print(msg);
        }
        catch(Exception e) {
        }
        return EVAL_PAGE;
    }

	
	/**
	 * Sets the refName.
	 * @param refName The refName to set
	 */
	public void setRefname(String refname) {
		name = refname;
	}

    /**
     * @see javax.servlet.jsp.tagext.BodyTag#doAfterBody()
     */
    public int doAfterBody() throws JspException {
        String body = content.getString();
        if( body == null || body.length() == 0 ) return SKIP_BODY;

        //there is some body - if $e will found then replace it with error msg
        int k = body.indexOf("$e");
        if( k < 0 ) return SKIP_BODY;
            
        msg = body.substring(0, k) + msg + body.substring(k+2);
        return SKIP_BODY;
    }

    /**
     * Does nothing
     * @see javax.servlet.jsp.tagext.BodyTag#doInitBody()
     */
    public void doInitBody() throws JspException {}

    /**
     * @see javax.servlet.jsp.tagext.BodyTag#setBodyContent(javax.servlet.jsp.tagext.BodyContent)
     */
    public void setBodyContent(BodyContent bc) {
        content = bc;
    }
}
