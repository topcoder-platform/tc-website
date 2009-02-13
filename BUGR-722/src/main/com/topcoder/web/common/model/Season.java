package com.topcoder.web.common.model;

import java.sql.Timestamp;

/**
 * @author cucu
 */
public class Season extends Base {

    private Integer id;
    private Timestamp startDate;
    private Timestamp endDate;
    private String name;
    private Integer typeId;
    private Event event;
    
    public static final Integer TC_SEASON = new Integer(1);
    public static final Integer HS_SEASON = new Integer(2);

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
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
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
