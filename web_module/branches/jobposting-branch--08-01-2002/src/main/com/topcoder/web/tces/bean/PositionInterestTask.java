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
            throw new TCESAuthenticationException("User not authenticated for access to ES main page.");
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
        dataRequest.setProperty("jid", Integer.toString(getJobID()) );
        DataAccessInt dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = dai.getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Company_Name");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("No company name!");
        }
        ResultSetContainer.ResultSetRow cmpyNameRow = rsc.getRow(0);
        setCompanyName( cmpyNameRow.getItem("company_name").toString() );

        rsc = (ResultSetContainer) resultMap.get("TCES_Position_Name");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("No position name!");
        }
        ResultSetContainer.ResultSetRow posNameRow = rsc.getRow(0);
        setPositionName( posNameRow.getItem("job_desc").toString() );

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Info");
        if (rsc.getRowCount() == 0) {
            throw new TCESAuthenticationException ("Bad campaign ID or campaign does not belong to user.");
        }
        ResultSetContainer.ResultSetRow cpgnInfRow = rsc.getRow(0);
        setCampaignName( cpgnInfRow.getItem("campaign_name").toString() );
        setCampaignStatus( cpgnInfRow.getItem("status_desc").toString() );

        rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Job_Access");
        if (rsc.getRowCount() == 0) {
            throw new TCESAuthenticationException ("jid="+Integer.toString(getJobID())+
                                 " cid="+Integer.toString(getCampaignID())+
                                 "does not belong to uid="+Integer.toString(uid) );
        }

        rsc = (ResultSetContainer) resultMap.get("TCES_Position_Hit_List");
        ArrayList hitList = new ArrayList();
        ResultSetContainer.ResultSetRow hitListRow = null;
        for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
            hitListRow = rsc.getRow(rowI);
            HashMap hit = new HashMap();

            hit.put("coder_id",
                    ((Long)hitListRow.getItem("coder_id").getResultData()).toString() );
            hit.put("handle",
                    hitListRow.getItem("handle").toString() );
            hit.put("rating",
                    ((Integer)hitListRow.getItem("rating").getResultData()).toString() );
            hit.put("state",
                    hitListRow.getItem("state_code").toString() );
            hit.put("country",
                    hitListRow.getItem("country_code").toString() );
            hit.put("type",
                    hitListRow.getItem("coder_type_desc").toString() );
            hit.put("school",
                    hitListRow.getItem("school_name").toString() );
            hit.put("hit_date",
                    getDate(hitListRow, "timestamp"));

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
        if (paramName.equalsIgnoreCase(TCESConstants.JOB_ID_PARAM))
            setJobID(Integer.parseInt(value));
    }

}


