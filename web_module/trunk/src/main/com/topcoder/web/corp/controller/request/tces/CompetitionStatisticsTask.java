/*
 * CompetitionStatisticsTask.java
 *
 * Created on August 27, 2002, 12:07 AM
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

/** Processes the competition statistics task.
 * @author George Dean
 */
public class CompetitionStatisticsTask extends BaseTask {

    private static Logger log = Logger.getLogger(CompetitionStatisticsTask.class);

    //private long uid;  // moved to BaseTask
    private long cid;
    private long jid;
    private long mid;

    /** Holds value of property roundID. */
    private long roundID;

    /** Holds value of property handle. */
    private String handle;

    /** Holds value of property competitionStats. */
    private ResultSetContainer.ResultSetRow competitionStats;

    /** Holds value of property coderStatsByLevel. */
    private List coderStatsByLevel;

    /** Holds value of property overallStatsByLevel. */
    private List overallStatsByLevel;

    /** Gets the requested statistic.
     * @param name The name of the statistic to be retrieved.
     * @return The value of the requested statistic, or an empty
     * string if the requested item is not available.
     */
    public String getStatistic(String name) {
        try {
            return JSPUtils.autoFormat(getCompetitionStats().getItem(name));
        } catch (NullPointerException npe) {
            log.debug("Null pointer exception in CompetitionStatisticsTask.getStatistic(\""
                    + name + "\")");
            return "";
        }
    }


    protected void businessProcessing() throws Exception {
        setCampaignID(Long.parseLong(getRequest().getParameter(TCESConstants.CAMPAIGN_ID_PARAM)));
    setJobID(Long.parseLong(getRequest().getParameter(TCESConstants.JOB_ID_PARAM)));
    setMemberID(Long.parseLong(getRequest().getParameter(TCESConstants.MEMBER_ID_PARAM)));
        setRoundID(Long.parseLong(getRequest().getParameter(TCESConstants.ROUND_ID_PARAM)));

        viewCompetitionStatistics();

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
        setNextPage(TCESConstants.COMPETITION_STATISTICS_PAGE);
        setIsNextPageInContext(true);
        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf('.')+1), this);
        

        
    }

    private void viewCompetitionStatistics() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_competition_statistics");

        dataRequest.setProperty("uid", String.valueOf(getUser().getId()));
        dataRequest.setProperty("cid", String.valueOf(getCampaignID()));
        dataRequest.setProperty("jid", String.valueOf(getJobID()));
        dataRequest.setProperty("mid", String.valueOf(getMemberID()));
        dataRequest.setProperty("rd", String.valueOf(getRoundID()));

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
            if (!getRoundIds(getCampaignID()).contains(new Long(getRoundID()))) {
                throw new NotAuthorizedException(" cid=" + String.valueOf(getCampaignID()) +
                        " rd=" + getRoundID() +
                        " does not belong to uid=" + String.valueOf(getUser().getId()));
            }
        }

        resultMap = getDataAccess(getDw()).getData(dataRequest);

        rsc = (ResultSetContainer) resultMap.get("TCES_Coder_Comp_Stats");
        if (rsc.getRowCount() == 0) {
            throw new Exception("No competition data!");
        }
        setCompetitionStats(rsc.getRow(0));

        rsc = (ResultSetContainer) resultMap.get("TCES_Coder_Comp_Stats_by_Level");
        setCoderStatsByLevel(rsc);

        rsc = (ResultSetContainer) resultMap.get("TCES_Overall_Comp_Stats_by_Level");
        setOverallStatsByLevel(rsc);

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

    /** Getter for property roundID.
     * @return Value of property roundID.
     */
    public long getRoundID() {
        return this.roundID;
    }

    /** Setter for property roundID.
     * @param roundID New value of property roundID.
     */
    public void setRoundID(long roundID) {
        this.roundID = roundID;
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

    /** Getter for property competitionStats.
     * @return Value of property competitionStats.
     */
    public ResultSetContainer.ResultSetRow getCompetitionStats() {
        return this.competitionStats;
    }

    /** Setter for property competitionStats.
     * @param competitionStats New value of property competitionStats.
     */
    public void setCompetitionStats(ResultSetContainer.ResultSetRow competitionStats) {
        this.competitionStats = competitionStats;
    }

    /** Getter for property coderStatsByLevel.
     * @return Value of property coderStatsByLevel.
     */
    public List getCoderStatsByLevel() {
        return this.coderStatsByLevel;
    }

    /** Setter for property coderStatsByLevel.
     * @param coderStatsByLevel New value of property coderStatsByLevel.
     */
    public void setCoderStatsByLevel(List coderStatsByLevel) {
        this.coderStatsByLevel = coderStatsByLevel;
    }

    /** Getter for property overallStatsByLevel.
     * @return Value of property overallStatsByLevel.
     */
    public List getOverallStatsByLevel() {
        return this.overallStatsByLevel;
    }

    /** Setter for property overallStatsByLevel.
     * @param overallStatsByLevel New value of property overallStatsByLevel.
     */
    public void setOverallStatsByLevel(List overallStatsByLevel) {
        this.overallStatsByLevel = overallStatsByLevel;
    }

}
