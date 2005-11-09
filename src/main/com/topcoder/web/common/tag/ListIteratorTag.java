package com.topcoder.web.common.tag;

import javax.servlet.jsp.JspException;
import java.util.List;

/**
 *
 * @author  Greg Paul
 */
public class ListIteratorTag extends IteratorTag {

    List list;

    public void setList(List list) {
        this.list = list;
    }

    public void setListKey(String name) {
        this.list = (List) pageContext.findAttribute(name);
    }

    public int doStartTag() throws JspException {
        setCollection(list);

        return super.doStartTag();
    }

    /**
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     */
    public int doEndTag() throws JspException {
        this.list = null;
        return super.doEndTag();
    }

}
