package com.topcoder.web.screening.model;

public class ProblemInfo extends BaseModel {
    private String problemName;
    private String divisionDesc;
    private String difficultyDesc;
    private String accuracy;
    private String categoryDesc;
    private String problemStatement;

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
}
