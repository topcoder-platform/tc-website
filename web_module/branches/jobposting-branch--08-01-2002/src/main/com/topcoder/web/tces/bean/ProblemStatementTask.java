/*
 * ProblemStatementTask.java
 *
 * Created on August 27, 2002, 2:38 PM
 */

package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.common.TCESConstants;
import com.topcoder.web.tces.common.JSPUtils;

import javax.servlet.http.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 *
 * @author  George Dean
 */
public class ProblemStatementTask extends BaseTask implements Task, Serializable {
    
    private static Logger log = Logger.getLogger(ProblemStatementTask.class);

    private int uid;
    private int cid;
    private int jid;
    private int mid;
    
    /** Holds value of property problemID. */
    private int problemID;
    
    /** Holds value of property contestName. */
    private String contestName;
    
    /** Holds value of property divisionName. */
    private String divisionName;
    
    /** Holds value of property problemName. */
    private String problemName;
    
    /** Holds value of property problemText. */
    private String problemText;
    
    private String formatProblemText(String sProblemText){
        //here is where we make the problem-text readable
        int i=-1;
        while((i = sProblemText.indexOf("\n\n"))>=0){
            sProblemText = sProblemText.substring(0,i+1) + "&nbsp;" + sProblemText.substring(i+1);
        }
        java.util.StringTokenizer strtok = new java.util.StringTokenizer(sProblemText,"\n");
        StringBuffer stBuffer = new StringBuffer(sProblemText.length());
        String sTemp = "";
        boolean bAsciiArt = false;
        while (strtok.hasMoreTokens()){
            sTemp = strtok.nextToken();
            bAsciiArt = (sTemp.length() < 100);	 
            for (i=0; i < sTemp.length() && sTemp.charAt(i)==' '; i++){
                bAsciiArt = true;
                stBuffer.append("&nbsp;");
            }
            sTemp = sTemp.substring(i);
            if (!bAsciiArt) stBuffer.append(JSPUtils.htmlEncode(sTemp));
            else{
                for (i=0;i<sTemp.length(); i++){
                    if (sTemp.charAt(i)==' ')
                        stBuffer.append("&nbsp;");
                    else if (sTemp.charAt(i)=='\t')
                        stBuffer.append("&nbsp;&nbsp;&nbsp;");
                    else
                        stBuffer.append(JSPUtils.htmlEncode(sTemp.substring(i, i+1)));
                }
            }
            stBuffer.append("<BR>");
        }
        
        return stBuffer.toString();
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
        viewProblemStatement();
    }
    
    private void viewProblemStatement() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_problem_statistics");

        dataRequest.setProperty("uid", Integer.toString(uid) );
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()) );
        dataRequest.setProperty("jid", Integer.toString(getJobID()) );
        dataRequest.setProperty("mid", Integer.toString(getMemberID()) );
        dataRequest.setProperty("pm", Integer.toString(getProblemID()) );
        
        DataAccessInt dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = dai.getData(dataRequest);
        
        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Member_Access");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("mid="+Integer.toString(getMemberID())+
                                 " jid="+Integer.toString(getJobID())+
                                 " cid="+Integer.toString(getCampaignID())+
                                 " does not belong to uid="+Integer.toString(uid) );
        }

        dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.DW_DATASOURCE_NAME));
        resultMap = dai.getData(dataRequest);

        rsc = (ResultSetContainer) resultMap.get("TCES_Problem_Statement");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("No problem data!");
        }
        ResultSetContainer.ResultSetRow problemRow = rsc.getRow(0);
        setContestName( problemRow.getItem("contest_name").toString() );
        setDivisionName( problemRow.getItem("division_desc").toString() );
        setProblemName( problemRow.getItem("class_name").toString() );
        setProblemText( formatProblemText(problemRow.getItem("problem_text").toString()) );
        
        setNextPage( TCESConstants.PROBLEM_STATEMENT_PAGE );
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
        if (paramName.equalsIgnoreCase(TCESConstants.PROBLEM_ID_PARAM))
            setProblemID(Integer.parseInt(value));
    }
    
    /** Creates new ProblemStatementTask */
    public ProblemStatementTask() {
        super();
        setNextPage(TCESConstants.PROBLEM_STATEMENT_PAGE);

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
    
    /** Getter for property contestName.
     * @return Value of property contestName.
     */
    public String getContestName() {
        return this.contestName;
    }
    
    /** Setter for property contestName.
     * @param contestName New value of property contestName.
     */
    public void setContestName(String contestName) {
        this.contestName = contestName;
    }
    
    /** Getter for property divisionName.
     * @return Value of property divisionName.
     */
    public String getDivisionName() {
        return this.divisionName;
    }
    
    /** Setter for property divisionName.
     * @param divisionName New value of property divisionName.
     */
    public void setDivisionName(String divisionName) {
        this.divisionName = divisionName;
    }
    
    /** Getter for property problemName.
     * @return Value of property problemName.
     */
    public String getProblemName() {
        return this.problemName;
    }
    
    /** Setter for property problemName.
     * @param problemName New value of property problemName.
     */
    public void setProblemName(String problemName) {
        this.problemName = problemName;
    }
    
    /** Getter for property problemText.
     * @return Value of property problemText.
     */
    public String getProblemText() {
        return this.problemText;
    }
    
    /** Setter for property problemText.
     * @param problemText New value of property problemText.
     */
    public void setProblemText(String problemText) {
        this.problemText = problemText;
    }
    
}
