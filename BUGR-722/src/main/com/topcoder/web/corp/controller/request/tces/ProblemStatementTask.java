/*
 * ProblemStatementTask.java
 *
 * Created on August 27, 2002, 2:38 PM
 */

package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.security.NotAuthorizedException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.language.CStyleLanguage;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.problemParser.ProblemComponentFactory;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.render.ProblemRenderer;
import com.topcoder.web.corp.common.TCESConstants;

import java.io.StringReader;
import java.util.Map;

/** Processes the problem statement task.
 * @author George Dean
 */
public class ProblemStatementTask extends BaseTask  {

    private static Logger log = Logger.getLogger(ProblemStatementTask.class);

    //private long uid;  // moved to BaseTask
    private long cid;
    private long jid;
    private long mid;
    private long roundId;

    /** Holds value of property problemID. */
    private long problemID;

    /** Holds value of property contestName. */
    private String contestName;

    /** Holds value of property divisionName. */
    private String divisionName;

    /** Holds value of property problemName. */
    private String problemName;

    /** Holds value of property problemText. */
    private String problemText;


    protected void businessProcessing() throws Exception {
        setCampaignID(Long.parseLong(getRequest().getParameter(TCESConstants.CAMPAIGN_ID_PARAM)));
        setJobID(Long.parseLong(getRequest().getParameter(TCESConstants.JOB_ID_PARAM)));
        setMemberID(Long.parseLong(getRequest().getParameter(TCESConstants.MEMBER_ID_PARAM)));
        setProblemID(Long.parseLong(getRequest().getParameter(TCESConstants.PROBLEM_ID_PARAM)));
        setRoundId(Long.parseLong(getRequest().getParameter(TCESConstants.ROUND_ID_PARAM)));


        viewProblemStatement();
        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf('.')+1), this);
        


    }


    private void viewProblemStatement() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_problem_statement");

        dataRequest.setProperty("uid", String.valueOf(getUser().getId()));
        dataRequest.setProperty("cid", String.valueOf(getCampaignID()));
        dataRequest.setProperty("jid", String.valueOf(getJobID()));
        dataRequest.setProperty("mid", String.valueOf(getMemberID()));
        dataRequest.setProperty("pm", String.valueOf(getProblemID()));
        dataRequest.setProperty("rd", String.valueOf(getRoundId()));

        Map resultMap = getDataAccess(getOltp()).getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Member_Access");
        if (rsc.getRowCount() == 0 && !super.getSessionInfo().isAdmin()) {
            throw new NotAuthorizedException("mid=" + String.valueOf(getMemberID()) +
                    " jid=" + String.valueOf(getJobID()) +
                    " cid=" + String.valueOf(getCampaignID()) +
                    " does not belong to uid=" + String.valueOf(getUser().getId()));
        }

        resultMap = getDataAccess(getDw()).getData(dataRequest);

        rsc = (ResultSetContainer) resultMap.get("TCES_Problem_Statement");
        if (rsc.getRowCount() == 0) {
            throw new NotAuthorizedException("No problem data!");
        }
        ResultSetContainer.ResultSetRow problemRow = rsc.getRow(0);
        setContestName(problemRow.getItem("contest_name").toString());
        setDivisionName(problemRow.getItem("division_desc").toString());
        setProblemName(problemRow.getItem("class_name").toString());

        StringReader reader = new StringReader(problemRow.getItem("problem_text").toString());
        ProblemComponent arrProblemComponent[] = new ProblemComponent[1];
        arrProblemComponent[0] = new ProblemComponentFactory().buildFromXML(reader, true);
        Problem problem = new Problem();
        problem.setProblemComponents(arrProblemComponent);
        ProblemRenderer pr = new ProblemRenderer(problem);
        pr.setTdClass("bodyText");
        setProblemText(pr.toHTML(new CStyleLanguage(Integer.parseInt(problemRow.getItem("language_id").toString()), "")));

        setNextPage(TCESConstants.PROBLEM_STATEMENT_PAGE);
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

    public long getRoundId() {
        return roundId;
    }

    public void setRoundId(long roundId) {
        this.roundId = roundId;
    }


}
