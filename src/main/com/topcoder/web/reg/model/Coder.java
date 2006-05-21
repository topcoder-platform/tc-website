package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.Iterator;

/**
 * A class to hold coder data.
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Coder extends Base {

    private Long id;
    private Timestamp memberSince;
    private String quote;
    private CoderType coderType;
    private Country compCountry;
/*
    private HSAlgoRating hsRating;
    private TCAlgoRating tcRating;
*/
    private CurrentSchool currentSchool;
    private Set resumes;
    private User user;
    private Set createdSchools;
    private Set teams;

    public Coder() {
        this.resumes = new HashSet();
        this.teams = new HashSet();
        this.createdSchools = new HashSet();
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Timestamp getMemberSince() {
        return memberSince;
    }

    public void setMemberSince(Timestamp memberSince) {
        this.memberSince = memberSince;
    }

    public String getQuote() {
        return quote;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }


    public Country getCompCountry() {
        return compCountry;
    }

    public void setCompCountry(Country compCountry) {
        this.compCountry = compCountry;
    }

/*
    public HSAlgoRating getHSRating() {
        return hsRating;
    }

    public void setHSRating(HSAlgoRating hsRating) {
        this.hsRating = hsRating;
    }

    public TCAlgoRating getTCRating() {
        return tcRating;
    }

    public void setTCRating(TCAlgoRating tcRating) {
        this.tcRating = tcRating;
    }
*/

    public CoderType getCoderType() {
        return coderType;
    }

    public void setCoderType(CoderType coderType) {
        this.coderType = coderType;
    }

    public CurrentSchool getCurrentSchool() {
        return currentSchool;
    }

    public void setCurrentSchool(CurrentSchool currentSchool) {
        this.currentSchool = currentSchool;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set getResumes() {
        return Collections.unmodifiableSet(resumes);
    }

    public void setResumes(Set resumes) {
        this.resumes = resumes;
    }

    public void addResume(Resume resume) {
        this.resumes.add(resume);
    }

    public Set getCreatedSchools() {
        return Collections.unmodifiableSet(createdSchools);
    }

    public void setCreatedSchools(Set createdSchools) {
        this.createdSchools = createdSchools;
    }

    public void addCreatedSchool(School s) {
        this.createdSchools.add(s);
    }

    public Set getTeams() {
        return Collections.unmodifiableSet(teams);
    }

    public void setTeams(Set teams) {
        this.teams = teams;
    }

    public void addTeam(Team t) {
        this.teams.add(t);
    }

    public void removeTeam(Team t) {
        this.teams.remove(t);
    }

    public Team getHighSchoolTeam() {
        Team t;
        Team ret = null;
        for(Iterator it = teams.iterator(); it.hasNext();) {
            t = (Team)it.next();
            if (t.getType().getId().equals(TeamType.HIGH_SCHOOL_TYPE)) {
                ret = t;
            }
        }
        return ret;
    }


}
