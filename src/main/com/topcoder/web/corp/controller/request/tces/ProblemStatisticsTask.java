/*
 * ProblemStatisticsTask.java
 *
 * Created on August 27, 2002, 1:07 PM
 */

package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.security.NotAuthorizedException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.common.JSPUtils;
import com.topcoder.web.corp.common.TCESConstants;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** Processes the problem statistics task.
 * @author George Dean
 */
public class ProblemStatisticsTask extends BaseTask {

    private static Logger log = Logger.getLogger(ProblemStatisticsTask.class);

    //private long uid; // moved to BaseTask
    private long cid;
    private long jid;
    private long mid;
    private long roundId;

    /** Holds value of property problemID. */
    private long problemID;

    /** Holds value of property handle. */
    private String handle;

    /** Holds value of property problemStats. */
    private ResultSetContainer.ResultSetRow problemStats;

    /** Holds value of property problemStatsByLanguage. */
    private List problemStatsByLanguage;

    /** Gets the requested statistic.
     * @param name The name of the statistic to be retrieved.
     * @return The value of the requested statistic, or an empty
     * string if the requested item is not available.
     */
    public String getStatistic(String name) {
        try {
            return JSPUtils.autoFormat(getProblemStats().getItem(name));
        } catch (NullPointerException npe) {
            log.debug("Null pointer exception in ProblemStatisticsTask.getStatistic(\""
                    + name + "\")");
            return "";
        }
    }


    protected void businessProcessing() throws Exception {
        setCampaignID(Long.parseLong(getRequest().getParameter(TCESConstants.CAMPAIGN_ID_PARAM)));
        setJobID(Long.parseLong(getRequest().getParameter(TCESConstants.JOB_ID_PARAM)));
        setMemberID(Long.parseLong(getRequest().getParameter(TCESConstants.MEMBER_ID_PARAM)));
        setProblemID(Long.parseLong(getRequest().getParameter(TCESConstants.PROBLEM_ID_PARAM)));
        setRoundId(Long.parseLong(getRequest().getParameter(TCESConstants.ROUND_ID_PARAM)));

        viewProblemStatistics();
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
        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf('.')+1), this);
        


    }


    private void viewProblemStatistics() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_problem_statistics");

        dataRequest.setProperty("uid", String.valueOf(getUser().getId()));
        dataRequest.setProperty("cid", String.valueOf(getCampaignID()));
        dataRequest.setProperty("jid", String.valueOf(getJobID()));
        dataRequest.setProperty("mid", String.valueOf(getMemberID()));
        dataRequest.setProperty("pm", String.valueOf(getProblemID()));
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
            throw new NotAuthorizedException("mid=" + String.valueOf(getMemberID()) +
                    " jid=" + String.valueOf(getJobID()) +
                    " cid=" + String.valueOf(getCampaignID()) +
                    " does not belong to uid=" + String.valueOf(getUser().getId()));
        }

        if (isRestrictedCampaign(getCampaignID())) {
            if (!getRoundIds(getCampaignID()).contains(new Long(getRoundId()))) {
                throw new NotAuthorizedException(" cid=" + String.valueOf(getCampaignID()) +
                        " rd=" + getRoundId() +
                        " does not belong to uid=" + String.valueOf(getUser().getId()));
            }
        }


        resultMap = getDataAccess(getDw()).getData(dataRequest);

        rsc = (ResultSetContainer) resultMap.get("TCES_Coder_Problem_Stats");
        if (rsc.getRowCount() == 0) {
            throw new Exception("No problem data!");
        }
        setProblemStats(rsc.getRow(0));

        rsc = (ResultSetContainer) resultMap.get("TCES_Problem_Stats_by_Language");
        setProblemStatsByLanguage(rsc);

        setNextPage(TCESConstants.PROBLEM_STATISTICS_PAGE);
        setIsNextPageInContext(true);
        
    }

    /** Getter for property campaignID.
     * @return Value of property campaignID.
     */
    public long getCampaignID() {
        return cid;
    }

    /** Setter for property campaignID.
     * @param campaignID New value of property campaignID.
     */
    public void setCampaignID(long campaignID) {
        cid = campaignID;
    }

    /** Getter for property jobID.
     * @return Value of property jobID.
     */
    public long getJobID() {
        return jid;
    }

    /** Setter for property jobID.
     * @param jobID New value of property jobID.
     */
    public void setJobID(long jobID) {
        jid = jobID;
    }

    /** Getter for property memberID.
     * @return Value of property memberID.
     */
    public long getMemberID() {
        return mid;
    }

    /** Setter for property memberID.
     * @param memberID New value of property memberID.
     */
    public void setMemberID(long memberID) {
        mid = memberID;
    }

    /** Getter for property problemID.
     * @return Value of property problemID.
     */
    public long getProblemID() {
        return this.problemID;
    }

    /** Setter for property problemID.
     * @param problemID New value of property problemID.
     */
    public void setProblemID(long problemID) {
        this.problemID = problemID;
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

    /** Getter for property problemStats.
     * @return Value of property problemStats.
     */
    public ResultSetContainer.ResultSetRow getProblemStats() {
        return this.problemStats;
    }

    /** Setter for property problemStats.
     * @param problemStats New value of property problemStats.
     */
    public void setProblemStats(ResultSetContainer.ResultSetRow problemStats) {
        this.problemStats = problemStats;
    }

    /** Getter for property problemStatsByLanguage.
     * @return Value of property problemStatsByLanguage.
     */
    public List getProblemStatsByLanguage() {
        return this.problemStatsByLanguage;
    }

    /** Setter for property problemStatsByLanguage.
     * @param problemStatsByLanguage New value of property problemStatsByLanguage.
     */
    public void setProblemStatsByLanguage(List problemStatsByLanguage) {
        this.problemStatsByLanguage = problemStatsByLanguage;
    }

    public long getRoundId() {
        return roundId;
    }

    public void setRoundId(long roundId) {
        this.roundId = roundId;
    }

}
