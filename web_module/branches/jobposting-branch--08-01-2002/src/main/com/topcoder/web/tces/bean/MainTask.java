package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.common.TCData;
import com.topcoder.web.tces.common.TCESConstants;

import javax.servlet.http.*;
import java.io.Serializable;
import java.util.*;

/**
 * Processes the "main" command.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class MainTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(MainTask.class);

    private String companyName;
    private List campaignInfoList;

    private int uid;

    public MainTask() {
        super();
        setNextPage(TCESConstants.MAIN_PAGE);

        uid=-1;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCampaignInfoList( List campaignInfoList ) {
        this.campaignInfoList = campaignInfoList;
    }

    public List getCampaignInfoList( ) {
        return campaignInfoList;
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        HttpSession session = request.getSession(true);

        Integer userId = (Integer)session.getAttribute("user_id");
        if (userId == null || (userId.intValue()<0) ) {
            log.debug("User not authenticated for access to ES main page.");
            throw new Exception("User not authenticated for access to ES main page.");
        }

        uid = userId.intValue();
    }

    public void processStep(String step)
        throws Exception
    {
        viewMain();
    }

    private void viewMain() throws Exception
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

        ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);

        setCompanyName( TCData.getTCString(rRow, "company_name") );

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_List");

        ArrayList campaignInfoList = new ArrayList();
        for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
            HashMap campaignInfo = new HashMap();
            rRow = rsc.getRow(rowI);
            campaignInfo.put("campaign_name", TCData.getTCString(rRow, "campaign_name") );
            campaignInfo.put("start_date", TCData.getTCDate(rRow, "start_date") );
            campaignInfo.put("end_date", TCData.getTCDate(rRow, "end_date") );
            campaignInfo.put("status_desc", TCData.getTCString(rRow, "status_desc") );
            campaignInfo.put("campaign_id", Long.toString(TCData.getTCLong(rRow, "campaign_id")) );

            campaignInfoList.add(campaignInfo);
        }


        setCampaignInfoList( campaignInfoList );

        setNextPage( TCESConstants.MAIN_PAGE );
    }

    public void setAttributes(String paramName, String paramValues[]) {
    }

}


