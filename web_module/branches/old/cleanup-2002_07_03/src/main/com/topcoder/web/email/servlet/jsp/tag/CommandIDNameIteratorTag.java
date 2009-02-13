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
 * Custom tag to iterate through a list of command id/description pairs.
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */


public class CommandIDNameIteratorTag
    extends IDNameIteratorTag
{
    Map getIdToNameMap()
        throws JspException
    {
        try {
            return StatisticsUtilities.getCommandMap();
        } catch (ServletException e) {
            throw new JspException(e.toString());
        }
    }
}
