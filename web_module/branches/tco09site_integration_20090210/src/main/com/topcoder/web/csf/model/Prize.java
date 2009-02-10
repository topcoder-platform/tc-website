package com.topcoder.web.csf.model;

import com.topcoder.web.common.model.Base;

import java.util.Set;
import java.util.Collections;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 28, 2006
 */
public class Prize extends Base implements Comparable {
    private Integer place;
    private Float amount;
    private Set contests;
    private Long id;
    private PrizeType type;

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

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public Set getContests() {
        return Collections.unmodifiableSet(contests);
    }

    public void setContests(Set contests) {
        this.contests = contests;
    }

    public PrizeType getType() {
        return type;
    }

    public void setType(PrizeType type) {
        this.type = type;
    }

    public int compareTo(Object o) {
        Prize other = (Prize) o;
        return getPlace().compareTo(other.getPlace());
    }
}
