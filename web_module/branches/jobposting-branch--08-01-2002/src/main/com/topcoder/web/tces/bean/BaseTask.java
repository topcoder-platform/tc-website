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
import java.text.*;

/**
 * A basic implementation of Task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public abstract class BaseTask implements Task {

    private static Logger log = Logger.getLogger(BaseTask.class);

    private InitialContext ctx;
    private String nextPage;

    public BaseTask() {
        setInitialContext(null);
        setNextPage(null);
    }

    public abstract void processStep(String step)  throws Exception;

    public void setInitialContext(InitialContext ctx) {
        this.ctx=ctx;
    }

    public InitialContext getInitialContext() {
        return ctx;
    }

    public void setNextPage(String nextPage) {
log.debug("next page -> "+nextPage);
        this.nextPage=nextPage;
    }

    public String getNextPage() {
        return nextPage;
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
     	throws Exception
    {
	}

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
    	throws Exception
    {
    }

    public abstract void setAttributes(String paramName, String paramValues[]);

    public String dateToString(TCTimestampResult timestamp) {
        StringTokenizer tok1 = new StringTokenizer(
                (timestamp.toString());
        StringTokenizer token = new StringTokenizer(
                (String) tok1.nextElement(), "-");

        String year = (String) token.nextElement();
        String returnString = "";
        while (token.hasMoreElements()) {
            returnString += (String) token.nextElement() + "/";
        }

        return returnString + year;
    }

}

