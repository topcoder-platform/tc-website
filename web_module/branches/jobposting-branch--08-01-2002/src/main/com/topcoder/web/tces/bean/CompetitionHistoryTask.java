/*
 * CompetitionHistoryTask.java
 *
 * Created on August 25, 2002, 11:01 PM
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
public class CompetitionHistoryTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(CompetitionHistoryTask.class);

    private int uid;
    private int cid;
    private int jid;
    private int mid;

    /** Holds value of property competitionList. */
    private List competitionList;

    /** Holds value of property handle. */
    private String handle;

    /** Creates new CompetitionHistoryTask */
    public CompetitionHistoryTask() {
        super();
        setNextPage(TCESConstants.COMPETITION_HISTORY_PAGE);

        uid=-1;
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        HttpSession session = request.getSession(true);

        Integer userId = (Integer)session.getAttribute("user_id");
        if (userId == null || (userId.intValue()<0) ) {
            log.debug("User not authenticated for access to ES main page.");
            throw new TCESAuthenticationException("User not authenticated for access to ES main page.");
        }

        uid = userId.intValue();
    }

    public void processStep(String step) throws Exception {
        viewCompetitionHistory();
    }

    private void viewCompetitionHistory() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_competition_history");

        dataRequest.setProperty("uid", Integer.toString(uid) );
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()) );
        dataRequest.setProperty("jid", Integer.toString(getJobID()) );
        dataRequest.setProperty("mid", Integer.toString(getMemberID()) );

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

        rsc = (ResultSetContainer) resultMap.get("TCES_Competition_History");
        ArrayList compList = new ArrayList();
        ResultSetContainer.ResultSetRow compListRow = null;
        for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
            compListRow = rsc.getRow(rowI);
            HashMap comp = new HashMap();

            comp.put("round_id",
                    ((Long)compListRow.getItem("round_id").getResultData()).toString() );
            comp.put("date",
                    getDate(compListRow, "date"));
            comp.put("contest_name",
                    compListRow.getItem("name").toString() );
            comp.put("division_name",
                    compListRow.getItem("division_desc").toString() );
            comp.put("final_points",
                    compListRow.getItem("final_points").toString() );
            comp.put("avg_points",
                    compListRow.getItem("average_points").toString() );
            comp.put("old_rating",
                    compListRow.getItem("old_rating").toString() );
            comp.put("new_rating",
                    compListRow.getItem("new_rating").toString() );

            compList.add(comp);
        }

        setCompetitionList( compList );

        setNextPage( TCESConstants.COMPETITION_HISTORY_PAGE );
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

}
