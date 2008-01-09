package com.topcoder.web.common.model.comp;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Event;

/**
 * @author cucu
*/
public class Contest extends Base {

    public final static Integer TYPE_INTRO_EVENT_OVERALL = new Integer(22);
    public final static Integer TYPE_INTRO_EVENT_WEEKLY = new Integer(23);


    protected Long id = null;
    protected String name = null;
    protected Integer phaseId = null;
    protected Integer typeId = null;
    protected Timestamp startDate = null;
    protected Timestamp endDate = null;
    protected Event event;
    protected Set<ContestPrize> prizes = new HashSet<ContestPrize>();
    protected Set<Project> projects = new HashSet<Project>();

    public Timestamp getEndDate() {
        return endDate;
    }
    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }
    public Event getEvent() {
        return event;
    }
    public void setEvent(Event event) {
        this.event = event;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Integer getPhaseId() {
        return phaseId;
    }
    public void setPhaseId(Integer phaseId) {
        this.phaseId = phaseId;
    }
    public Timestamp getStartDate() {
        return startDate;
    }
    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }
    public Integer getTypeId() {
        return typeId;
    }
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }
    public Set<ContestPrize> getPrizes() {
        return prizes;
    }
    public void setPrizes(Set<ContestPrize> prizes) {
        this.prizes = prizes;
    }
    public void addPrize(ContestPrize p) {
        prizes.add(p);
    }
    public Set<Project> getProjects() {
        return projects;
    }
    public void setProjects(Set<Project> projects) {
        this.projects = projects;
    }

    public void addProject(Project project) {
        projects.add(project);
    }


}
