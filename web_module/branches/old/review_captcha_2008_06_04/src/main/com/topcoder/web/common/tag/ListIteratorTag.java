package com.topcoder.web.common.tag;

import javax.servlet.jsp.JspException;
import java.util.List;

/**
 * @author Greg Paul
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

    public void release() {
        this.list = null;
        super.release();
    }


}
