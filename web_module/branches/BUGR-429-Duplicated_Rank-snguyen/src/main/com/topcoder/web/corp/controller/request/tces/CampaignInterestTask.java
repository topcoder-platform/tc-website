package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.corp.common.TCESConstants;
import com.topcoder.web.ejb.user.Contact;

import java.util.ArrayList;
import java.util.Map;

/**
 * Processes the campaign interest task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class CampaignInterestTask extends BaseTask {

    private static Logger log = Logger.getLogger(CampaignInterestTask.class);

    /* Holds the ID of this campaign */
    private long campaignID;

    /* Holds the name of the company to which this campaign belongs */
    private String companyName;

    /* Holds the name of this campaign */
    private String campaignName;

    /* Holds the status of this campaign */
    private String campaignStatus;

    /* Holds a list of mappings representing hits on this campaign */
    private ResultSetContainer hitList;

    /* Holds the ID of the currently logged-in user */
    // private long uid;  // moved to BaseTask

    /* Holds the field that the hit list should be sorted by */
    private String sortBy;

    /* Holds the order that the hit list should be sorted in */
    private String sortOrder;

    /* Holds the field that the hit list should be sorted by after sortBy */
    private String backSortBy;

    /* Holds the secondary order that the hit list should be sorted in */
    private String backSortOrder;

    private long companyId;

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

    /** Getter for property campaignID
     * @return Value of property campaignID
     */
    public long getCampaignID() {
        return campaignID;
    }

    /** Setter for property campaignID.
     * @param campaignID New value of property campaignID.
     */
    public void setCampaignID(long campaignID) {
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

    public long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(long companyId) {
        this.companyId = companyId;
    }

    protected void businessProcessing() throws Exception {

            sortBy = getRequest().getParameter(TCESConstants.SORT_PARAM);
            sortOrder = getRequest().getParameter(TCESConstants.SORT_ORDER_PARAM);
            backSortBy = getRequest().getParameter(TCESConstants.BACK_SORT_PARAM);
            backSortOrder = getRequest().getParameter(TCESConstants.BACK_SORT_ORDER_PARAM);

            setCampaignID(Long.parseLong(getRequest().getParameter(TCESConstants.CAMPAIGN_ID_PARAM)));

        viewCampaignInterest();
        Contact contact = (Contact) BaseProcessor.createEJB(getInitialContext(), Contact.class);
        setCompanyId(contact.getCompanyId(getUser().getId(), getOltp()));

        ArrayList a = new ArrayList();
        a.add(new TrailItem(getSessionInfo().getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.MAIN_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.MAIN_NAME));
        a.add(new TrailItem(getSessionInfo().getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_DETAIL_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.CAMPAIGN_DETAIL_NAME));
        setTrail(a);
        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf('.')+1), this);


    }


    private void viewCampaignInterest() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_campaign_interest");

        dataRequest.setProperty("uid", String.valueOf(getUser().getId()));
        dataRequest.setProperty("cid", String.valueOf(getCampaignID()));
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

        rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Campaign_Access");
        if (rsc.getRowCount() == 0 && !super.getSessionInfo().isAdmin()) {
            throw new Exception(" cid=" + String.valueOf(getCampaignID()) +
                    "does not belong to uid=" + String.valueOf(getUser().getId()));
        }

        setHitList((ResultSetContainer) resultMap.get("TCES_Campaign_Hit_List"));

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


        setNextPage(TCESConstants.CAMPAIGN_INTEREST_PAGE);
        setIsNextPageInContext(true);

    }

}


