package com.topcoder.web.corp.model;

import java.util.List;
import java.util.Map;
import java.util.Arrays;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.PermissionDeniedException;
import com.topcoder.web.corp.common.Constants;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;

/**
 * Bean for holding info about a coder's submission.
 * @author Porgery
 */
public class SubmissionInfo implements java.io.Serializable {

    private static Logger log = Logger.getLogger(SubmissionInfo.class);

    private static final int[] DONE_STATUSES = {130, 150, 160};
    private static final int COMPILED = 121;
    static { Arrays.sort(DONE_STATUSES); }
    private static DataAccessInt cached;
    private static DataAccessInt dwAccess;

    /** Holds value of property code. */
    private String code;

    /** Holds value of property testResults. */
    private ResultSetContainer testResults;

    /** Holds value of property topTCSolutions. */
    private List topTCSolutions;

    private String handle;
    private long userId;
    private String profileName;
    private String testSetAName;
    private int statusId;


    public SubmissionInfo() { }

    public SubmissionInfo(User user, long sessionId, long sessionRoundId,
                                                      long problemId, int problemTypeId) throws Exception {

        log.debug("getting sumbmission info for session: " + sessionId + " round: " + sessionRoundId +
                " problem: " + problemId + " probletype: " + problemTypeId);
        if(cached == null) {
            cached = new CachedDataAccess(Constants.DATA_SOURCE);
        }

        if(dwAccess == null) {
            dwAccess = new CachedDataAccess(Constants.DW_DATA_SOURCE);
        }


        Request dr = new Request();
        dr.setContentHandle("problemResults");
        dr.setProperty("uid", String.valueOf(user.getId()));
        dr.setProperty(Constants.PROBLEM_TYPE_ID, String.valueOf(problemTypeId));
        dr.setProperty(Constants.PROBLEM_ID, String.valueOf(problemId));
        dr.setProperty(Constants.SESSION_ID, String.valueOf(sessionId));
        dr.setProperty(Constants.ROUND_ID, String.valueOf(sessionRoundId));

        //we're using cached becuase currently there is nowhere in the system that
        //accesses this that may first access it before someone has submitted
        //and then again after thus getting a bad value from the cache
        Map map = cached.getData(dr);
        if(map == null)
            throw new ScreeningException("getData failed!");

        ResultSetContainer result =
            (ResultSetContainer)map.get("submissionInfo");
        if(result.getRowCount() == 0){
            throw new PermissionDeniedException(user,
                "User not authorized to view information about problem: " +
                        dr.getProperty("pid")==null?"?":dr.getProperty("pid"));
        }
        String divisionId = result.getItem(0,"contest_division_id").toString();

        dr = new Request();
        dr.setContentHandle("topProblemSolutions");
        dr.setProperty("pm", String.valueOf(problemId));
        dr.setProperty("dn", divisionId);
        Map dwMap = dwAccess.getData(dr);
        if(map == null)
            throw new ScreeningException("getData failed!");

        String code = (String)result.getItem(0,"submission_text").getResultData();
        if (code==null) {
            code = (String)result.getItem(0,"compilation_text").getResultData();
        }
        this.setCode(code);
        this.setTestResults((ResultSetContainer)map.get("systemTestResults"));
        //consider doing this better, ie, limit the results in the db.
        this.setTopTCSolutions(((List)dwMap.get("topProblemSolutions")).subList(0,3));
        this.setHandle(result.getItem(0,"handle").toString());
        this.setUserId(((Long)result.getItem(0,"user_id").getResultData()).longValue());
        this.setProfileName(result.getItem(0,"session_profile_desc").toString());
        this.setTestSetAName(result.getItem(0,"round_name").toString());
        this.setStatusId(((Integer)result.getItem(0, "status_id").getResultData()).intValue());

    }

    public boolean isSubmitted() {
        return Arrays.binarySearch(DONE_STATUSES, getStatusId())>=0;
    }

    public boolean isCompiled() {
        return getStatusId() == COMPILED;
    }

    /** Getter for property code.
     * @return Value of property code.
     */
    public String getCode() {
        return this.code;
    }

    /** Setter for property code.
     * @param code New value of property code.
     */
    public void setCode(String code) {
        this.code = code;
    }

    /** Getter for property testResults.
     * @return Value of property testResults.
     */
    public ResultSetContainer getTestResults() {
        return this.testResults;
    }

    /** Setter for property testResults.
     * @param testResults New value of property testResults.
     */
    public void setTestResults(ResultSetContainer testResults) {
        this.testResults = testResults;
    }

    /** Getter for property topTCSolutions.
     * @return Value of property topTCSolutions.
     */
    public List getTopTCSolutions() {
        return this.topTCSolutions;
    }

    /** Setter for property topTCSolutions.
     * @param topTCSolutions New value of property topTCSolutions.
     */
    public void setTopTCSolutions(List topTCSolutions) {
        this.topTCSolutions = topTCSolutions;
    }

    public String getHandle() {
        return handle;
    }

    private void setHandle(String handle) {
        this.handle = handle;
    }

    public long getUserId() {
        return userId;
    }

    private void setUserId(long userId) {
        this.userId = userId;
    }

    public String getProfileName() {
        return profileName;
    }

    private void setProfileName(String profileName) {
        this.profileName = profileName;
    }

    public String getTestSetAName() {
        return testSetAName;
    }

    private void setTestSetAName(String testSetAName) {
        this.testSetAName = testSetAName;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

}
