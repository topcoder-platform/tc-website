package com.topcoder.web.hs.view.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTag;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.Tag;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

/**
 * Iterates over a list of error
 *
 * @author Nathan Egge
 * @version 1.0 2003/1/8
 */
public class ErrorIterator extends BodyTagSupport {

    private static final String ERROR_CONTAINER = "form_errors";

    private String name = null;

    private Iterator iterator = null;

    public void setName(String _name) {
        name = _name;
    }

    private String fetchNext() {
        String value = null;
        try {
            value = (String) iterator.next();
        } catch (Exception _e) {
            /* do nothing */
        }
        return (value);
    }

    public int doStartTag() {
        try {
            HashMap errors;
            errors = (HashMap) pageContext.getRequest().getAttribute(ERROR_CONTAINER);
            iterator = ((Collection) errors.get(name)).iterator();
        } catch (Exception _e) {
            iterator = null;
        }
        if (iterator == null || !iterator.hasNext()) {
            return (Tag.SKIP_BODY);
        }
        return (BodyTag.EVAL_BODY_TAG);
    }

    public void doInitBody() throws JspException {
        String error = fetchNext();
        if (error != null) {
            pageContext.setAttribute(getId(), error);
        }
    }

    public int doAfterBody() throws JspException {
        String error = fetchNext();
        if (error != null) {
            pageContext.setAttribute(getId(), error);
            return (BodyTag.EVAL_BODY_TAG);
        }
        try {
            if (bodyContent != null) {
                bodyContent.writeOut(getPreviousOut());
            }
        } catch (IOException _ioe) {
            throw(new JspException(_ioe.getMessage()));
        }
        return (Tag.SKIP_BODY);
    }

}

;
