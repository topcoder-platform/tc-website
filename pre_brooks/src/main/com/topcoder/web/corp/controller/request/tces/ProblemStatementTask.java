/*
 * ProblemStatementTask.java
 *
 * Created on August 27, 2002, 2:38 PM
 */

package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.common.web.render.ProblemRenderer;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.language.CStyleLanguage;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.problemParser.ProblemComponentFactory;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.common.TCESAuthenticationException;
import com.topcoder.web.corp.common.TCESConstants;
import com.topcoder.web.corp.controller.request.tces.BaseTask;

import java.io.Serializable;
import java.io.StringReader;
import java.util.Map;

/** Processes the problem statement task.
 * @author George Dean
 */
public class ProblemStatementTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(ProblemStatementTask.class);

    //private long uid;  // moved to BaseTask
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

    /** Processes the given step or phase of the task.
     * @param step The step to be processed.
     * @throws java.lang.Exception
     */
    public void processStep(String step) throws Exception {
        viewProblemStatement();
    }

    private void viewProblemStatement() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_problem_statement");

        dataRequest.setProperty("uid", Long.toString(uid));
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()));
        dataRequest.setProperty("jid", Integer.toString(getJobID()));
        dataRequest.setProperty("mid", Integer.toString(getMemberID()));
        dataRequest.setProperty("pm", Integer.toString(getProblemID()));

        Map resultMap = getDataAccess(getOltp()).getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Member_Access");
        if (rsc.getRowCount() == 0 && !super.getSessionInfo().isAdmin()) {
            throw new TCESAuthenticationException("mid=" + Integer.toString(getMemberID()) +
                    " jid=" + Integer.toString(getJobID()) +
                    " cid=" + Integer.toString(getCampaignID()) +
                    " does not belong to uid=" + Long.toString(uid));
        }

        resultMap = getDataAccess(getDw()).getData(dataRequest);

        rsc = (ResultSetContainer) resultMap.get("TCES_Problem_Statement");
        if (rsc.getRowCount() == 0) {
            throw new TCESAuthenticationException("No problem data!");
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
        if (paramName.equalsIgnoreCase(TCESConstants.PROBLEM_ID_PARAM))
            setProblemID(Integer.parseInt(value));
    }

    /** Creates new ProblemStatementTask */
    public ProblemStatementTask() {
        super();
        setNextPage(TCESConstants.PROBLEM_STATEMENT_PAGE);

        uid = -1;
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
