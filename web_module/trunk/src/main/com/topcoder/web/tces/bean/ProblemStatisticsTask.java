/*
 * ProblemStatisticsTask.java
 *
 * Created on August 27, 2002, 1:07 PM
 */

package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.common.TCESConstants;
import com.topcoder.web.tces.common.JSPUtils;
import com.topcoder.web.tces.common.TCESAuthenticationException;

import javax.servlet.http.*;
import java.io.Serializable;
import java.util.*;

/** Processes the problem statistics task.
 * @author George Dean
 */
public class ProblemStatisticsTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(ProblemStatisticsTask.class);

    private int uid;
    private int cid;
    private int jid;
    private int mid;

    /** Holds value of property problemID. */
    private int problemID;

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
    public String getStatistic(String name){
        try{
            return JSPUtils.autoFormat(getProblemStats().getItem(name));
        }catch(NullPointerException npe){
            log.debug("Null pointer exception in ProblemStatisticsTask.getStatistic(\""
                      + name + "\")");
            return "";
        }
    }

    /** Performs pre-processing for the task.
     * @param request The servlet request object.
     * @param response The servlet response object.
     * @throws Exception
     */    
    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        HttpSession session = request.getSession(true);

        if (!Authentication.isLoggedIn(session)) {
            log.debug("User not authenticated for access to TCES resource.");
            throw new TCESAuthenticationException("User not authenticated for access to TCES resource.");
        }

        uid = Authentication.userLoggedIn(session);
    }

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
     * @throws Exception
     */    
    public void processStep(String step) throws Exception {
        viewProblemStatistics();
    }

    private void viewProblemStatistics() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_problem_statistics");

        dataRequest.setProperty("uid", Integer.toString(uid) );
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()) );
        dataRequest.setProperty("jid", Integer.toString(getJobID()) );
        dataRequest.setProperty("mid", Integer.toString(getMemberID()) );
        dataRequest.setProperty("pm", Integer.toString(getProblemID()) );

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
            throw new TCESAuthenticationException ("mid="+Integer.toString(getMemberID())+
                                 " jid="+Integer.toString(getJobID())+
                                 " cid="+Integer.toString(getCampaignID())+
                                 " does not belong to uid="+Integer.toString(uid) );
        }

        dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.DW_DATASOURCE_NAME));
        resultMap = dai.getData(dataRequest);

        rsc = (ResultSetContainer) resultMap.get("TCES_Coder_Problem_Stats");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("No problem data!");
        }
        setProblemStats( rsc.getRow(0) );

        rsc = (ResultSetContainer) resultMap.get("TCES_Problem_Stats_by_Language");
        setProblemStatsByLanguage( (List)rsc );

        setNextPage( TCESConstants.PROBLEM_STATISTICS_PAGE );
    }

    /** Sets attributes for the task.
     * @param paramName The name of the attribute being set.
     * @param paramValues The values to be associated with the given attribute.
     */    
    public void setAttributes(String paramName, String[] paramValues) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.JOB_ID_PARAM))
            setJobID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.MEMBER_ID_PARAM))
            setMemberID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.PROBLEM_ID_PARAM))
            setProblemID(Integer.parseInt(value));
    }

    /** Creates new ProblemStatisticsTask */
    public ProblemStatisticsTask() {
        super();
        setNextPage(TCESConstants.PROBLEM_STATISTICS_PAGE);

        uid=-1;
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

    /** Getter for property problemID.
     * @return Value of property problemID.
     */
    public int getProblemID() {
        return this.problemID;
    }

    /** Setter for property problemID.
     * @param problemID New value of property problemID.
     */
    public void setProblemID(int problemID) {
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

}
