package com.topcoder.web.screening.model;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.HashSet;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;

public class ProblemInfo extends BaseModel {
    private static CachedDataAccess access;

    private String problemName;
    private String divisionDesc;
    private String difficultyDesc;
    private String accuracy;
    private String categoryDesc;
    private String problemStatement;
    private Long roundId;
    private Long problemId;
    private HashSet algorithmicCategories;
    private HashSet businessCategories;

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
     * Sets the value of <code>accuracy</code>.
     *
     * @param accuracy
     */
    public void setAccuracy( String val )
    {
        accuracy = val;
    }

    /**
     * Gets the value of <code>accuracy</code>.
     *
     * @return 
     */
    public String getAccuracy()
    {
        return accuracy;
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

        if(access == null) {
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource)
                PortableRemoteObject.narrow(
                        context.lookup(Constants.DATA_SOURCE),
                                            DataSource.class);

            access = new CachedDataAccess(ds);
        }

        Request problemDetail = new Request();
        problemDetail.setProperty(DataAccessConstants.COMMAND,
                Constants.PROBLEM_DETAIL_COMMAND);

        problemDetail.setProperty("pid", String.valueOf(problemId));
        problemDetail.setProperty("rid", String.valueOf(roundId));
        problemDetail.setProperty("uid", String.valueOf(user.getId()));
        Map map = access.getData(problemDetail);
        ResultSetContainer rsc = (ResultSetContainer)
                    map.get(Constants.PROBLEM_INFO_QUERY_KEY);
        if(rsc.size() == 0) {
            throw new ScreeningException(
                    "Data error, user may not be allowed to view problem");
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
        info.setDivisionDesc(row.getItem("division_desc").toString());
        info.setDifficultyDesc(row.getItem("difficulty_desc").toString());
        info.setAccuracy(row.getItem("accuracy").toString());
        info.setProblemStatement(row.getItem("problem_statement").toString());

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

        return info;
    }
}
