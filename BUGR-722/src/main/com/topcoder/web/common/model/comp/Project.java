package com.topcoder.web.common.model.comp;

import com.topcoder.web.common.model.Base;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Project extends Base {

    public static final Integer STATUS_ACTIVE = 1;
    public static final Integer STATUS_INACTIVE = 2;
    public static final Integer STATUS_DELETED = 3;
    public static final Integer STATUS_FAILED_REVIEW = 4;
    public static final Integer STATUS_FAILED_SCREENING = 5;
    public static final Integer STATUS_ZERO_SUBMISSIONS = 6;
    public static final Integer STATUS_COMPLETED = 7;

    public static final Integer INFO_TYPE_PROJECT_NAME = 6;
    public static final Integer INFO_TYPE_PROJECT_VERSION = 7;
    public static final Integer INFO_TYPE_PROJECT_ELIGIBILITY = 14;

    public static final String ELIGIBILITY_OPEN = "Open";

    protected Integer id = null;
    protected Integer statusId = null;
    protected Integer categoryId = null;
    protected Map<Integer, ProjectInfo> info = new HashMap<Integer, ProjectInfo>();
    protected Map<Integer, ProjectPhase> phases = new HashMap<Integer, ProjectPhase>();
    protected Set<Contest> contests = new HashSet<Contest>();

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Map<Integer, ProjectInfo> getInfo() {
        return info;
    }

    public void setInfo(Map<Integer, ProjectInfo> info) {
        this.info = info;
    }

    public String getInfo(Integer id) {
        return info.get(id).getValue();
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public Set<Contest> getContests() {
        return contests;
    }

    public void setContests(Set<Contest> contests) {
        this.contests = contests;
    }

    public void addContest(Contest contest) {
        contests.add(contest);
    }

    public void removeContest(Contest contest) {
        contests.remove(contest);
    }

    public String getProjectName() {
        return getInfo(INFO_TYPE_PROJECT_NAME);
    }

    public String getProjectVersion() {
        return getInfo(INFO_TYPE_PROJECT_VERSION);
    }

    public String getProjectEligibility() {
        return getInfo(INFO_TYPE_PROJECT_ELIGIBILITY);
    }

    public boolean isEligibilityOpen() {
        return ELIGIBILITY_OPEN.equals(getProjectEligibility());
    }

    public Map<Integer, ProjectPhase> getPhases() {
        return phases;
    }

    public void setPhases(Map<Integer, ProjectPhase> phases) {
        this.phases = phases;
    }

    public ProjectPhase getPhase(Integer phaseTypeId) {
        return phases.get(phaseTypeId);
    }

    public ProjectPhase getRegistrationPhase() {
        return getPhase(ProjectPhase.REGISTRATION);
    }

}
