package com.topcoder.web.common.model.algo;

import java.sql.Timestamp;

import com.topcoder.web.common.model.Base;

/**
 * @author cucu
 */
public class Contest extends Base {

    protected Long id = null;
    protected String name = null;
    protected Timestamp startDate = null;
    protected Timestamp endDate = null;
    protected String status = null;

    public Timestamp getEndDate() {
        return endDate;
    }
    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
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
    public Timestamp getStartDate() {
        return startDate;
    }
    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

}
