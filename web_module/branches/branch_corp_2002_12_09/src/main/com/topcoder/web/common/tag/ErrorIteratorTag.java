package com.topcoder.web.common.tag;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTag;

public class ErrorIteratorTag extends BaseTag {
    private Iterator errIter = null;
    private int index = 0;
    private String id = null;

    /**
     * 
     * @see javax.servlet.jsp.tagext.Tag#doStartTag()
     */	
	public int doStartTag() {
        errIter = getErrIterator();
        if( errIter == null || ! errIter.hasNext() ) {
            return SKIP_BODY;
        }
        return BodyTag.EVAL_BODY_TAG;
	}

    /**
     * Sets the refname.
     * @param refname The refname to set
     */
    public void setRefname(String refname) {
        name = refname;
    }
    
    /**
     * @see javax.servlet.jsp.tagext.BodyTag#doAfterBody()
     */
    public int doAfterBody() throws JspException {
        String err = fetchNext();
        if( err != null) {
            pageContext.setAttribute(getId(), err);
            return EVAL_BODY_TAG;
        }
        try {
            if (bodyContent != null) {
                bodyContent.writeOut(getPreviousOut());
            }
        }
        catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }
    
    /**
     * @see javax.servlet.jsp.tagext.BodyTag#doInitBody()
     */
    public void doInitBody() throws JspException {
        String err = fetchNext();
        if( err != null) {
            pageContext.setAttribute(getId(), err);
        }
    }

    /**
     * 
     * @return String
     */
    private String fetchNext() {
        String ret = null;
        try {
            ret = (String)errIter.next();
        }
        catch(Exception ignore) { }
        return ret;
    } 
}
