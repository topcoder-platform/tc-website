package com.topcoder.web.query.servlet;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.query.common.Constants;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;


/**
 * The servlet to handle query tool http requests.
 * @author Greg Paul
 * @version $Revision$
 *
 */

public class Controller extends BaseServlet {
    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.init(config);
    }

}



