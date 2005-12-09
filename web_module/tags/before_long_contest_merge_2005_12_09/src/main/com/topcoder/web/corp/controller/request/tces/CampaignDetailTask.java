package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.common.TCESConstants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Processes the campaign detail task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class CampaignDetailTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(CampaignDetailTask.class);

    /* Holds the ID of this campaign */
    private int campaignID;

    /* Holds the name of the company to which this task belongs */
    private String companyName;

    /* Holds the name of this campaign */
    private String campaignName;

    /* Holds the status of this campaign */
    private String campaignStatus;

    /* Holds the number of hits for this campaign */
    private String campaignHits;

    /* Holds the date of the most recent hit */
    private String mostRecentHit;

    /* Holds the a list of mappings representing positions within this campaign */
    private ArrayList positionList;

    /* Holds the ID of the currently logged-in user */
    //private long uid;  // moved to BaseTask

    /* Creates a new CampaignDetailTask */
    public CampaignDetailTask() {
        super();
        setNextPage(TCESConstants.CAMPAIGN_DETAIL_PAGE);

        uid = -1;
    }


    /** Setter for property campaignName.
     * @param campaignName New value of property campaignName.
     */
    public void setCampaignName(String campaignName) {
        this.campaignName = campaignName;
    }

    /** Getter for property campaignName
     * @return Value of property campaignName
     */
    public String getCampaignName() {
        return campaignName;
    }

    /** Setter for property campaignStatus.
     * @param campaignStatus New value of property campaignStatus.
     */
    public void setCampaignStatus(String campaignStatus) {
        this.campaignStatus = campaignStatus;
    }

    /** Getter for property campaignStatus
     * @return Value of property campaignStatus
     */
    public String getCampaignStatus() {
        return campaignStatus;
    }

    /** Setter for property campaignHits.
     * @param campaignHits New value of property campaignHits.
     */
    public void setTotalHits(String campaignHits) {
        this.campaignHits = campaignHits;
    }

    /** Getter for property campaignHits
     * @return Value of property campaignHits
     */
    public String getTotalHits() {
        return campaignHits;
    }

    /** Setter for property mostRecentHit.
     * @param mostRecentHit New value of property mostRecentHit.
     */
    public void setMostRecentHit(String mostRecentHit) {
        this.mostRecentHit = mostRecentHit;
    }

    /** Getter for property mostRecentHit
     * @return Value of property mostRecentHit
     */
    public String getMostRecentHit() {
        return mostRecentHit;
    }

    /** Setter for property positionList.
     * @param positionList New value of property positionList.
     */
    public void setPositionList(ArrayList positionList) {
        this.positionList = positionList;
    }

    /** Getter for property positionList
     * @return Value of property positionList
     */
    public List getPositionList() {
        return positionList;
    }

    /** Getter for property campaignID
     * @return Value of property campaignID
     */
    public int getCampaignID() {
        return campaignID;
    }

    /** Setter for property campaignID.
     * @param campaignID New value of property campaignID.
     */
    public void setCampaignID(int campaignID) {
        this.campaignID = campaignID;
    }

    /** Getter for property companyName
     * @return Value of property companyName
     */
    public String getCompanyName() {
        return companyName;
    }

    /** Setter for property companyName.
     * @param companyName New value of property companyName.
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }



//    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
//        throws Exception {
//
//        User curUser = getAuthenticityToken().getActiveUser();
//        uid = curUser.getId();
//    }


    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ArrayList a = new ArrayList();
        a.add(new TrailItem(request.getContextPath() + request.getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.MAIN_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.MAIN_NAME));
        setTrail(a);

    }

    public void processStep(String step)
            throws Exception {
        viewCampaignDetail();
    }

    private void viewCampaignDetail() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_campaign_detail");

        dataRequest.setProperty("uid", Long.toString(uid));
        log.debug("User id set in CampaignDetailTask= " + uid);
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()));
        Map resultMap = getDataAccess(getOltp()).getData(dataRequest);

        ResultSetContainer rsc = null;
        if (super.getSessionInfo().isAdmin())
            setCompanyName(TCESConstants.ADMIN_COMPANY);
        else {
            rsc = (ResultSetContainer) resultMap.get("TCES_Company_Name");
            if (rsc.getRowCount() == 0) {
                throw new Exception("No company name!");
            }
            ResultSetContainer.ResultSetRow cmpyNameRow = rsc.getRow(0);

            setCompanyName(cmpyNameRow.getItem("company_name").toString());
        }

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Info");
        if (rsc.getRowCount() == 0) {
            throw new Exception("Bad campaign ID or campaign does not belong to user.");
        }
        ResultSetContainer.ResultSetRow cpgnInfRow = rsc.getRow(0);
        setCampaignName(cpgnInfRow.getItem("campaign_name").toString());

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Hit_Info");
        ResultSetContainer.ResultSetRow cpgnHitsRow = rsc.getRow(0);
        Long hits = (Long) cpgnHitsRow.getItem("total_hits").getResultData();
        setTotalHits(hits.toString());
        setMostRecentHit((hits.longValue() == 0) ? "N/A" : getDate(cpgnHitsRow, "most_recent"));

        rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Campaign_Access");
        if (rsc.getRowCount() == 0 && !super.getSessionInfo().isAdmin()) {
            throw new Exception(" cid=" + Integer.toString(getCampaignID()) +
                    "does not belong to uid=" + Long.toString(uid));
        }

        rsc = (ResultSetContainer) resultMap.get("TCES_Position_List");
        ArrayList positionList = new ArrayList();
        ResultSetContainer.ResultSetRow posListRow = null;
        for (int rowI = 0; rowI < rsc.getRowCount(); rowI++) {
            posListRow = rsc.getRow(rowI);

            HashMap position = new HashMap();
            position.put("job_desc",
                    posListRow.getItem("job_desc").toString());
            position.put("hit_count",
                    (posListRow.getItem("hit_count").getResultData()).toString());
            if (((Long) posListRow.getItem("hit_count").getResultData()).longValue() == 0) {
                position.put("most_recent", "N/A");
            } else {
                position.put("most_recent", getDate(posListRow, "most_recent"));
            }
            position.put("job_id",
                    (posListRow.getItem("job_id").getResultData()).toString());

            positionList.add(position);
        }
        setPositionList(positionList);

        setNextPage(TCESConstants.CAMPAIGN_DETAIL_PAGE);

    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null ? "" : value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
    }

}


