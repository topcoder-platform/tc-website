package com.topcoder.web.screening.model;

import java.util.HashSet;
import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public class ProfileInfo extends BaseModel {
    private Long profileId;
    private String profileName;
    private Long testSetA;
    private ResultSetContainer problemSetList;
    private List testSetAList;
    private List testSetBList;
    private ResultSetContainer companyProblemList;
    private ResultSetContainer languageList;
    private HashSet testSetB;
    private ArrayList language;
    private String testSetAName;    

    public ProfileInfo()
    {
        profileName = "";
        testSetAName = "";
        testSetB = new HashSet();
        language = new ArrayList();
    }

    /**
     * Sets the value of <code>profileId</code>.
     *
     * @param profileId
     */
    public void setProfileId( Long val )
    {
        profileId = val;
    }

    /**
     * Gets the value of <code>profileId</code>.
     *
     * @return 
     */
    public Long getProfileId()
    {
        return profileId;
    }

    /**
     * Sets the value of <code>profileName</code>.
     *
     * @param profileName
     */
    public void setProfileName( String val )
    {
        profileName = val;
    }

    /**
     * Gets the value of <code>profileName</code>.
     *
     * @return 
     */
    public String getProfileName()
    {
        return profileName;
    }

    /**
     * Sets the value of <code>testSetA</code>.
     *
     * @param testSetA
     */
    public void setTestSetA( String val )
    {
        if(val == null) return;
        testSetA = new Long(val);
    }

    /**
     * Sets the value of <code>testSetA</code>.
     *
     * @param testSetA
     */
    public void setTestSetA( Long val )
    {
        testSetA = val;
    }

    /**
     * Gets the value of <code>testSetA</code>.
     *
     * @return 
     */
    public Long getTestSetA()
    {
        return testSetA;
    }

    /**
     * Sets the value of <code>problemSetList</code>.
     *
     * @param problemSetList
     */
    public void setProblemSetList( ResultSetContainer val )
    {
        problemSetList = val;
    }

    /**
     * Gets the value of <code>problemSetList</code>.
     *
     * @return 
     */
    public ResultSetContainer getProblemSetList()
    {
        return problemSetList;
    }

    /**
     * Sets the value of <code>testSetAList</code>.
     *
     * @param testSetAList
     */
    public void setTestSetAList( List val )
    {
        testSetAList = val;
    }

    /**
     * Gets the value of <code>testSetAList</code>.
     *
     * @return 
     */
    public List getTestSetAList()
    {
        return testSetAList;
    }

    /**
     * Sets the value of <code>testSetBList</code>.
     *
     * @param testSetBList
     */
    public void setTestSetBList( List val )
    {
        testSetBList = val;
    }

    /**
     * Gets the value of <code>testSetBList</code>.
     *
     * @return 
     */
    public List getTestSetBList()
    {
        return testSetBList;
    }

    /**
     * Sets the value of <code>companyProblemList</code>.
     *
     * @param companyProblemList
     */
    public void setCompanyProblemList( ResultSetContainer val )
    {
        companyProblemList = val;
    }

    /**
     * Gets the value of <code>companyProblemList</code>.
     *
     * @return 
     */
    public ResultSetContainer getCompanyProblemList()
    {
        return companyProblemList;
    }

    /**
     * Sets the value of <code>languageList</code>.
     *
     * @param languageList
     */
    public void setLanguageList( ResultSetContainer val )
    {
        languageList = val;
    }

    /**
     * Gets the value of <code>languageList</code>.
     *
     * @return 
     */
    public ResultSetContainer getLanguageList()
    {
        return languageList;
    }

    public void addTestSetB(String[] testSetBArray)
    {
        if(testSetBArray == null) return;
        for(int i = 0; i < testSetBArray.length; ++i)
        {
            testSetB.add(testSetBArray[i]);
        }
    }

    public void addTestSetB(String aTestSetB)
    {
        if(aTestSetB == null) return;
        testSetB.add(aTestSetB);
    }

    public void removeTestSetB(String aTestSetB)
    {
        if(aTestSetB == null) return;
        testSetB.remove(aTestSetB);
    }

    public String[] getTestSetB()
    {
        return (String [])testSetB.toArray(new String [testSetB.size()]);
    }

    public void addLanguage(String[] languages)
    {
        if(languages == null) return;
        for(int i = 0; i < languages.length; ++i)
        {
            language.add(new Long(languages[i]));
        }
    }

    public void addLanguage(String aLanguage) {
        if(aLanguage == null) return;
        language.add(new Long(aLanguage));
    }

    public Long[] getLanguage()
    {
        return (Long [])language.toArray(new Long [language.size()]);
    }

    public boolean isSelectedTestSetA(String aRoundId)
    {
        if(aRoundId == null || testSetA == null) return false;
        return testSetA.equals(new Long(aRoundId));
    }

    public boolean hasLanguage(String aLanguageId) {
        if(aLanguageId == null) return false;
        return language.contains(new Long(aLanguageId));
    }
    
    /** Getter for property testSetAName.
     * @return Value of property testSetAName.
     */
    public String getTestSetAName() {
        return this.testSetAName;
    }

    /** Setter for property testSetAName.
     * @param testSetAName New value of property testSetAName.
     */
    public void setTestSetAName(String testSetAName) {
        this.testSetAName = testSetAName;
    }
}
