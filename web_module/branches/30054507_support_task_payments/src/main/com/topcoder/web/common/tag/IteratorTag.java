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
 * @author James Lee (jameslee@cs.stanford.edu)
 */
public class IteratorTag extends BodyTagSupport {

    private static Logger log = Logger.getLogger(IteratorTag.class);
    // Collection to iterate through
    protected Collection collection;
    // Iterator to iterate through
    protected Iterator iterator;

    protected String type;

    protected Integer begin;

    protected Integer end;

    private int currIndex = 0;

    public void setBegin(Integer begin) {
        this.begin = begin;
    }

    public void setEnd(Integer end) {
        this.end = end;
    }

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
        if (iterator == null) {
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
        return iterator.hasNext() ? EVAL_BODY_AGAIN : SKIP_BODY;
    }

    public void doInitBody() throws JspException {
        //log.debug("doInitBody() called, collection = " + collection + " iterator = " + iterator);
        log.debug("doInitBody called index " + currIndex + " begin " + begin + " end " + end);
        if (begin != null && begin > currIndex) {
            while (currIndex < begin) {
                iterator.next();
                currIndex++;
            }
        }
        if (iterator.hasNext()) {
            pageContext.setAttribute(getId(), iterator.next());
        }
    }

    public int doAfterBody() throws JspException {
        //log.debug("doAfterBody() called, collection = " + collection + " iterator = " + iterator);
        boolean indexOk = (end == null || currIndex < end);
        //log.debug("doAfterBody called index " + currIndex + " begin " + begin + " end " + end + "indexok " + indexOk);
        if (iterator.hasNext() && indexOk) {
            //log.debug("in here like we have another item");
            pageContext.setAttribute(getId(), iterator.next());
            //log.debug("get attribute " + getId() + " " + pageContext.getAttribute(getId()));
            currIndex++;
            return EVAL_BODY_AGAIN;
        } else {
            //log.debug("in here like we're writting things out.");
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
     * end of execution.
     */
    public int doEndTag() throws JspException {
        release();
        return super.doEndTag();
    }
    

    public void release() {
        this.collection = null;
        this.iterator = null;
        this.type = null;
        this.begin = null;
        this.end = null;
        this.currIndex = 0;
        super.release();
    }


}

