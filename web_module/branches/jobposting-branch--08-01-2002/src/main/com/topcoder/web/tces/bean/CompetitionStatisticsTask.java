/*
 * CompetitionStatisticsTask.java
 *
 * Created on August 27, 2002, 12:07 AM
 */

package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.common.TCESConstants;

import javax.servlet.http.*;
import java.io.Serializable;
import java.util.*;

/**
 *
 * @author  George Dean
 */
public class CompetitionStatisticsTask extends BaseTask implements Task, Serializable {
    
    private static Logger log = Logger.getLogger(CompetitionStatisticsTask.class);

    private int uid;
    private int cid;
    private int jid;
    private int mid;
    
    /** Holds value of property roundID. */
    private int roundID;
    
    /** Holds value of property handle. */
    private String handle;
    
    /** Holds value of property competitionStats. */
    private ResultSetContainer.ResultSetRow competitionStats;
    
    /** Holds value of property coderStatsByLevel. */
    private List coderStatsByLevel;
    
    /** Holds value of property overallStatsByLevel. */
    private List overallStatsByLevel;
    
    public String getStatistic(String name){
        return getCompetitionStatistics().getItem(name).toString();
    }
    
    /** Creates new CompetitionStatisticsTask */
    public CompetitionStatisticsTask() {
        super();
        setNextPage(TCESConstants.COMPETITION_STATISTICS_PAGE);

        uid=-1;
    }
    
    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        HttpSession session = request.getSession(true);

        Integer userId = (Integer)session.getAttribute("user_id");
        if (userId == null || (userId.intValue()<0) ) {
            log.debug("User not authenticated for access to ES main page.");
            throw new Exception("User not authenticated for access to ES main page.");
        }

        uid = userId.intValue();
    }

    public void processStep(String step) throws Exception {
        viewCompetitionStatistics();
    }
    
    private void viewCompetitionStatistics() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_competition_statistics");

        dataRequest.setProperty("uid", Integer.toString(uid) );
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()) );
        dataRequest.setProperty("jid", Integer.toString(getJobID()) );
        dataRequest.setProperty("mid", Integer.toString(getMemberID()) );
        dataRequest.setProperty("rd", Integer.toString(getRoundID()) );
        
        DataAccessInt dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = dai.getData(dataRequest);
        
        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Member_Handle");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("No member handle!");
        }
        ResultSetContainer.ResultSetRow handleRow = rsc.getRow(0);
        setHandle( handleRow.getItem("handle").toString() );

        rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Member_Access");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("mid="+Integer.toString(getMemberID())+
                                 " jid="+Integer.toString(getJobID())+
                                 " cid="+Integer.toString(getCampaignID())+
                                 " does not belong to uid="+Integer.toString(uid) );
        }

        dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.DW_DATASOURCE_NAME));
        resultMap = dai.getData(dataRequest);

        rsc = (ResultSetContainer) resultMap.get("TCES_Coder_Comp_Stats");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("No competition data!");
        }
        setCompetitionStats( rsc.getRow(0) );

        rsc = (ResultSetContainer) resultMap.get("TCES_Coder_Comp_Stats_by_Level");
        setCoderStatsByLevel( (List)rsc );
        
        rsc = (ResultSetContainer) resultMap.get("TCES_Overall_Comp_Stats_by_Level");
        setOverallStatsByLevel( (List)rsc );
        
        setNextPage( TCESConstants.COMPETITION_STATISTICS_PAGE );
    }
    
    public void setAttributes(String paramName, String[] paramValues) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.JOB_ID_PARAM))
            setJobID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.MEMBER_ID_PARAM))
            setMemberID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.ROUND_ID_PARAM))
            setRoundID(Integer.parseInt(value));
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
    
    /** Getter for property roundID.
     * @return Value of property roundID.
     */
    public int getRoundID() {
        return this.roundID;
    }
    
    /** Setter for property roundID.
     * @param roundID New value of property roundID.
     */
    public void setRoundID(int roundID) {
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
