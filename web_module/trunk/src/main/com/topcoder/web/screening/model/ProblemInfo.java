package com.topcoder.web.screening.model;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.HashSet;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;

import com.topcoder.shared.util.logging.Logger;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.PermissionDeniedException;
import com.topcoder.web.screening.common.ScreeningException;

public class ProblemInfo extends BaseModel {
    private static Logger log = Logger.getLogger(ProblemInfo.class);

    private static DataAccessInt nonCached;
    private static DataAccessInt cached;
    private static DataAccessInt dwAccess;

    private String problemName;
    private String divisionDesc;
    private String difficultyDesc;
    private String categoryDesc;
    private String problemStatement;
    private Long roundId;
    private Long problemId;
    private String submissionAccuracy;
    private String submission;
    private String overallAccuracy;
    private HashSet algorithmicCategories;
    private HashSet businessCategories;
    private String roundName;    

    public ProblemInfo() {
        algorithmicCategories = new HashSet();
        businessCategories = new HashSet();
    }

    /**
     * Sets the value of <code>roundId</code>.
     *
     * @param roundId
     */
    public void setRoundId( Long val )
    {
        roundId = val;
    }

    /**
     * Gets the value of <code>roundId</code>.
     *
     * @return 
     */
    public Long getRoundId()
    {
        return roundId;
    }

    /**
     * Sets the value of <code>problemId</code>.
     *
     * @param problemId
     */
    public void setProblemId( Long val )
    {
        problemId = val;
    }

    /**
     * Gets the value of <code>problemId</code>.
     *
     * @return 
     */
    public Long getProblemId()
    {
        return problemId;
    }


    /**
     * Sets the value of <code>problemName</code>.
     *
     * @param problemName
     */
    public void setProblemName( String val )
    {
        problemName = val;
    }

    /**
     * Gets the value of <code>problemName</code>.
     *
     * @return 
     */
    public String getProblemName()
    {
        return problemName;
    }

    /**
     * Sets the value of <code>divisionDesc</code>.
     *
     * @param divisionDesc
     */
    public void setDivisionDesc( String val )
    {
        divisionDesc = val;
    }

    /**
     * Gets the value of <code>divisionDesc</code>.
     *
     * @return 
     */
    public String getDivisionDesc()
    {
        return divisionDesc;
    }

    /**
     * Sets the value of <code>difficultyDesc</code>.
     *
     * @param difficultyDesc
     */
    public void setDifficultyDesc( String val )
    {
        difficultyDesc = val;
    }

    /**
     * Gets the value of <code>difficultyDesc</code>.
     *
     * @return 
     */
    public String getDifficultyDesc()
    {
        return difficultyDesc;
    }

    /**
     * Sets the value of <code>categoryDesc</code>.
     *
     * @param categoryDesc
     */
    public void setCategoryDesc( String val )
    {
        categoryDesc = val;
    }

    /**
     * Gets the value of <code>categoryDesc</code>.
     *
     * @return 
     */
    public String getCategoryDesc()
    {
        return categoryDesc;
    }

    /**
     * Sets the value of <code>problemStatement</code>.
     *
     * @param problemStatement
     */
    public void setProblemStatement( String val )
    {
        problemStatement = val;
    }

    /**
     * Gets the value of <code>problemStatement</code>.
     *
     * @return 
     */
    public String getProblemStatement()
    {
        return problemStatement;
    }

    /**
     * Sets the value of <code>submissionAccuracy</code>.
     *
     * @param submissionAccuracy
     */
    public void setSubmissionAccuracy( String val )
    {
        submissionAccuracy = val;
    }

    /**
     * Gets the value of <code>submissionAccuracy</code>.
     *
     * @return 
     */
    public String getSubmissionAccuracy()
    {
        return submissionAccuracy;
    }

    /**
     * Sets the value of <code>submission</code>.
     *
     * @param submission
     */
    public void setSubmission( String val )
    {
        submission = val;
    }

    /**
     * Gets the value of <code>submission</code>.
     *
     * @return 
     */
    public String getSubmission()
    {
        return submission;
    }

    /**
     * Sets the value of <code>overallAccuracy</code>.
     *
     * @param overallAccuracy
     */
    public void setOverallAccuracy( String val )
    {
        overallAccuracy = val;
    }

    /**
     * Gets the value of <code>overallAccuracy</code>.
     *
     * @return 
     */
    public String getOverallAccuracy()
    {
        return overallAccuracy;
    }


    public void addAlgorithmicCategory(String category) {
        if(category == null) return;
        algorithmicCategories.add(category);
    }

    public String getAlgorithmicCategoryList() {
        return buildList(algorithmicCategories);
    }

    public String getBusinessCategoryList() {
        return buildList(businessCategories);
    }

    private String buildList(Collection c) {
        StringBuffer buffer = new StringBuffer("");
        for(Iterator i = c.iterator(); i.hasNext();) {
            buffer.append(i.next());

            if(i.hasNext()) {
                buffer.append(",");
            }
        }

        return buffer.toString();
    }

    public void addBusinessCategory(String category) {
        if(category == null) return;
        businessCategories.add(category);
    }

    public static ProblemInfo createProblemInfo(User user,
                                                long roundId, 
                                                long problemId) 
        throws Exception {
            
        log.debug("Getting problem info for round " + roundId + ", problem " + problemId);

        if(nonCached == null) {
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource)
                PortableRemoteObject.narrow(
                        context.lookup(Constants.DATA_SOURCE),
                                            DataSource.class);

            nonCached = new DataAccess(ds);
        }

        if(cached == null) {
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource)
                PortableRemoteObject.narrow(
                        context.lookup(Constants.DATA_SOURCE),
                                            DataSource.class);

            cached = new CachedDataAccess(ds);
        }

        if(dwAccess == null) {
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource)
                PortableRemoteObject.narrow(
                        context.lookup(Constants.DW_DATA_SOURCE),
                                       DataSource.class);

            dwAccess = new CachedDataAccess(ds);
        }

        //first check permissions on given problem
        Request checkAccess = new Request();
        checkAccess.setProperty(DataAccessConstants.COMMAND,
                Constants.CHECK_ACCESS_QUERY_KEY);
        checkAccess.setProperty("uid", String.valueOf(user.getId()));
        checkAccess.setProperty("rid", String.valueOf(roundId));
        Map map = nonCached.getData(checkAccess);
        ResultSetContainer rsc = (ResultSetContainer)
                    map.get(Constants.CHECK_ACCESS_QUERY_KEY);
        if(rsc.size() == 0) {
            throw new PermissionDeniedException(user, "user does not have access to round: " + String.valueOf(roundId));
        }


        Request problemDetail = new Request();
        problemDetail.setProperty(DataAccessConstants.COMMAND,
                Constants.PROBLEM_DETAIL_COMMAND);

        problemDetail.setProperty("pid", String.valueOf(problemId));
        problemDetail.setProperty("rid", String.valueOf(roundId));
        map = cached.getData(problemDetail);
        rsc = (ResultSetContainer)map.get(Constants.PROBLEM_INFO_QUERY_KEY);
        if(rsc.size() == 0) {
            throw new ScreeningException(
                    "Data error, Problem info query returned no rows");
        }
        if(rsc.size() > 1) {
            throw new ScreeningException(
                    "Data error, too many results(" + rsc.size() + ") - uid " + user.getId() + " - roundId " + roundId + " - problemId " + problemId);
        }

        ProblemInfo info = new ProblemInfo();
        ResultSetContainer.ResultSetRow row = 
            (ResultSetContainer.ResultSetRow)rsc.get(0);
        info.setProblemId(new Long(row.getItem("problem_id").toString()));
        info.setRoundId(new Long(row.getItem("round_id").toString()));
        info.setProblemName(row.getItem("name").toString());
        info.setRoundName(row.getItem("round_name").toString());
        info.setDivisionDesc(row.getItem("division_desc").toString());
        info.setDifficultyDesc(row.getItem("difficulty_desc").toString());
        info.setProblemStatement(row.getItem("problem_statement").toString());

        //need these for accuracy
        String contestRoundId = row.getItem("contest_round_id").toString();
        String divisionId = row.getItem("division_id").toString();

        rsc = (ResultSetContainer)
            map.get(Constants.PROBLEM_ALGORITHMIC_CATEGORY_QUERY_KEY);
        for(Iterator i = rsc.iterator(); i.hasNext();) {
            row = (ResultSetContainer.ResultSetRow)i.next();
            info.addAlgorithmicCategory(
                    row.getItem("category_name").toString());
        }

        rsc = (ResultSetContainer)
            map.get(Constants.PROBLEM_BUSINESS_CATEGORY_QUERY_KEY);
        for(Iterator i = rsc.iterator(); i.hasNext();) {
            row = (ResultSetContainer.ResultSetRow)i.next();
            info.addBusinessCategory(row.getItem("category_name").toString());
        }

        Request accuracyInfo = new Request();
        accuracyInfo.setProperty(DataAccessConstants.COMMAND,
                Constants.ACCURACY_INFO_QUERY_KEY);

        accuracyInfo.setProperty("pm", String.valueOf(problemId));
        accuracyInfo.setProperty("rd", contestRoundId);
        accuracyInfo.setProperty("dn", divisionId);
        map = dwAccess.getData(accuracyInfo);
        rsc = (ResultSetContainer)map.get(Constants.ACCURACY_INFO_QUERY_KEY);

        if(rsc.size() == 0) {
            throw new ScreeningException(
                    "Data error, accuracy info query returned no rows");
        }
        if(rsc.size() > 1) {
            throw new ScreeningException(
                    "Data error with accuracy, too many results(" + rsc.size() + ") - uid " + user.getId() + " - roundId " + roundId + " - problemId " + problemId);
        }


        row = (ResultSetContainer.ResultSetRow)rsc.get(0);
        info.setSubmissionAccuracy(row.getItem("submission_accuracy").toString());
        info.setSubmission(row.getItem("submission_percentage").toString());
        info.setOverallAccuracy(row.getItem("overall_accuracy").toString());

        return info;
    }
    
    /** Getter for property roundName.
     * @return Value of property roundName.
     */
    public String getRoundName() {
        return this.roundName;
    }
    
    /** Setter for property roundName.
     * @param roundName New value of property roundName.
     */
    public void setRoundName(String roundName) {
        this.roundName = roundName;
    }
    
}
