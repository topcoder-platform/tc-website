package com.topcoder.web.creative.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.tc.controller.request.Terms;

import java.sql.Timestamp;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 27, 2006
 */
public class Contest extends Base {
    private Long id;
    private String name;
    private Terms terms;
    private Timestamp startTime;
    private Timestamp endTime;

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

    public Terms getTerms() {
        return terms;
    }

    public void setTerms(Terms terms) {
        this.terms = terms;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }
}
