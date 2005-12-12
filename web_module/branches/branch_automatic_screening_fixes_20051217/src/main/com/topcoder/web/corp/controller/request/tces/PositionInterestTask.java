package com.topcoder.web.corp.controller.request.tces;


import com.topcoder.security.NotAuthorizedException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.common.TCESConstants;
import com.topcoder.web.ejb.user.Contact;
import com.topcoder.web.common.BaseProcessor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;

/**
 * Processes the position interest task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class PositionInterestTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(PositionInterestTask.class);

    /* Holds the ID of the campaign to which this position belongs */
    private int campaignID;

    /* Holds the name of the company to which this position belongs */
    private String companyName;

    /* Holds the name of the campaign to which this position belongs */
    private String campaignName;

    /* Holds the name of this position */
    private String positionName;

    /* Holds the status of the campaign to which this position belongs */
    private String campaignStatus;

    /* Holds a list of mappings representing hits on this position */
    private ResultSetContainer hitList;

    /* Holds the id of the user currently logged in */
    //private long uid; // moved to BaseTask

    /* Holds the id of this position */
    private int jid;

    /* Holds the field that the hit list should be sorted by */
    private String sortBy;

    /* Holds the order that the hit list should be sorted in */
    private String sortOrder;

    /* Holds the field that the hit list should be sorted by after sortBy */
    private String backSortBy;

    /* Holds the secondary order that the hit list should be sorted in */
    private String backSortOrder;

    private long companyId;

    /* Creates new PositionInterestTask */
    public PositionInterestTask() {
        super();
        setNextPage(TCESConstants.POSITION_INTEREST_PAGE);

        uid = -1;
        sortBy = "";
        sortOrder = "";
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

    /** Setter for property positionName.
     * @param positionName New value of property positionName.
     */
    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    /** Getter for property positionName
     * @return Value of property positionName
     */
    public String getPositionName() {
        return positionName;
    }

    /** Setter for property hitList.
     * @param hitList New value of property hitList.
     */
    public void setHitList(ResultSetContainer hitList) {
        this.hitList = hitList;
    }

    /** Getter for property hitList
     * @return Value of property hitList
     */
    public ResultSetContainer getHitList() {
        return hitList;
    }

    /** Setter for property campaignID.
     * @param campaignID New value of property campaignID.
     */
    public void setCampaignID(int campaignID) {
        this.campaignID = campaignID;
    }

    /** Getter for property campaignID
     * @return Value of property campaignID
     */
    public int getCampaignID() {
        return campaignID;
    }

    /** Setter for property jobID.
     * @param jid New value of property jobID.
     */
    public void setJobID(int jid) {
        this.jid = jid;
    }

    /** Getter for property jobID
     * @return Value of property jobID
     */
    public int getJobID() {
        return jid;
    }

    /** Setter for property companyName.
     * @param companyName New value of property companyName.
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    /** Getter for property companyName
     * @return Value of property companyName
     */
    public String getCompanyName() {
        return companyName;
    }

    public long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(long companyId) {
        this.companyId = companyId;
    }


//    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
//        throws Exception
//    {
//
//        User curUser = getAuthenticityToken().getActiveUser();
//        uid = curUser.getId();
//
//    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ArrayList a = new ArrayList();
        a.add(new TrailItem(request.getContextPath() + request.getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.MAIN_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.MAIN_NAME));
        a.add(new TrailItem(request.getContextPath() + request.getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_DETAIL_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.CAMPAIGN_DETAIL_NAME));
        a.add(new TrailItem(request.getContextPath() + request.getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_INTEREST_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.CAMPAIGN_INTEREST_NAME));
        setTrail(a);

    }

    public void processStep(String step)
            throws Exception {
        viewPositionInterest();
        Contact contact = (Contact) BaseProcessor.createEJB(getInitialContext(), Contact.class);
        setCompanyId(contact.getCompanyId(uid, getOltp()));

    }

    private void viewPositionInterest() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_position_interest");

        dataRequest.setProperty("uid", Long.toString(uid));
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()));
        dataRequest.setProperty("jid", Integer.toString(getJobID()));
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

        rsc = (ResultSetContainer) resultMap.get("TCES_Position_Name");
        if (rsc.getRowCount() == 0) {
            throw new Exception("No position name!");
        }
        ResultSetContainer.ResultSetRow posNameRow = rsc.getRow(0);
        setPositionName(posNameRow.getItem("job_desc").toString());

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Info");
        if (rsc.getRowCount() == 0) {
            throw new NotAuthorizedException("Bad campaign ID or campaign does not belong to user.");
        }
        ResultSetContainer.ResultSetRow cpgnInfRow = rsc.getRow(0);
        setCampaignName(cpgnInfRow.getItem("campaign_name").toString());

        rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Job_Access");
        if (rsc.getRowCount() == 0 && !super.getSessionInfo().isAdmin()) {
            throw new NotAuthorizedException("jid=" + Integer.toString(getJobID()) +
                    " cid=" + Integer.toString(getCampaignID()) +
                    "does not belong to uid=" + Long.toString(uid));
        }

        setHitList((ResultSetContainer) resultMap.get("TCES_Position_Hit_List"));

        if (sortBy != null && sortBy.length() > 0) {
            if (sortOrder.length() > 0) {
                if (backSortBy != null && backSortBy.length() > 0) {
                    if (backSortOrder.length() > 0) {
                        getHitList().sortByColumn(sortBy, backSortBy,
                                sortOrder.equals(TCESConstants.SORT_ORDER_ASC),
                                backSortOrder.equals(TCESConstants.SORT_ORDER_ASC));
                    } else {
                        getHitList().sortByColumn(sortBy, backSortBy,
                                sortOrder.equals(TCESConstants.SORT_ORDER_ASC),
                                true);
                    }
                } else {
                    getHitList().sortByColumn(sortBy, sortOrder.equals(TCESConstants.SORT_ORDER_ASC));
                }
            } else {
                getHitList().sortByColumn(sortBy, true);
            }
        }

        setNextPage(TCESConstants.POSITION_INTEREST_PAGE);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null ? "" : value.trim());
        log.debug("setAttributes name: " + paramName + " value: " + value);

        if (paramName.equalsIgnoreCase(TCESConstants.SORT_PARAM))
            sortBy = value;
        if (paramName.equalsIgnoreCase(TCESConstants.SORT_ORDER_PARAM))
            sortOrder = value;
        if (paramName.equalsIgnoreCase(TCESConstants.BACK_SORT_PARAM))
            backSortBy = value;
        if (paramName.equalsIgnoreCase(TCESConstants.BACK_SORT_ORDER_PARAM))
            backSortOrder = value;
        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.JOB_ID_PARAM))
            setJobID(Integer.parseInt(value));
    }

}


