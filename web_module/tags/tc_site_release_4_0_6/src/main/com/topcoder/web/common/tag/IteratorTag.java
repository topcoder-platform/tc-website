package com.topcoder.web.common.tag;


import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;


/**
 * Custom tag that iterates through a collection of Objects
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 */
public class IteratorTag extends BodyTagSupport {

    private static Logger log = Logger.getLogger(IteratorTag.class);
    // Collection to iterate through
    protected Collection collection;
    // Iterator to iterate through
    protected Iterator iterator;

    protected String type;

    public void setCollection(Collection collection) {
        // if the collection is null, use an empty list
        if (collection == null) {
            this.collection = new ArrayList();
        } else {
            this.collection = collection;
        }
        this.iterator = this.collection.iterator();
    }

    public void setIterator(Iterator iterator) {
        if (iterator==null) {
            this.iterator = new ArrayList().iterator();
        } else {
            this.iterator = iterator;
        }

    }

    public void setType(String type) {
        this.type = type;
    }

    public int doStartTag() throws JspException {
        //log.debug("doStartTag() called, collection = " + collection + " iterator = " + iterator);
        return iterator.hasNext() ? EVAL_BODY_TAG : SKIP_BODY;
    }

    public void doInitBody() throws JspException {
        //log.debug("doInitBody() called, collection = " + collection + " iterator = " + iterator);
        if (iterator.hasNext()) {
            pageContext.setAttribute(getId(), iterator.next());
        }
    }

    public int doAfterBody() throws JspException {
        //log.debug("doAfterBody() called, collection = " + collection + " iterator = " + iterator);
        if (iterator.hasNext()) {
            pageContext.setAttribute(getId(), iterator.next());
            //log.debug("get attribute " + getId() + " " + pageContext.getAttribute(getId()));
            return EVAL_BODY_TAG;
            } else {
            try {
                if (bodyContent != null) {
                    bodyContent.writeOut(getPreviousOut());
                }
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }
            return SKIP_BODY;
        }
    }

    /**
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     */
    public int doEndTag() throws JspException {
        this.collection = null;
        this.iterator = null;
        this.type = null;
        return super.doEndTag();
    }
}

