package com.topcoder.web.email.servlet.jsp.tag;

import java.util.*;
import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.topcoder.web.email.servlet.*;
import com.topcoder.web.email.bean.*;
import com.topcoder.shared.util.logging.Logger;

/**
 * Custom tag to iterate through all id's/name's of email
 * templates in a given group.
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */

public class TemplateIDNameIteratorTag
    extends IDNameIteratorTag
{
    private static Logger log = Logger.getLogger(TemplateIDNameIteratorTag.class);
    
    // the template group
    protected int group;

    public void setGroup(String group)
    {
        try {
            this.group = Integer.parseInt(group);
        } catch (NumberFormatException e) {
            this.group = 0;
        }
    }

    Map getIdToNameMap()
        throws JspException
    {
        try {
            return TemplateTask.getTemplateMap(group);
        } catch (ServletException e) {
            throw new JspException(e.toString());
        }
    }
}
