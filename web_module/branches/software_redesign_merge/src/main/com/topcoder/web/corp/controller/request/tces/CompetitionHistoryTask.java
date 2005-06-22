/*
 * CompetitionHistoryTask.java
 *
 * Created on August 25, 2002, 11:01 PM
 */

package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.security.NotAuthorizedException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.corp.common.TCESConstants;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.Contact;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Processes the competition history task.
 * @author George Dean
 */
public class CompetitionHistoryTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(CompetitionHistoryTask.class);

    //private long uid; // moved to BaseTask
    private int cid;
    private int jid;
    private int mid;
    private long companyId;

    /** Holds value of property competitionList. */
    private List competitionList;

    /** Holds value of property handle. */
    private String handle;

    private ResultSetContainer memberInfo;
    private String jobName;
    private boolean hasResume;
    private boolean restricted;

    /** Creates new CompetitionHistoryTask */
    public CompetitionHistoryTask() {
        super();
        setNextPage(TCESConstants.COMPETITION_HISTORY_PAGE);

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
        viewCompetitionHistory();
        ResumeServices rServices = null;
        try {
            rServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            setHasResume(rServices.hasResume(mid, getOltp()));
            Contact contact = (Contact) BaseProcessor.createEJB(getInitialContext(), Contact.class);
            setCompanyId(contact.getCompanyId(uid, getOltp()));
        } catch (Exception e) {
            log.error("could not determine if user has a resume or not");
            e.printStackTrace();
        }
    }

    private void viewCompetitionHistory() throws Exception {
        restricted = isRestrictedCampaign(getCampaignID());

        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_competition_history");

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
            throw new NotAuthorizedException("mid=" + Integer.toString(getMemberID()) +
                    " jid=" + Integer.toString(getJobID()) +
                    " cid=" + Integer.toString(getCampaignID()) +
                    " does not belong to uid=" + Long.toString(uid));
        }

        setMemberInfo((ResultSetContainer) resultMap.get("TCES_Member_Profile"));
        setJobName(((ResultSetContainer) resultMap.get("TCES_Position_Name")).
                getItem(0, "job_desc").toString());


        Request dwRequest = new Request();
        if (restricted) {
            dwRequest.setContentHandle("restricted_tces_competition_history");
            dwRequest.setProperty("mid", Integer.toString(getMemberID()));
            dwRequest.setProperty("rds", getRoundList(getCampaignID()));
            resultMap = getDataAccess(getDw()).getData(dwRequest);
            rsc = (ResultSetContainer) resultMap.get("restricted_TCES_Competition_History");
        } else {
            dwRequest.setContentHandle("tces_competition_history");
            dwRequest.setProperty("mid", Integer.toString(getMemberID()));
            resultMap = getDataAccess(getDw()).getData(dwRequest);
            rsc = (ResultSetContainer) resultMap.get("TCES_Competition_History");
        }

        ArrayList compList = new ArrayList();
        ResultSetContainer.ResultSetRow compListRow = null;
        for (int rowI = 0; rowI < rsc.getRowCount(); rowI++) {
            compListRow = rsc.getRow(rowI);
            HashMap comp = new HashMap();

            comp.put("round_id",
                    (compListRow.getItem("round_id").getResultData()).toString());
            comp.put("date",
                    getDate(compListRow, "date"));
            comp.put("contest_name",
                    compListRow.getItem("name").toString());
            comp.put("division_name",
                    compListRow.getItem("division_desc").toString());
            comp.put("final_points",
                    compListRow.getItem("final_points").toString());
            comp.put("avg_points",
                    compListRow.getItem("average_points").toString());
            comp.put("old_rating",
                    compListRow.getItem("old_rating").toString());
            comp.put("new_rating",
                    compListRow.getItem("new_rating").toString());

            compList.add(comp);
        }

        setCompetitionList(compList);


        setNextPage(TCESConstants.COMPETITION_HISTORY_PAGE);
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

    /** Getter for property competitionList.
     * @return Value of property competitionList.
     */
    public List getCompetitionList() {
        return this.competitionList;
    }

    /** Setter for property competitionList.
     * @param competitionList New value of property competitionList.
     */
    public void setCompetitionList(List competitionList) {
        this.competitionList = competitionList;
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

    public ResultSetContainer getMemberInfo() {
        return memberInfo;
    }

    public void setMemberInfo(ResultSetContainer memberInfo) {
        this.memberInfo = memberInfo;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public boolean hasResume() {
        return hasResume;
    }

    public void setHasResume(boolean hasResume) {
        this.hasResume = hasResume;
    }

    public long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(long companyId) {
        this.companyId = companyId;
    }

    public boolean isRestrictedCampaign() {
        return restricted;
    }

}
