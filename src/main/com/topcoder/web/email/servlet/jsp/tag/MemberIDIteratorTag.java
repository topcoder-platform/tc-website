package com.topcoder.web.email.servlet.jsp.tag;

import java.util.*;
import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.topcoder.web.email.servlet.*;
import com.topcoder.web.email.bean.*;

/**
 * Custom tag to iterate through all the member id's
 * of a given address list
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */


public class MemberIDIteratorTag
    extends IteratorTag
{
    // id of address list
    protected int addressListID;

    public void setAddressListID(String addressListID)
    {
        try {
            this.addressListID = Integer.parseInt(addressListID);
        } catch (NumberFormatException e) {
            this.addressListID = -1;    
        }
    }

    Object getElementAt(int index)
    {
        Object element = super.getElementAt(index);
        if (element != null) {
            return String.valueOf(element);
        } else {
            return null;
        }
    }

    public int doStartTag()
        throws JspException
    {
        try {
            setCollection(AddressListTask.getMemberIds(addressListID));
        } catch (ServletException e) {
            throw new JspException(e.toString());
        }

        return super.doStartTag();
    }
}
