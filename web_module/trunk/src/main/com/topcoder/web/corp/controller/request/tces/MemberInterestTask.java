/*
 * MemberInterestTask.java
 *
 * Created on August 27, 2002, 7:53 PM
 */

package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.common.TCESConstants;
import com.topcoder.web.corp.controller.request.tces.BaseTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** Processes the member interest task.
 * @author George Dean
 */
public class MemberInterestTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(MemberInterestTask.class);

    //private long uid;  // moved to BaseTask
    private int cid;
    private int jid;
    private int mid;

    /** Holds value of property handle. */
    private String handle;

    /** Holds value of property companyName. */
    private String companyName;

    /** Holds value of property campaignName. */
    private String campaignName;

    /** Holds value of property memberHitList. */
    private List hitList;

    private boolean isRanked;

    /** Creates new MemberInterestTask */
    public MemberInterestTask() {
        super();
        setNextPage(TCESConstants.MEMBER_INTEREST_PAGE);

        uid = -1;
    }

    /** Performs pre-processing for the task.
     * @param request The servlet request object.
     * @param response The servlet response object.
     * @throws java.lang.Exception
     */
//    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
//        throws Exception
//    {
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
        a.add(new TrailItem(request.getContextPath() + request.getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_DETAIL_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.CAMPAIGN_DETAIL_NAME));
        a.add(new TrailItem(request.getContextPath() + request.getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_INTEREST_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.CAMPAIGN_INTEREST_NAME));
        a.add(new TrailItem(request.getContextPath() + request.getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.POSITION_INTEREST_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID() + "&" +
                TCESConstants.JOB_ID_PARAM + "=" + getJobID(), TCESConstants.POSITION_INTEREST_NAME));
        a.add(new TrailItem(request.getContextPath() + request.getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.MEMBER_PROFILE_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID() + "&" +
                TCESConstants.JOB_ID_PARAM + "=" + getJobID() + "&" + TCESConstants.MEMBER_ID_PARAM +
                "=" + getMemberID(), TCESConstants.MEMBER_PROFILE_NAME));
        setTrail(a);
    }

    /** Processes the given step or phase of the task.
     * @param step The step to be processed.
     * @throws java.lang.Exception
     */
    public void processStep(String step) throws Exception {
        viewMemberInterest();
    }

    private void viewMemberInterest() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_member_interest");

        dataRequest.setProperty("uid", Long.toString(uid));
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()));
        dataRequest.setProperty("jid", Integer.toString(getJobID()));
        dataRequest.setProperty("mid", Integer.toString(getMemberID()));

        Map resultMap = getDataAccess(getOltp()).getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Member_Handle");
        if (rsc.getRowCount() == 0) {
            throw new Exception("No member handle!");
        }
        ResultSetContainer.ResultSetRow handleRow = rsc.getRow(0);
        setHandle(handleRow.getItem("handle").toString());

        rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Member_Access");
        if (rsc.getRowCount() == 0 && !super.getSessionInfo().isAdmin()) {
            throw new Exception("mid=" + Integer.toString(getMemberID()) +
                    " jid=" + Integer.toString(getJobID()) +
                    " cid=" + Integer.toString(getCampaignID()) +
                    " does not belong to uid=" + Long.toString(uid));
        }

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

        rsc = (ResultSetContainer) resultMap.get("TCES_Member_Hit_List");
        setHitList(rsc);


        Request dwDataRequest = new Request();
        dwDataRequest.setContentHandle("TCES_Coder_Stats");
        dwDataRequest.setProperty("mid", Integer.toString(getMemberID()));

        Map dwResultMap = getDataAccess(getDw()).getData(dwDataRequest);
        ResultSetContainer dwResult = (ResultSetContainer)dwResultMap.get("TCES_Coder_Stats");
        setRanked(!dwResult.isEmpty());


        setNextPage(TCESConstants.MEMBER_INTEREST_PAGE);
    }

    /** Sets attributes for the task.
     * @param paramName The name of the attribute being set.
     * @param paramValues The values to be associated with the given attribute.
     */
    public void setAttributes(String paramName, String[] paramValues) {
        String value = paramValues[0];
        value = (value == null ? "" : value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.JOB_ID_PARAM))
            setJobID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.MEMBER_ID_PARAM))
            setMemberID(Integer.parseInt(value));
    }

    /** Getter for property campaignID.
     * @return Value of property campaignID.
     */
    public int getCampaignID() {
        return cid;
    }

    /** Setter for property campaignID.
     * @param campaignID New value of property campaignID.
     */
    public void setCampaignID(int campaignID) {
        cid = campaignID;
    }

    /** Getter for property jobID.
     * @return Value of property jobID.
     */
    public int getJobID() {
        return jid;
    }

    /** Setter for property jobID.
     * @param jobID New value of property jobID.
     */
    public void setJobID(int jobID) {
        jid = jobID;
    }

    /** Getter for property memberID.
     * @return Value of property memberID.
     */
    public int getMemberID() {
        return mid;
    }

    /** Setter for property memberID.
     * @param memberID New value of property memberID.
     */
    public void setMemberID(int memberID) {
        mid = memberID;
    }

    /** Getter for property handle.
     * @return Value of property handle.
     */
    public String getHandle() {
        return this.handle;
    }

    /** Setter for property handle.
     * @param handle New value of property handle.
     */
    public void setHandle(String handle) {
        this.handle = handle;
    }

    /** Getter for property companyName.
     * @return Value of property companyName.
     */
    public String getCompanyName() {
        return this.companyName;
    }

    /** Setter for property companyName.
     * @param companyName New value of property companyName.
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    /** Getter for property campaignName.
     * @return Value of property campaignName.
     */
    public String getCampaignName() {
        return this.campaignName;
    }

    /** Setter for property campaignName.
     * @param campaignName New value of property campaignName.
     */
    public void setCampaignName(String campaignName) {
        this.campaignName = campaignName;
    }

    /** Getter for property hitList.
     * @return Value of property hitList.
     */
    public List getHitList() {
        return this.hitList;
    }

    /** Setter for property hitList.
     * @param hitList New value of property hitList.
     */
    public void setHitList(List hitList) {
        this.hitList = hitList;
    }

    public boolean isRanked() {
        return isRanked;
    }

    public void setRanked(boolean ranked) {
        isRanked = ranked;
    }

}
