package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import java.util.List;

/**
 *
 * @author  Greg Paul
 */
public class LinkIteratorTag extends IteratorTag {
    
    private static Logger log = Logger.getLogger(RowIteratorTag.class);

    List linkList;

    public void setLinkList(List linkList) {
        this.linkList = linkList;
    }

    public int doStartTag()
            throws JspException {
        setCollection(linkList);

        return super.doStartTag();
    }
    
}
