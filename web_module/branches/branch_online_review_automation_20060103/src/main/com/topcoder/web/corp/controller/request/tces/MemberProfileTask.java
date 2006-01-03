package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.security.NotAuthorizedException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.corp.common.JSPUtils;
import com.topcoder.web.corp.common.TCESConstants;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.Contact;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Processes the member profile task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class MemberProfileTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(MemberProfileTask.class);

    /* Holds the campaign ID of the member that expressed interest */
    private int campaignID;

    /* Holds the position/job ID in which the member expressed interest */
    private int jobID;

    /* Holds the member ID for which a member profile is being requested */
    private int memberID;

    /* Holds information about the member */
    private ResultSetContainer memberInfo;

    private ResultSetContainer memberStats;

    /* Holds the name of the position/job in which the member expressed interest */
    private String jobName;

    /* Holds the name of the company in whose job the member expressed interest */
    private String companyName;

    /* Indicates whether the coder is a student */
    private boolean isStudent;

    /* Indicates whether the coder is ranked in competition */
    private boolean isRanked;

    private boolean hasResume;

    //private long uid; // moved to BaseTask

    /** Holds data about the coder's Division I performance. */
    private ResultSetContainer.ResultSetRow divIStats;

    /** Holds flag indicating whether coder has participated in Division I. */
    private boolean hasDivisionI;
    private boolean hasMultipleDivILanguage;

    /** Holds flag indicating whether coder has participated in Division II. */
    private boolean hasDivisionII;
    private boolean hasMultipleDivIILanguage;

    /** Holds data about the coder's Division II performance. */
    private ResultSetContainer.ResultSetRow divIIStats;

    /** Holds list of Division I performance stats aggregated by problem level. */
    private List divIStatsByLevel;

    /** Holds list of Division I performance stats aggregated by language. */
    private List divIStatsByLang;

    /** Holds list of Division II performance stats aggregated by problem level. */
    private List divIIStatsByLang;

    /** Holds list of Division I performance stats aggregated by language. */
    private List divIIStatsByLevel;

    private long companyId;

    /** Creates new MemberProfileTask */
    public MemberProfileTask() {
        super();
        setNextPage(TCESConstants.MEMBER_PROFILE_PAGE);

        uid = -1;

        setJobID(-1);
        setCampaignID(-1);
        setHasMultipleDivILanguage(false);
        setHasMultipleDivIILanguage(false);
    }


    /** Getter for property hasResume.
     * @return Value of property hasResum
     */
    public boolean hasResume() {
        return hasResume;
    }

    /** Setter for property hasResume.
     * @param hasResume New value of property hasResume.
     */
    public void setHasResume(boolean hasResume) {
        this.hasResume = hasResume;
    }

    /** Getter for property isRanked.
     * @return Value of property isRanked
     */
    public boolean getIsRanked() {
        return isRanked;
    }

    /** Setter for property isRanked.
     * @param isRanked New value of property isRanked.
     */
    public void setIsRanked(boolean isRanked) {
        this.isRanked = isRanked;
    }

    /** Getter for property companyName.
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

    /** Getter for property isStudent
     * @return Value of property isStudent
     */
    public boolean getIsStudent() {
        return isStudent;
    }

    /** Setter for property isStudent.
     * @param isStudent New value of property isStudent.
     */
    public void setIsStudent(boolean isStudent) {
        this.isStudent = isStudent;
    }

    /** Getter for property campaignID.
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

    /** Getter for property jobID.
     * @return Value of property jobID
     */
    public int getJobID() {
        return jobID;
    }

    /** Setter for property jobID.
     * @param jobID New value of property jobID.
     */
    public void setJobID(int jobID) {
        this.jobID = jobID;
    }

    /** Getter for property memberID.
     * @return Value of property memberID
     */
    public int getMemberID() {
        return memberID;
    }

    /** Setter for property memberID.
     * @param memberID New value of property memberID.
     */
    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    /** Getter for property memberInfo.
     * @return Value of property memberInfo
     */
    public ResultSetContainer getMemberInfo() {
        return memberInfo;
    }

    /** Setter for property memberInfo.
     * @param memberInfo New value of property memberInfo.
     */
    public void setMemberInfo(ResultSetContainer memberInfo) {
        this.memberInfo = memberInfo;
    }

    /** Getter for property jobName.
     * @return Value of property jobName
     */
    public String getJobName() {
        return jobName;
    }

    /** Setter for property campaignID.
     * @param jobName New value of property jobName.
     */
    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public ResultSetContainer getMemberStats() {
        return memberStats;
    }

    public void setMemberStats(ResultSetContainer memberStats) {
        this.memberStats = memberStats;
    }


    /** Gets a statistic about the coder's Division I performance.
     * @param name The name of the statistic to be retrieved.
     * @return The value of the statistic, or an empty string if
     * the requested item is not found.
     *
     */
    public String getDivIStatistic(String name) {
        try {
            return JSPUtils.autoFormat(getDivIStats().getItem(name));
        } catch (NullPointerException npe) {
            log.debug("Null pointer exception in MemberProfileTask.getDivIStatistic(\""
                    + name + "\")");
            return "";
        }
    }

    /** Gets a statistic about the coder's Division II performance.
     * @param name The name of the statistic to be retrieved.
     * @return The value of the statistic, or an empty string if
     * the requested item is not found.
     *
     */
    public String getDivIIStatistic(String name) {
        try {
            return JSPUtils.autoFormat(getDivIIStats().getItem(name));
        } catch (NullPointerException npe) {
            log.debug("Null pointer exception in MemberProfileTask.getDivIIStatistic(\""
                    + name + "\")");
            return "";
        }
    }

    /** Performs pre-processing for the task.
     * @param request The servlet request object.
     * @param response The servlet response object.
     * @throws java.lang.Exception
     */
//    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
//            throws Exception {
//        HttpSession session = request.getSession(true);
//
//        User curUser = getAuthenticityToken().getActiveUser();
//        uid = curUser.getId();
//    }

    /** Performs post-processing for the task.
     * @param request The servlet request object.
     * @param response The servlet response object.
     * @throws java.lang.Exception
     */
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
        setTrail(a);

    }

    /** Processes the given step or phase of the task.
     * @param step The step to be processed.
     * @throws java.lang.Exception
     */
    public void processStep(String step)
            throws Exception {
        viewMemberProfile();

        ResumeServices rServices = null;
        try {
            rServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            hasResume = rServices.hasResume(memberID, getOltp());
            Contact contact = (Contact) BaseProcessor.createEJB(getInitialContext(), Contact.class);
            setCompanyId(contact.getCompanyId(uid, getOltp()));
        } catch (Exception e) {
            log.error("could not determine if user has a resume or not");
            e.printStackTrace();
        }

    }

    private void viewMemberProfile() throws Exception {

        // set up Data Warehouse query command.
        Request dwDataRequest = new Request();
        dwDataRequest.setContentHandle("tces_member_profile");
        dwDataRequest.setProperty("mid", Integer.toString(getMemberID()));

        Map dwResultMap = getDataAccess(getDw()).getData(dwDataRequest);
        ResultSetContainer dwRSC = null;

        // set up OLTP query command.
        Request oltpDataRequest = new Request();
        oltpDataRequest.setContentHandle("tces_member_profile");
        oltpDataRequest.setProperty("uid", Long.toString(uid));
        oltpDataRequest.setProperty("jid", Integer.toString(getJobID()));
        oltpDataRequest.setProperty("cid", Integer.toString(getCampaignID()));
        oltpDataRequest.setProperty("mid", Integer.toString(getMemberID()));

        Map oltpResultMap = getDataAccess(getOltp()).getData(oltpDataRequest);

        // verify that campaign/job/tces user have access to this members's info.
        ResultSetContainer oltpRSC = (ResultSetContainer) oltpResultMap.get("TCES_Verify_Member_Access");
        if (oltpRSC.getRowCount() == 0 && !super.getSessionInfo().isAdmin()) {
            throw new NotAuthorizedException(" mid=" + Integer.toString(getMemberID())
                    + " jid=" + Integer.toString(getJobID())
                    + " cid=" + Integer.toString(getCampaignID())
                    + "does not belong to uid=" + Long.toString(uid));
        }

        // start packaging data for presentation.

        oltpRSC = (ResultSetContainer) oltpResultMap.get("TCES_Company_Name");
        if (super.getSessionInfo().isAdmin())
            setCompanyName(TCESConstants.ADMIN_COMPANY);
        else
            setCompanyName(oltpRSC.getItem(0, "company_name").toString());

        oltpRSC = (ResultSetContainer) oltpResultMap.get("TCES_Position_Name");
        setJobName(oltpRSC.getItem(0, "job_desc").toString());

        setMemberInfo((ResultSetContainer) oltpResultMap.get("TCES_Member_Profile"));

        if (getMemberInfo().getItem(0, "coder_type_desc").toString().toUpperCase().indexOf("STUDENT") >= 0)
            setIsStudent(true);
        else
            setIsStudent(false);

        setMemberStats((ResultSetContainer) dwResultMap.get("TCES_Coder_Stats"));
        if (!getMemberStats().isEmpty()) {
            setIsRanked(true);

            setHasDivisionI(false);
            dwRSC = (ResultSetContainer) dwResultMap.get("TCES_Coder_Stats_D1");
            if (dwRSC.getRowCount() > 0) {
                setDivIStats(dwRSC.getRow(0));

                dwRSC = (ResultSetContainer) dwResultMap.get("TCES_Coder_Stats_by_Level_D1");
                setDivIStatsByLevel(dwRSC);

                dwRSC = (ResultSetContainer) dwResultMap.get("TCES_Coder_Stats_by_Language_D1");
                setDivIStatsByLang(dwRSC);
                if (!getDivIStatsByLevel().isEmpty() && !getDivIStatsByLang().isEmpty()) {
                    setHasDivisionI(true);
                }
                setHasMultipleDivILanguage(getDivIStatsByLang().size() > 1);
            }

            setHasDivisionII(false);
            dwRSC = (ResultSetContainer) dwResultMap.get("TCES_Coder_Stats_D2");
            if (dwRSC.getRowCount() > 0) {
                setDivIIStats(dwRSC.getRow(0));

                dwRSC = (ResultSetContainer) dwResultMap.get("TCES_Coder_Stats_by_Level_D2");
                setDivIIStatsByLevel(dwRSC);

                dwRSC = (ResultSetContainer) dwResultMap.get("TCES_Coder_Stats_by_Language_D2");
                setDivIIStatsByLang(dwRSC);
                if (!getDivIIStatsByLevel().isEmpty() && !getDivIIStatsByLang().isEmpty()) {
                    setHasDivisionII(true);
                }
                setHasMultipleDivIILanguage(getDivIIStatsByLang().size() > 1);
            }
        } else {
            setIsRanked(false);
        }

        setNextPage(TCESConstants.MEMBER_PROFILE_PAGE);
    }

    /** Sets attributes for the task.
     * @param paramName The name of the attribute being set.
     * @param paramValues The values to be associated with the given attribute.
     */
    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null ? "" : value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.JOB_ID_PARAM))
            setJobID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.MEMBER_ID_PARAM))
            setMemberID(Integer.parseInt(value));
    }

    /** Getter for property divIStats.
     * @return Value of property divIStats.
     */
    public ResultSetContainer.ResultSetRow getDivIStats() {
        return this.divIStats;
    }

    /** Setter for property divIStats.
     * @param divIStats New value of property divIStats.
     */
    public void setDivIStats(ResultSetContainer.ResultSetRow divIStats) {
        this.divIStats = divIStats;
    }

    /** Getter for property hasDivisionI.
     * @return Value of property hasDivisionI.
     */
    public boolean hasDivisionI() {
        return this.hasDivisionI;
    }

    /** Setter for property hasDivisionI.
     * @param hasDivisionI New value of property hasDivisionI.
     */
    public void setHasDivisionI(boolean hasDivisionI) {
        this.hasDivisionI = hasDivisionI;
    }

    /** Getter for property hasDivisionII.
     * @return Value of property hasDivisionII.
     */
    public boolean hasDivisionII() {
        return this.hasDivisionII;
    }

    /** Setter for property hasDivisionII.
     * @param hasDivisionII New value of property hasDivisionII.
     */
    public void setHasDivisionII(boolean hasDivisionII) {
        this.hasDivisionII = hasDivisionII;
    }

    /** Getter for property divIIStats.
     * @return Value of property divIIStats.
     */
    public ResultSetContainer.ResultSetRow getDivIIStats() {
        return this.divIIStats;
    }

    /** Setter for property divIIStats.
     * @param divIIStats New value of property divIIStats.
     */
    public void setDivIIStats(ResultSetContainer.ResultSetRow divIIStats) {
        this.divIIStats = divIIStats;
    }

    /** Getter for property divIStatsByLevel.
     * @return Value of property divIStatsByLevel.
     */
    public List getDivIStatsByLevel() {
        return this.divIStatsByLevel;
    }

    /** Setter for property divIStatsByLevel.
     * @param divIStatsByLevel New value of property divIStatsByLevel.
     */
    public void setDivIStatsByLevel(List divIStatsByLevel) {
        this.divIStatsByLevel = divIStatsByLevel;
    }

    /** Getter for property divIStatsByLang.
     * @return Value of property divIStatsByLang.
     */
    public List getDivIStatsByLang() {
        return this.divIStatsByLang;
    }

    /** Setter for property divIStatsByLang.
     * @param divIStatsByLang New value of property divIStatsByLang.
     */
    public void setDivIStatsByLang(List divIStatsByLang) {
        this.divIStatsByLang = divIStatsByLang;
    }

    /** Getter for property divIIStatsByLang.
     * @return Value of property divIIStatsByLang.
     */
    public List getDivIIStatsByLang() {
        return this.divIIStatsByLang;
    }

    /** Setter for property divIIStatsByLang.
     * @param divIIStatsByLang New value of property divIIStatsByLang.
     */
    public void setDivIIStatsByLang(List divIIStatsByLang) {
        this.divIIStatsByLang = divIIStatsByLang;
    }

    /** Getter for property divIIStatsByLevel.
     * @return Value of property divIIStatsByLevel.
     */
    public List getDivIIStatsByLevel() {
        return this.divIIStatsByLevel;
    }

    /** Setter for property divIIStatsByLevel.
     * @param divIIStatsByLevel New value of property divIIStatsByLevel.
     */
    public void setDivIIStatsByLevel(List divIIStatsByLevel) {
        this.divIIStatsByLevel = divIIStatsByLevel;
    }


    public boolean hasMultipleDivILanguage() {
        return hasMultipleDivILanguage;
    }

    public void setHasMultipleDivILanguage(boolean hasOneDivILanguage) {
        this.hasMultipleDivILanguage = hasOneDivILanguage;
    }

    public boolean hasMultipleDivIILanguage() {
        return hasMultipleDivIILanguage;
    }

    public void setHasMultipleDivIILanguage(boolean hasOneDivIILanguage) {
        this.hasMultipleDivIILanguage = hasOneDivIILanguage;
    }

    public long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(long companyId) {
        this.companyId = companyId;
    }


}



