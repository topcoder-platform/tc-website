package com.topcoder.web.tces.bean;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.web.tces.common.*;
import com.topcoder.web.tces.ejb.TCESServices.TCESServices;
import com.topcoder.web.tces.ejb.TCESServices.TCESServicesHome;

import javax.naming.InitialContext;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

/**
 * A base interface for task processors called by the TCES controller.
 * @author bigjake <kitz@mit.edu>
 *
 */

public interface Task {

    void processStep(String step)
        throws Exception;

    void setInitialContext(InitialContext ctx);

    InitialContext getInitialContext();

    void setNextPage(String nextPage);

    String getNextPage();

    void servletPreAction(HttpServletRequest request, HttpServletResponse response)
     	throws Exception;

    void servletPostAction(HttpServletRequest request, HttpServletResponse response)
     	throws Exception;

    void setAttributes(String paramName, String paramValues[]);

}

