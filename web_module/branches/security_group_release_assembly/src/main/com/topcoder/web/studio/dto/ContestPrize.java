package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

/**
 * @author cucu
 */
public class ContestPrize extends Base {

    public static final Integer CONTEST_PRIZE_INTRO_EVENT_WEEKLY = 12;
    public static final Integer CONTEST_PRIZE_INTRO_EVENT_OVERALL = 13;

    protected Long id = null;
    protected Contest contest = null;
    protected Integer prizeTypeId = null;
    protected Integer place = null;
    protected Double amount = null;
    protected String description = null;

    public ContestPrize() {
    }

    public ContestPrize(Integer place, Integer prizeTypeId, Double amount) {
        super();
        this.place = place;
        this.prizeTypeId = prizeTypeId;
        this.amount = amount;
    }

    public Double getAmount() {
        return amount;
    }
    public void setAmount(Double amount) {
        this.amount = amount;
    }
    public Contest getContest() {
        return contest;
    }
    public void setContest(Contest contest) {
        this.contest = contest;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public Integer getPlace() {
        return place;
    }
    public void setPlace(Integer place) {
        this.place = place;
    }
    public Integer getPrizeTypeId() {
        return prizeTypeId;
    }
    public void setPrizeTypeId(Integer prizeTypeId) {
        this.prizeTypeId = prizeTypeId;
    }


}
