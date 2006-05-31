package com.topcoder.web.email.servlet.jsp.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.email.bean.AddressListTask;

import javax.servlet.ServletException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;

/**
 * Custom tag to retrieve the name of an address list, given its id
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */

public class AddressListNameTag
        extends BodyTagSupport {
    private static Logger log = Logger.getLogger(AddressListNameTag.class);

    // the list id
    protected int listId;

    public void setListId(String listId) {
        try {
            this.listId = Integer.parseInt(listId);
        } catch (NumberFormatException e) {
            this.listId = 0;
        }
    }


    public int doStartTag()
            throws JspException {
        return EVAL_BODY_BUFFERED;
    }

    public void doInitBody()
            throws JspException {
        try {
            pageContext.setAttribute(getId(), AddressListTask.getAddressListName(listId));
        } catch (ServletException e) {
            throw new JspException(e.toString());
        }
    }

    public int doAfterBody()
            throws JspException {
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
