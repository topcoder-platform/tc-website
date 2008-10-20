package com.topcoder.web.corp.controller;

import com.topcoder.common.web.util.Data;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.corp.common.TCESConstants;

import javax.servlet.ServletException;


/**
 * The servlet to handle TCES http requests.  This controller also handles
 * setting up the tasks Authentication token to find userId, and checks to
 * make sure the user has proper Authorization to access the specified task.
 * @author Greg Paul
 * @author Dan Cohn
 * @version $Revision$
 *
 */

public class TCESServlet extends BaseServlet {
    private static Logger log = Logger.getLogger(TCESServlet.class);

    /**
     * Initializes the servlet.
     * @throws javax.servlet.ServletException
     */
    public void init() throws ServletException {
        TCESConstants.init(getServletConfig());
        try {
            Data.initializeDataTypes();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}