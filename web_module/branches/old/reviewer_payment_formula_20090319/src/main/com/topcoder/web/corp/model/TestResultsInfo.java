package com.topcoder.web.corp.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Map;

/**
 * Bean for holding info about the results of a testing session.
 * @author  Porgery
 */
public class TestResultsInfo implements java.io.Serializable {

    /** Holds value of property problemSetAResults. */
    private ResultSetContainer problemSetAResults;

    /** Holds value of property problemSetBResults. */
    private ResultSetContainer problemSetBResults;

    /** Holds value of property problemSetATCStats. */
    private ResultSetContainer problemSetATCStats;

    private ResultSetContainer problemSetBStats;

    private Map problemSetBPercentile;
    private Map problemSetAPercentile;
    
    private Map problemSetAGraphData;
    private Map problemSetAGraphDataCompany;
    private Map problemSetBGraphData;

    /** Holds value of property sessionId. */
    private long sessionId;

    /** Holds value of property sessionComplete. */
    private boolean sessionComplete;

    /** Holds value of property problemSetBCount. */
    private int problemSetBCount;

    public ResultSetContainer getProblemSetBStats() {
        return problemSetBStats;
    }

    public void setProblemSetBStats(ResultSetContainer rsc) {
        problemSetBStats = rsc;
    }
    
    public Map getProblemSetAGraphData() {
        return problemSetAGraphData;
    }

    public void setProblemSetAGraphData(Map a) {
        problemSetAGraphData = a;
    }
    
    public Map getProblemSetAGraphDataCompany() {
        return problemSetAGraphDataCompany;
    }

    public void setProblemSetAGraphDataCompany(Map a) {
        problemSetAGraphDataCompany = a;
    }
    
    public Map getProblemSetBGraphData() {
        return problemSetBGraphData;
    }

    public void setProblemSetBGraphData(Map a) {
        problemSetBGraphData = a;
    }

    public Map getProblemSetBPrecentiles() {
        return problemSetBPercentile;
    }

    public void setProblemSetBPercentiles(Map a) {
        problemSetBPercentile = a;
    }
    
    public Map getProblemSetAPrecentiles() {
        return problemSetAPercentile;
    }

    public void setProblemSetAPercentiles(Map a) {
        problemSetAPercentile = a;
    }

    /** Getter for property problemSetAResults.
     * @return Value of property problemSetAResults.
     */

    public ResultSetContainer getProblemSetAResults() {
        return this.problemSetAResults;
    }

    /** Setter for property problemSetAResults.
     * @param problemSetAResults New value of property problemSetAResults.
     */
    public void setProblemSetAResults(ResultSetContainer problemSetAResults) {
        this.problemSetAResults = problemSetAResults;
    }

    /** Getter for property problemSetBResults.
     * @return Value of property problemSetBResults.
     */
    public ResultSetContainer getProblemSetBResults() {
        return this.problemSetBResults;
    }

    /** Setter for property problemSetBResults.
     * @param problemSetBResults New value of property problemSetBResults.
     */
    public void setProblemSetBResults(ResultSetContainer problemSetBResults) {
        this.problemSetBResults = problemSetBResults;
    }

    /** Getter for property problemSetATCStats.
     * @return Value of property problemSetATCStats.
     */
    public ResultSetContainer getProblemSetATCStats() {
        return this.problemSetATCStats;
    }

    /** Setter for property problemSetATCStats.
     * @param problemSetATCStats New value of property problemSetATCStats.
     */
    public void setProblemSetATCStats(ResultSetContainer problemSetATCStats) {
        this.problemSetATCStats = problemSetATCStats;
    }

    /** Getter for property sessionId.
     * @return Value of property sessionId.
     */
    public long getSessionId() {
        return this.sessionId;
    }

    /** Setter for property sessionId.
     * @param sessionId New value of property sessionId.
     */
    public void setSessionId(long sessionId) {
        this.sessionId = sessionId;
    }

    /** Getter for property sessionComplete.
     * @return Value of property sessionComplete.
     */
    public boolean isSessionComplete() {
        return this.sessionComplete;
    }

    /** Setter for property sessionComplete.
     * @param sessionComplete New value of property sessionComplete.
     */
    public void setSessionComplete(boolean sessionComplete) {
        this.sessionComplete = sessionComplete;
    }

    /** Getter for property problemSetBCount.
     * @return Value of property problemSetBCount.
     */
    public int getProblemSetBCount() {
        return this.problemSetBCount;
    }

    /** Setter for property problemSetBCount.
     * @param problemSetBCount New value of property problemSetBCount.
     */
    public void setProblemSetBCount(int problemSetBCount) {
        this.problemSetBCount = problemSetBCount;
    }

}
