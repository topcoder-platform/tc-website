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
 * Processes the campaign detail task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class CampaignDetailTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(MainTask.class);

    private int campaignID;
    private String companyName;
    private String campaignName;
    private String campaignStatus;
    private String campaignHits;
    private String mostRecentHit;
    private ArrayList positionList;

    private int uid;

    public CampaignDetailTask() {
        super();
        setNextPage(TCESConstants.JSP_ROOT + TCESConstants.CAMPAIGN_DETAIL_PAGE);

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

    public void setCampaignHits( String campaignHits ) {
        this.campaignHits = campaignHits;
    }

    public String getCampaignHits() {
        return campaignHits;
    }

    public void setMostRecentHit( String mostRecentHit ) {
        this.mostRecentHit = mostRecentHit;
    }

    public String getMostRecentHit( ) {
        return mostRecentHit;
    }

    public void setPositionList( ArrayList positionList ) {
        this.positionList=positionList;
    }

    public List getPositionList() {
        return positionList;
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
        viewCampaignDetail();
    }

    private void viewCampaignDetail() throws Exception
    {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_campaign_detail");

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


        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Hit_Info");
        ResultSetContainer.ResultSetRow cpgnHitsRow = rsc.getRow(0);
        setCampaignHits( TCData.getTCString(cpgnHitsRow, "total_hits") );
        setMostRecentHit( TCData.getTCString(cpgnHitsRow, "most_recent") );

        rsc = (ResultSetContainer) resultMap.get("TCES_Position_List");
        ArrayList positionList = new ArrayList();
        ResultSetContainer.ResultSetRow posListRow = null;
        for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
            posListRow = rsc.getRow(rowI);
            HashMap position = new HashMap();
            position.put("job_desc", TCData.getTCString(posListRow, "job_desc") );
            position.put("hit_count", TCData.getTCString(posListRow, "hit_count") );
            position.put("most_recent",TCData.getTCString(posListRow, "most_recent") );
            position.put("job_id", TCData.getTCString(posListRow, "job_id") );
            positionList.add(position);
        }
        setPositionList( positionList );

        setNextPage( TCESConstants.JSP_ROOT + TCESConstants.CAMPAIGN_DETAIL_PAGE );
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
    }

}


