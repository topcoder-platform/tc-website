package com.topcoder.web.corp.model;

import java.util.HashSet;
import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.model.BaseModel;

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
    private ResultSetContainer sessionList;
    private boolean hasTestSetA;

    private static Logger log = Logger.getLogger(ProfileInfo.class);

    public ProfileInfo() {
        profileName = "";
        testSetAName = "";
        testSetB = new HashSet();
        language = new ArrayList();
    }

    /**
     * Sets the value of <code>profileId</code>.
     *
     * @param val
     */
    public void setProfileId(Long val) {
        profileId = val;
    }

    /**
     * Gets the value of <code>profileId</code>.
     *
     * @return
     */
    public Long getProfileId() {
        return profileId;
    }

    /**
     * Sets the value of <code>profileName</code>.
     *
     * @param val
     */
    public void setProfileName(String val) {
        profileName = val;
    }

    /**
     * Gets the value of <code>profileName</code>.
     *
     * @return
     */
    public String getProfileName() {
        return profileName;
    }

    /**
     * Sets the value of <code>testSetA</code>.
     *
     * @param val
     */
    public void setTestSetA(String val) {
        log.debug("testseta set to : " + val);
        if (val == null) return;
        testSetA = new Long(val);
    }

    /**
     * Sets the value of <code>testSetA</code>.
     *
     * @param val
     */
    public void setTestSetA(Long val) {
        testSetA = val;
    }

    /**
     * Gets the value of <code>testSetA</code>.
     *
     * @return
     */
    public Long getTestSetA() {
        return testSetA;
    }

    /**
     * Sets the value of <code>problemSetList</code>.
     *
     * @param val
     */
    public void setProblemSetList(ResultSetContainer val) {
        problemSetList = val;
    }

    /**
     * Gets the value of <code>problemSetList</code>.
     *
     * @return
     */
    public ResultSetContainer getProblemSetList() {
        return problemSetList;
    }

    /**
     * Sets the value of <code>testSetAList</code>.
     *
     * @param val
     */
    public void setTestSetAList(List val) {
        testSetAList = val;
    }

    /**
     * Gets the value of <code>testSetAList</code>.
     *
     * @return
     */
    public List getTestSetAList() {
        return testSetAList;
    }

    /**
     * Sets the value of <code>testSetBList</code>.
     *
     * @param val
     */
    public void setTestSetBList(List val) {
        testSetBList = val;
    }

    /**
     * Gets the value of <code>testSetBList</code>.
     *
     * @return
     */
    public List getTestSetBList() {
        return testSetBList;
    }

    /**
     * Sets the value of <code>companyProblemList</code>.
     *
     * @param val
     */
    public void setCompanyProblemList(ResultSetContainer val) {
        companyProblemList = val;
    }

    /**
     * Gets the value of <code>companyProblemList</code>.
     *
     * @return
     */
    public ResultSetContainer getCompanyProblemList() {
        return companyProblemList;
    }

    /**
     * Sets the value of <code>languageList</code>.
     *
     * @param val
     */
    public void setLanguageList(ResultSetContainer val) {
        languageList = val;
    }

    /**
     * Gets the value of <code>languageList</code>.
     *
     * @return
     */
    public ResultSetContainer getLanguageList() {
        return languageList;
    }

    public void addTestSetB(String[] testSetBArray) {
        if (testSetBArray == null) return;
        for (int i = 0; i < testSetBArray.length; ++i) {
            testSetB.add(testSetBArray[i]);
        }
    }

    public void addTestSetB(String aTestSetB) {
        if (aTestSetB == null) return;
        testSetB.add(aTestSetB);
    }

    public void removeTestSetB(String aTestSetB) {
        if (aTestSetB == null) return;
        testSetB.remove(aTestSetB);
    }

    public String[] getTestSetB() {
        return (String[]) testSetB.toArray(new String[testSetB.size()]);
    }

    public void addLanguage(String[] languages) {
        if (languages == null) return;
        for (int i = 0; i < languages.length; ++i) {
            language.add(new Long(languages[i]));
        }
    }

    public void addLanguage(String aLanguage) {
        if (aLanguage == null) return;
        language.add(new Long(aLanguage));
    }

    public Long[] getLanguage() {
        return (Long[]) language.toArray(new Long[language.size()]);
    }

    public boolean isSelectedTestSetA(String aRoundId) {
        if (aRoundId == null || testSetA == null) return false;
        return testSetA.equals(new Long(aRoundId));
    }

    public boolean hasLanguage(String aLanguageId) {
        if (aLanguageId == null) return false;
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

    public ResultSetContainer getSessionList() {
        return sessionList;
    }

    public void setSessionList(ResultSetContainer sessionList) {
        this.sessionList = sessionList;
    }

    public boolean hasTestSetA() {
        return hasTestSetA;
    }

    public void setHasTestSetA(boolean hasTestSetA) {
        this.hasTestSetA = hasTestSetA;
    }


}
