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
 * Processes the position interest task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class PositionInterestTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(PositionInterestTask.class);

    private int campaignID;
    private String companyName;
    private String campaignName;
    private String positionName;
    private String campaignStatus;
    private ArrayList hitList;

    private int uid;
    private int jid;

    public PositionInterestTask() {
        super();
        setNextPage(TCESConstants.POSITION_INTEREST_PAGE);

        uid=-1;
    }

    public void setCampaignName( String campaignName ) {
log.debug("Setting CampaignName = "+campaignName);
        this.campaignName = campaignName;
    }

    public String getCampaignName() {
        return campaignName;
    }

    public void setCampaignStatus( String campaignStatus ) {
log.debug("Setting CampaignStatus = "+campaignStatus);
        this.campaignStatus = campaignStatus;
    }

    public String getCampaignStatus() {
        return campaignStatus;
    }

    public void setPositionName( String positionName ) {
        this.positionName = positionName;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setHitList( ArrayList hitList ) {
        this.hitList=hitList;
    }

    public List getHitList() {
        return hitList;
    }

    public int getCampaignID() {
log.debug("Setting CampaignID = "+Integer.toString(campaignID));
        return campaignID;
    }

    public void setCampaignID(int campaignID) {
        this.campaignID = campaignID;
    }

    public int getJobID() {
        return jid;
    }

    public void setJobID(int jid) {
        this.jid=jid;
    }

    public String getCompanyName() {
log.debug("Setting Companyname = "+companyName);
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
        viewPositionInterest();
    }

    private void viewPositionInterest() throws Exception
    {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_position_interest");

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

        rsc = (ResultSetContainer) resultMap.get("TCES_Position_Name");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("No company name!");
        }
        ResultSetContainer.ResultSetRow posNameRow = rsc.getRow(0);
        setPositionName( TCData.getTCString(posNameRow, "job_desc") );

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Info");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("Bad campaign ID or campaign does not belong to user.");
        }
        ResultSetContainer.ResultSetRow cpgnInfRow = rsc.getRow(0);
        setCampaignName( TCData.getTCString(cpgnInfRow, "campaign_name") );
        setCampaignStatus( TCData.getTCString(cpgnInfRow, "status_desc") );

        rsc = (ResultSetContainer) resultMap.get("TCES_Position_Hit_List");
        ArrayList hitList = new ArrayList();
        ResultSetContainer.ResultSetRow hitListRow = null;
        for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
            hitListRow = rsc.getRow(rowI);
            HashMap hit = new HashMap();

            hit.put("coder_id", Long.toString(TCData.getTCLong(hitListRow, "coder_id")) );
            hit.put("handle", TCData.getTCString(hitListRow, "handle") );
            hit.put("rating", Integer.toString(TCData.getTCInt(hitListRow, "rating")) );
            hit.put("state", TCData.getTCString(hitListRow, "state_code") );
            hit.put("country", TCData.getTCString(hitListRow, "country_code") );
            hit.put("type", TCData.getTCString(hitListRow, "coder_type_desc") );
            hit.put("school", TCData.getTCString(hitListRow, "school_name") );
            hit.put("hit_date", TCData.getTCDate(hitListRow, "timestamp") );

            hitList.add(hit);
        }
        setHitList( hitList );

        setNextPage( TCESConstants.POSITION_INTEREST_PAGE );
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.POSITION_ID_PARAM))
            setJobID(Integer.parseInt(value));
    }

}


