package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.util.*;
import com.topcoder.servlet.request.*;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
/**
 *
 * @author  rfairfax
 */
public class PlacementConfigInfo implements Serializable {
    
    private int userID;
    private String handle;
    private String name;
    private String presentedBy;
    private String presentedByEmail;
    private HashMap skillGroups;
    private ResultSetContainer problems;
    
    public PlacementConfigInfo() {
        userID = 0;
        handle = "";
        name = "";
        presentedBy = "";
        presentedByEmail = "";
        skillGroups = new HashMap();
    }
    
    public void setProblems(ResultSetContainer problems) {
        this.problems = problems;
    }
    
    public ResultSetContainer getProblems() {
        return problems;
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
    
    public int getSkillRating(Skill s) {
        Iterator i = skillGroups.values().iterator();
        while(i.hasNext()) {
            Map m = (Map)i.next();
            if(m.containsKey(s)) {
                return ((Integer)m.get(s)).intValue();
            }
        }
        
        return -1;
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
