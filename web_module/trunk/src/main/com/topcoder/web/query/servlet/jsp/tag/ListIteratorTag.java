package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.shared.util.logging.Logger;

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
