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
import java.io.*;
import java.util.*;

/**
 * Processes the campaign interest task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class CampaignInterestTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(MainTask.class);

    private int campaignID;
    private String companyName;
    private String campaignName;
    private String campaignStatus;
    private ArrayList hitList;

    private int uid;

    public CampaignInterestTask() {
        super();
        setNextPage(TCESConstants.JSP_ROOT + TCESConstants.CAMPAIGN_INTEREST_PAGE);

        uid=-1;
    }

    public void setCampaignName( String campaignName ) {
        this.campaignName = campaignName;
    }

    public String getCampiagnName() {
        return campaignName;
    }

    public void setCampaignStatus( String campaignStatus ) {
        this.campaignStatus = campaignStatus;
    }

    public String getCampaignStatus() {
        return campaignStatus;
    }

    public void setHitList( ArrayList hitList ) {
        this.hitList=hitList;
    }

    public String getHitList() {
        return hitList;
    }

    public int getCampaignID() {
        return campaignID;
    }

    public void setCampaignID(int campaignID) {
        this.campaignID = campaignID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
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
        viewCampaignInterest();
    }

    private void viewCampaignInterest() throws Exception
    {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_campaign_interest");

        dataRequest.setProperty("uid", Integer.toString(uid) );
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()) );
        DataAccessInt dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = dai.getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Company_Name");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("No company name!");
        }
        ResultSetContainer.ResultSetRow cmpyNameRow = rsc.getRow(0);
        setCompanyName( TCData.getTCString(cmpyNameRow, "company_name") );

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Info");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("Bad campaign ID or campaign does not belong to user.");
        }
        ResultSetContainer.ResultSetRow cpgnInfRow = rsc.getRow(0);
        setCampaignName( TCData.getTCString(cpgnInfRow, "campaign_name") );
        setCampaignStatus( TCData.getTCString(cpgnInfRow, "status_desc") );


        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Hit_List");
        ArrayList hitList = new ArrayList();
        ResultSetContainer.ResultSetRow hitListRow = null;
        for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
            hitListRow = rsc.getRow(rowI);
            HashMap hit = new HashMap();

            hit.put("handle", TCData.getTCString(hitListRow, "handle") );
            hit.put("rating", TCData.getTCString(hitListRow, "rating") );
            hit.put("state", TCData.getTCString(hitListRow, "state_code") );
            hit.put("country", TCData.getTCString(hitListRow, "country_code") );
            hit.put("type", TCData.getTCString(hitListRow, "coder_type_desc") );
            hit.put("school", TCData.getTCString(hitListRow, "school_name") );
            hit.put("position", TCData.getTCString(hitListRow, "job_desc") );
            hit.put("hit_date", TCData.getTCString(hitListRow, "timestamp") );

            hitList.add(hit);
        }
        setHitList( hitList );

        setNextPage( TCESConstants.JSP_ROOT + TCESConstants.CAMPAIGN_DETAIL_PAGE );
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
    }

}


