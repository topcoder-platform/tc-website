package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.common.TCESConstants;
import com.topcoder.web.tces.common.TCESAuthenticationException;

import javax.servlet.http.*;
import java.io.Serializable;
import java.util.*;

/**
 * Processes the campaign detail task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class CampaignDetailTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(CampaignDetailTask.class);

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
        setNextPage(TCESConstants.CAMPAIGN_DETAIL_PAGE);

        uid=-1;
    }

    public void setCampaignName( String campaignName ) {
        this.campaignName = campaignName;
    }

    public String getCampaignName() {
        return campaignName;
    }

    public void setCampaignStatus( String campaignStatus ) {
        this.campaignStatus = campaignStatus;
    }

    public String getCampaignStatus() {
        return campaignStatus;
    }

    public void setTotalHits( String campaignHits ) {
log.debug("setting total hits = "+campaignHits);
        this.campaignHits = campaignHits;
    }

    public String getTotalHits() {
        return campaignHits;
    }

    public void setMostRecentHit( String mostRecentHit ) {
log.debug("setting most recent hit = "+mostRecentHit);
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

        if (!Authentication.isLoggedIn(session)) {
            log.debug("User not authenticated for access to TCES resource.");
            throw new TCESAuthenticationException("User not authenticated for access to TCES resource.");
        }

        uid = Authentication.userLoggedIn(session);
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
        setCompanyName( cmpyNameRow.getItem("company_name").toString() );

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Info");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("Bad campaign ID or campaign does not belong to user.");
        }
        ResultSetContainer.ResultSetRow cpgnInfRow = rsc.getRow(0);
        setCampaignName( cpgnInfRow.getItem("campaign_name").toString() );

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Hit_Info");
        ResultSetContainer.ResultSetRow cpgnHitsRow = rsc.getRow(0);
        Long hits = (Long)cpgnHitsRow.getItem("total_hits").getResultData();
        setTotalHits( hits.toString() );
        setMostRecentHit( (hits.longValue()==0)?"N/A":getDate(cpgnHitsRow,"most_recent") );

        rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Campaign_Access");
        if (rsc.getRowCount() == 0) {
            throw new Exception (" cid="+Integer.toString(getCampaignID())+
                                 "does not belong to uid="+Integer.toString(uid) );
        }

        rsc = (ResultSetContainer) resultMap.get("TCES_Position_List");
        ArrayList positionList = new ArrayList();
        ResultSetContainer.ResultSetRow posListRow = null;
        for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
            posListRow = rsc.getRow(rowI);

            HashMap position = new HashMap();
            position.put("job_desc",
                         posListRow.getItem("job_desc").toString() );
            position.put("hit_count",
                         ((Long)posListRow.getItem("hit_count").getResultData()).toString() );
            if(((Long)posListRow.getItem("hit_count").getResultData()).longValue()==0){
                position.put("most_recent", "N/A");
            }else{
                position.put("most_recent", getDate( posListRow, "most_recent") );
            }
            position.put("job_id",
                         ((Long)posListRow.getItem("job_id").getResultData()).toString() );

            positionList.add(position);
        }
        setPositionList( positionList );

        setNextPage( TCESConstants.CAMPAIGN_DETAIL_PAGE );
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
    }

}


