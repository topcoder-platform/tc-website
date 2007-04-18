package com.topcoder.web.common.model.comp;

import java.sql.Timestamp;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Event;

/**
 * @author cucu
= */
@SuppressWarnings("serial")
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


}
