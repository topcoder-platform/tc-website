package com.topcoder.web.email.servlet.jsp.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.email.bean.StatisticsUtilities;

import javax.servlet.ServletException;
import javax.servlet.jsp.JspException;
import java.util.Map;

/**
 * Custom tag to iterate through a list of command id/description pairs.
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */


public class CommandIDNameIteratorTag
        extends IDNameIteratorTag {
    private static Logger log = Logger.getLogger(CommandIDNameIteratorTag.class);

    Map getIdToNameMap()
            throws JspException {
        try {
            return StatisticsUtilities.getCommandMap();
        } catch (ServletException e) {
            throw new JspException(e.toString());
        }
    }
}
