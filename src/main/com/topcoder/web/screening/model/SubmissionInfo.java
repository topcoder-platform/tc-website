package com.topcoder.web.screening.model;

import java.util.List;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * Bean for holding info about a coder's submission.
 * @author Porgery
 */
public class SubmissionInfo implements java.io.Serializable {
    
    /** Holds value of property code. */
    private String code;    
    
    /** Holds value of property testResults. */
    private ResultSetContainer testResults;
    
    /** Holds value of property topTCSolutions. */
    private List topTCSolutions;
    
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
    
}
