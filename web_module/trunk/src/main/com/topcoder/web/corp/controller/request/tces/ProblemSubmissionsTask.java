/*
 * ProblemSubmissionsTask.java
 *
 * Created on August 25, 2002, 3:12 PM
 */

package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.Contact;
import com.topcoder.web.corp.common.TCESConstants;
import com.topcoder.web.corp.controller.request.tces.BaseTask;
import com.topcoder.security.NotAuthorizedException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** Processes the problem submissions task.
 * @author George Dean
 */
public class ProblemSubmissionsTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(ProblemSubmissionsTask.class);

    //private long uid; //moved to BaseTask
    private int cid;
    private int jid;
    private int mid;
    private long companyId;
    private long roundId;

    /** Holds value of property handle. */
    private String handle;

    /** Holds value of property submissionList. */
    private List submissionList;

    private ResultSetContainer memberInfo;
    private String jobName;
    private boolean hasResume;
    private boolean restricted;

    /** Creates new ProblemSubmissionsTask */
    public ProblemSubmissionsTask() {
        super();
        setNextPage(TCESConstants.PROBLEM_SUBMISSIONS_PAGE);

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
        viewProblemSubmissions();
        ResumeServices rServices = null;
        try {
            rServices = (ResumeServices)BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            setHasResume(rServices.hasResume(mid, getOltp()));
            Contact contact = (Contact)BaseProcessor.createEJB(getInitialContext(), Contact.class);
            setCompanyId(contact.getCompanyId(uid, getOltp()));
        } catch (Exception e) {
            log.error("could not determine if user has a resume or not");
            e.printStackTrace();
        }
    }

    private void viewProblemSubmissions() throws Exception {
        restricted = isRestrictedCampaign(getCampaignID());
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_problem_submissions");

        dataRequest.setProperty("uid", Long.toString(uid));
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()));
        dataRequest.setProperty("jid", Integer.toString(getJobID()));
        dataRequest.setProperty("mid", Integer.toString(getMemberID()));
        dataRequest.setProperty("rd", String.valueOf(getRoundId()));

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

        if (isRestrictedCampaign(getCampaignID())) {
            if (!getRoundIds(getCampaignID()).contains(new Long(getRoundId()))) {
                throw new NotAuthorizedException(" cid=" + Integer.toString(getCampaignID()) +
                        " rd=" + getRoundId() +
                        " does not belong to uid=" + Long.toString(uid));
            }
        }


        setMemberInfo((ResultSetContainer) resultMap.get("TCES_Member_Profile"));
        setJobName(((ResultSetContainer) resultMap.get("TCES_Position_Name")).
                getItem(0, "job_desc").toString());

        Request dwRequest = new Request();
        if (restricted) {
            dwRequest.setContentHandle("restricted_tces_problem_submissions");
            dwRequest.setProperty("mid", Integer.toString(getMemberID()));
            dwRequest.setProperty("rds", getRoundList(getCampaignID()));
            resultMap = getDataAccess(getDw()).getData(dwRequest);
            rsc = (ResultSetContainer) resultMap.get("restricted_TCES_Problem_Submissions");
        } else {
            dwRequest.setContentHandle("tces_problem_submissions");
            dwRequest.setProperty("uid", Long.toString(uid));
            dwRequest.setProperty("cid", Integer.toString(getCampaignID()));
            dwRequest.setProperty("jid", Integer.toString(getJobID()));
            dwRequest.setProperty("mid", Integer.toString(getMemberID()));
            resultMap = getDataAccess(getDw()).getData(dwRequest);
            rsc = (ResultSetContainer) resultMap.get("TCES_Problem_Submissions");
        }
        setSubmissionList(rsc);

        setNextPage(TCESConstants.PROBLEM_SUBMISSIONS_PAGE);
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
        if (paramName.equalsIgnoreCase(TCESConstants.ROUND_ID_PARAM))
            setRoundId(Long.parseLong(value));
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

    /** Getter for property submissionList.
     * @return Value of property submissionList.
     */
    public List getSubmissionList() {
        return this.submissionList;
    }

    /** Setter for property submissionList.
     * @param submissionList New value of property submissionList.
     */
    public void setSubmissionList(List submissionList) {
        this.submissionList = submissionList;
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

    public long getRoundId() {
        return roundId;
    }

    public void setRoundId(long roundId) {
        this.roundId = roundId;
    }

}
