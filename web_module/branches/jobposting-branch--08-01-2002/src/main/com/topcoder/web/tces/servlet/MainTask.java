package com.topcoder.web.tces.servlet;

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
import java.io.*;
import java.util.*;

/**
 * Processes the "main" command.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class MainTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(MainTask.class);

	private String companyName;

	private int uid;

    public MainTask() {
        super();
        setNextPage(TCESConstants.JSP_ROOT + TCESConstants.MAIN_PAGE);

        uid=-1;
    }

	public void setCompanyName(String companyName) {
log.debug("setting company name: "+companyName);
		this.companyName = companyName;
	}

	public String getCompanyName() {
		return companyName;
	}

    public void servletPreAction(HttpServlet serv, HttpServletRequest request, HttpServletResponse response)
    	throws Exception
    {
        HttpSession session = request.getSession(true);

		Integer userId = (Integer)session.getAttribute("user_id");
		if (userId == null || (userId.intValue()>0) ) {
			log.debug("User not authenticated for access to ES main page.");
			throw new Exception("User not authenticated for access to ES main page.");
		}

		uid = userId.intValue();
	}

    public void processStep(String step)
        throws Exception
    {
        if (step == null) {
            viewMain();
            return;
        }
        else if (step.equalsIgnoreCase(TCESConstants.MAIN_TASK_STEP_GOCAMPAIGN)) {
			doGoCampaign();
			return;
		}
		else if (step.equalsIgnoreCase(TCESConstants.MAIN_TASK_STEP_VIEW)) {
			viewMain();
			return;
		}
    }

    private void doGoCampaign() throws Exception
    {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_main");
        dataRequest.setProperty("uid", Integer.toString(uid) );
        DataAccessInt dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = dai.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Company_Name");

        if (rsc.getRowCount() == 0) {
			throw new Exception ("No company name!");
        }

log.debug("got "+Integer.toString(rsc.getRowCount())+ " rows");

        ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);

String str= TCData.getTCString(rRow, "company_name");
log.debug(str);
setCompanyName(str);

//        setCompanyName( TCData.getTCString(rRow, "company_name") );

        setNextPage(TCESConstants.JSP_ROOT + TCESConstants.MAIN_PAGE);
    }



    private void viewMain() throws Exception
    {
        setNextPage(TCESConstants.JSP_ROOT + TCESConstants.MAIN_PAGE);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());
    }

}


