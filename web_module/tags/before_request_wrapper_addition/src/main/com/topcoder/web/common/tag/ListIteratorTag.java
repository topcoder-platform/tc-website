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

    public int doStartTag() throws JspException {
        setCollection(list);

        return super.doStartTag();
    }

}
