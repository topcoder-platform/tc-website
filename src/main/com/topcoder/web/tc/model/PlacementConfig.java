/*
 * PlacementConfig.java
 *
 * Created on February 1, 2005, 12:12 PM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.util.*;
import com.topcoder.servlet.request.*;

import com.topcoder.servlet.request.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.language.Language;
/**
 *
 * @author rfairfax
 */
public class PlacementConfig implements Serializable {
    
    private int userID;
    private String handle;
    private String name;
    private String presentedBy;
    private String presentedByEmail;
    private HashMap skillGroups;
    
    private int rating;
    private String rank;
    private String rankPercentile;
    private UploadedFile companyLogo;
    private String totalChallenged;
    private String challengeSuccessRatio;
    private String submissionRatio;
    private String submissionSuccessRatio;
    private Problem problem;
    private String problemName;
    private String avgTimeToSubmit;
    private String submissionTime;
    private String submissionPercent;
    private String successfulSubmissionPercent;
    private Language lang;
    private String submissionText;
    private String numContests;
    
    public PlacementConfig() {
        userID = 0;
        handle = "";
        name = "";
        presentedBy = "";
        presentedByEmail = "";
        skillGroups = new HashMap();
        companyLogo = null;
        rating = 0;
        rank = "";
        rankPercentile = "";
        totalChallenged = "";
        challengeSuccessRatio = "";
        submissionRatio = "";
        submissionSuccessRatio = "";
        problem = null;
        problemName = "";
        avgTimeToSubmit = "";
        submissionTime = "";
        submissionPercent = "";
        successfulSubmissionPercent = "";
        lang = null;
        submissionText = "";
        numContests = "";
    }
    
    public void setNumContests(String s) {
        numContests = s;
    }
    
    public String getNumContests() {
        return numContests;
    }
    
    public void setSubmissionText(String s) {
        submissionText = s;
    }
    
    public String getSubmissionText() {
        return submissionText;
    }
    
    public void setLanguage(Language l) {
        lang = l;
    }
    
    public Language getLanguage() {
        return lang;
    }
    
    public void setSuccessfulSubmissionPercent(String s) {
        successfulSubmissionPercent = s;
    }
    
    public String getSuccessfulSubmissionPercent() {
        return successfulSubmissionPercent;
    }
    
    public void setSubmissionPercent(String s) {
        submissionPercent = s;
    }
    
    public String getSubmissionPercent() {
        return submissionPercent;
    }
    
    public void setSubmissionTime(String s) {
        submissionTime = s;
    }
    
    public String getSubmissionTime() {
        return submissionTime;
    }
    
    public void setAvgTimeToSubmit(String s) {
        avgTimeToSubmit = s;
    }
    
    public String getAvgTimeToSubmit() {
        return avgTimeToSubmit;
    }
    
    public void setProblemName(String s) {
        problemName = s;
    }
    
    public String getProblemName() {
        return problemName;
    }
    
    public void setProblem(Problem p) {
        problem = p;
    }
    
    public Problem getProblem() {
        return problem;
    }
    
    public void setSubmissionSuccessRatio(String s) {
        submissionSuccessRatio = s;
    }
    
    public String getSubmissionSuccessRatio() {
        return submissionSuccessRatio;
    }
    
    public void setSubmissionRatio(String s) {
        submissionRatio = s;
    }
    
    public String getSubmissionRatio() {
        return submissionRatio;
    }
    
    public void setChallengeSuccessRatio(String s) {
        challengeSuccessRatio = s;
    }
    
    public String getChallengeSuccessRatio() {
        return challengeSuccessRatio;
    }
    
    public void setTotalChallenged(String s) {
        totalChallenged = s;
    }
    
    public String getTotalChallenged() {
        return totalChallenged;
    }
    
    public void setRankPercentile(String s) {
        rankPercentile = s;
    }
    
    public String getRankPercentile() {
        return rankPercentile;
    }
    
    public void setRank(String s) {
        rank = s;
    }
    
    public String getRank() {
        return rank;
    }
    
    public void setRating(int r) {
        rating = r;
    }
    
    public int getRating() {
        return rating;
    }
    
    public void setCompanyLogo(UploadedFile file) {
        companyLogo = file;
    }
    
    public UploadedFile getCompanyLogo() {
        return companyLogo;
    }
    
    public List getSkillGroups() {
        ArrayList al = new ArrayList();
        
        Iterator i = skillGroups.keySet().iterator();
        while(i.hasNext()) {
            String s = (String)i.next();
            al.add(s);
        }
        
        return al;
    }
    
    public List getSkills(String group) {
        ArrayList al = new ArrayList();
        
        Map groupMap = (Map)skillGroups.get(group);
        
        Iterator i = groupMap.keySet().iterator();
        while(i.hasNext()) {
            Skill s = (Skill)i.next();
            al.add(s);
        }
        
        return al;
    }
    
    public void createSkillGroup(String group) {
        if(!hasSkillGroup(group)) {
            skillGroups.put(group, new HashMap());
        }
    }
    
    public boolean hasSkillGroup(String group) {
        return skillGroups.keySet().contains(group);
    }
    
    public Map getSkillGroup(String group) {
        return (Map)skillGroups.get(group);
    }
    
    public void createSkill(String group, Skill skill, int rating) {
        if(!hasSkillGroup(group)) {
            createSkillGroup(group);
        }
        
        Map grp = getSkillGroup(group);
        
        grp.put(skill, new Integer(rating));
    }
    
    public void setPresentedBy(String p) {
        presentedBy = p;
    }
    
    public String getPresentedBy() {
        return presentedBy;
    }
    
    public void setPresentedByEmail(String p) {
        presentedByEmail = p;
    }
    
    public String getPresentedByEmail() {
        return presentedByEmail;
    }
    
    public void setHandle(String h) {
        handle = h;
    }
    
    public String getHandle() {
        return handle;
    }
    
    public void setName(String n) {
        name = n;
    }
    
    public String getName() {
        return name;
    }
    
    public void setUserID(int i) {
        userID = i;
    }
    
    public int getUserID() {
        return userID;
    }
}
