package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import java.util.List;

/**
 *
 * @author  Greg Paul
 */
public class ListIteratorTag extends IteratorTag {
    
    private static Logger log = Logger.getLogger(ListIteratorTag.class);

    List list;

    public void setList(List list) {
        this.list = list;
    }

    public int doStartTag() throws JspException {
        setCollection(list);

        return super.doStartTag();
    }
    
}
