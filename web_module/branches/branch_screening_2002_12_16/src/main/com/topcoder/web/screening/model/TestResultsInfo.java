package com.topcoder.web.screening.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

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
    
}
