/*
 * CoderDemographicsTask.java
 *
 * Created on August 26, 2002, 12:50 AM
 */

package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.corp.common.TCESConstants;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.Contact;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author George Dean
 */
public class CoderDemographicsTask extends BaseTask {

    private static Logger log = Logger.getLogger(CoderDemographicsTask.class);

    //private long uid; //movede to BaseTask
    private long cid;
    private long jid;
    private long mid;
    private long companyId;

    /**
     * Holds value of property questionList.
     */
    private List questionList;

    /**
     * Holds value of property handle.
     */
    private String handle;

    /* Indicates whether the coder is ranked in competition */
    private boolean isRanked;

    private ResultSetContainer memberInfo;
    private String jobName;
    private boolean hasResume;
    private boolean restricted;


    protected void businessProcessing() throws Exception {
        setCampaignID(Long.parseLong(getRequest().getParameter(TCESConstants.CAMPAIGN_ID_PARAM)));
        setJobID(Long.parseLong(getRequest().getParameter(TCESConstants.JOB_ID_PARAM)));
        setMemberID(Long.parseLong(getRequest().getParameter(TCESConstants.MEMBER_ID_PARAM)));


        viewCoderDemographics();
        ResumeServices rServices = null;
        try {
            rServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            setHasResume(rServices.hasResume(mid, getOltp()));
        } catch (Exception e) {
            log.error("could not determine if user has a resume or not");
            e.printStackTrace();
        }
        ArrayList a = new ArrayList();
        a.add(new TrailItem(getSessionInfo().getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.MAIN_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.MAIN_NAME));
        a.add(new TrailItem(getSessionInfo().getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_DETAIL_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.CAMPAIGN_DETAIL_NAME));
        a.add(new TrailItem(getSessionInfo().getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_INTEREST_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.CAMPAIGN_INTEREST_NAME));
        a.add(new TrailItem(getSessionInfo().getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.POSITION_INTEREST_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID() + "&" +
                TCESConstants.JOB_ID_PARAM + "=" + getJobID(), TCESConstants.POSITION_INTEREST_NAME));
        a.add(new TrailItem(getSessionInfo().getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.MEMBER_PROFILE_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID() + "&" +
                TCESConstants.JOB_ID_PARAM + "=" + getJobID() + "&" + TCESConstants.MEMBER_ID_PARAM +
                "=" + getMemberID(), TCESConstants.MEMBER_PROFILE_NAME));
        setTrail(a);
        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf('.') + 1), this);


    }

    public void viewCoderDemographics() throws Exception {

        restricted = isRestrictedCampaign(getCampaignID());

        /* we're just running this one so we can figure out if this member
         * is ranked or not.  could be done more efficiently...obviously TODO
         */
        Request dwDataRequest = new Request();
        dwDataRequest.setContentHandle("tces_member_profile");
        dwDataRequest.setProperty("mid", String.valueOf(getMemberID()));
        Map dwResultMap = getDataAccess(getDw()).getData(dwDataRequest);
        ResultSetContainer dwRSC = null;
        dwRSC = (ResultSetContainer) dwResultMap.get("TCES_Coder_Stats");
        if (dwRSC.getRowCount() > 0) {
            setIsRanked(true);
        } else {
            setIsRanked(false);
        }


        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_member_demographics");

        dataRequest.setProperty("uid", String.valueOf(getUser().getId()));
        dataRequest.setProperty("cid", String.valueOf(getCampaignID()));
        dataRequest.setProperty("jid", String.valueOf(getJobID()));
        dataRequest.setProperty("mid", String.valueOf(getMemberID()));

        Map resultMap = getDataAccess(getOltp()).getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Member_Handle");
        if (rsc.getRowCount() == 0) {
            throw new Exception("No member handle!");
        }
        ResultSetContainer.ResultSetRow handleRow = rsc.getRow(0);
        setHandle(handleRow.getItem("handle").toString());

        rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Member_Access");
        if (rsc.getRowCount() == 0 && !super.getSessionInfo().isAdmin()) {
            throw new Exception("mid=" + String.valueOf(getMemberID()) +
                    " jid=" + String.valueOf(getJobID()) +
                    " cid=" + String.valueOf(getCampaignID()) +
                    " does not belong to uid=" + String.valueOf(getUser().getId()));
        }

        rsc = (ResultSetContainer) resultMap.get("TCES_Member_Demographics");
        ArrayList qrList = new ArrayList();
        ResultSetContainer.ResultSetRow qrListRow = null;
        for (int rowI = 0; rowI < rsc.getRowCount(); rowI++) {
            qrListRow = rsc.getRow(rowI);
            HashMap qr = new HashMap();

            qr.put("question",
                    qrListRow.getItem("demographic_question_text").toString());
            qr.put("response",
                    qrListRow.getItem("demographic_answer_text").toString());

            qrList.add(qr);
        }

        setQuestionList(qrList);

        setMemberInfo((ResultSetContainer) resultMap.get("TCES_Member_Profile"));
        setJobName(((ResultSetContainer) resultMap.get("TCES_Position_Name")).
                getItem(0, "job_desc").toString());

        try {
            Contact contact = (Contact) BaseProcessor.createEJB(getInitialContext(), Contact.class);
            setCompanyId(contact.getCompanyId(getUser().getId(), getOltp()));
        } catch (Exception e) {
            log.error("could not determine if user has a resume or not");
            e.printStackTrace();
        }


        setNextPage(TCESConstants.CODER_DEMOGRAPHICS_PAGE);
        setIsNextPageInContext(true);

    }

    public long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(long companyId) {
        this.companyId = companyId;
    }


    /**
     * Getter for property campaignID.
     *
     * @return Value of property campaignID.
     */
    public long getCampaignID() {
        return cid;
    }

    /**
     * Setter for property campaignID.
     *
     * @param campaignID New value of property campaignID.
     */
    public void setCampaignID(long campaignID) {
        cid = campaignID;
    }

    /**
     * Getter for property jobID.
     *
     * @return Value of property jobID.
     */
    public long getJobID() {
        return jid;
    }

    /**
     * Setter for property jobID.
     *
     * @param jobID New value of property jobID.
     */
    public void setJobID(long jobID) {
        jid = jobID;
    }

    /**
     * Getter for property memberID.
     *
     * @return Value of property memberID.
     */
    public long getMemberID() {
        return mid;
    }

    /**
     * Setter for property memberID.
     *
     * @param memberID New value of property memberID.
     */
    public void setMemberID(long memberID) {
        mid = memberID;
    }

    /**
     * Getter for property questionList.
     *
     * @return Value of property questionList.
     */
    public List getQuestionList() {
        return this.questionList;
    }

    /**
     * Setter for property questionList.
     *
     * @param questionList New value of property questionList.
     */
    public void setQuestionList(List questionList) {
        this.questionList = questionList;
    }

    /**
     * Getter for property handle.
     *
     * @return Value of property handle.
     */
    public String getHandle() {
        return this.handle;
    }

    /**
     * Setter for property handle.
     *
     * @param handle New value of property handle.
     */
    public void setHandle(String handle) {
        this.handle = handle;
    }

    /**
     * Getter for property isRanked.
     *
     * @return Value of property isRanked
     */
    public boolean getIsRanked() {
        return isRanked;
    }

    /**
     * Setter for property isRanked.
     *
     * @param isRanked New value of property isRanked.
     */
    public void setIsRanked(boolean isRanked) {
        this.isRanked = isRanked;
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

    public boolean isRestrictedCampaign() {
        return restricted;
    }
}

