package com.topcoder.web.common.model.algo;

import com.topcoder.web.common.model.Base;

/**
 * @author cucu
 */
public class Round extends Base {

    protected Long id = null;
    protected Contest contest = null;
    protected String name = null;
    protected String shortName = null;
    protected String status = null;

    public Contest getContest() {
        return contest;
    }
    public void setContest(Contest contest) {
        this.contest = contest;
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
    public String getShortName() {
        return shortName;
    }
    public void setShortName(String shortName) {
        this.shortName = shortName;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }


}
