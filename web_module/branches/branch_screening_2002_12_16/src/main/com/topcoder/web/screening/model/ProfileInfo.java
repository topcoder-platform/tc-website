package com.topcoder.web.screening.model;

import java.util.HashSet;
import java.util.ArrayList;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public class ProfileInfo extends BaseModel {
    private Long profileId;
    private String profileName;
    private Long testSetA;
    private ResultSetContainer problemSetList;
    private ResultSetContainer testSetAList;
    private ResultSetContainer testSetBList;
    private ResultSetContainer companyProblemList;
    private ResultSetContainer languageList;
    private HashSet testSetB;
    private ArrayList language;


    public ProfileInfo()
    {
        profileName = "";
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
    public void setTestSetAList( ResultSetContainer val )
    {
        testSetAList = val;
    }

    /**
     * Gets the value of <code>testSetAList</code>.
     *
     * @return 
     */
    public ResultSetContainer getTestSetAList()
    {
        return testSetAList;
    }

    /**
     * Sets the value of <code>testSetBList</code>.
     *
     * @param testSetBList
     */
    public void setTestSetBList( ResultSetContainer val )
    {
        testSetBList = val;
    }

    /**
     * Gets the value of <code>testSetBList</code>.
     *
     * @return 
     */
    public ResultSetContainer getTestSetBList()
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
        if(testSetB == null) return;
        for(int i = 0; i < testSetBArray.length; ++i)
        {
            testSetB.add(new Long(testSetBArray[i]));
        }
    }

    public void addTestSetB(String aTestSetB)
    {
        if(aTestSetB == null) return;
        testSetB.add(new Long(aTestSetB));
    }

    public void removeTestSetB(String aTestSetB)
    {
        if(aTestSetB == null) return;
        testSetB.remove(new Long(aTestSetB));
    }

    public Long[] getTestSetB()
    {
        return (Long [])testSetB.toArray(new Long [testSetB.size()]);
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
        return (Long [])language.toArray(new Long [testSetB.size()]);
    }

    public boolean isSelectedTestSetA(String aRoundId)
    {
        if(aRoundId == null) return false;
        return testSetA.equals(new Long(aRoundId));
    }

    public boolean hasLanguage(String aLanguageId) {
        if(aLanguageId == null) return false;
        return language.contains(new Long(aLanguageId));
    }
}
