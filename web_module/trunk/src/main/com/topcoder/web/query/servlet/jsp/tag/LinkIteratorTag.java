package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import java.util.List;

/**
 *
 * @author  Greg Paul
 */
public class LinkIteratorTag extends IteratorTag {
    
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
