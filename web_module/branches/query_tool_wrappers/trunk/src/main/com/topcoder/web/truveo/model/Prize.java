package com.topcoder.web.truveo.model;

import com.topcoder.web.common.model.Base;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 28, 2006
 */
public class Prize extends Base implements Comparable {
    private Integer place;
    private Float amount;
    private Set<Contest> contests = new HashSet<Contest>();
    private Long id;
    private PrizeType type;
    private Set<Submission> submissions = new HashSet<Submission>();

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

    /**
     *
     * @return an unmodifiable <code>Set</code> of <code>Contest</code>s.  It's unmodifiable because
     * the other end of this relationship is what gets persisted.

     */
    public Set getContests() {
        return Collections.unmodifiableSet(contests);
    }

    
    protected void setContests(Set<Contest> contests) {
        this.contests = contests;
    }

    public PrizeType getType() {
        return type;
    }

    public void setType(PrizeType type) {
        this.type = type;
    }

    /**
     *
     * @return an unmodifiable <code>Set</code> of <code>Submission</code>s.  It's unmodifiable because
     * the other end of this relationship is what gets persisted.
     */
    public Set<Submission> getSubmissions() {
        return Collections.unmodifiableSet(submissions);
    }

    protected void setSubmissions(Set<Submission> submissions) {
        this.submissions = submissions;
    }

    public int compareTo(Object o) {
        Prize other = (Prize) o;
        if (getPlace()==null && other.getPlace()==null) {
            return getAmount().compareTo(other.getAmount());
        } else if (getPlace()==null) {
            return new Integer(Integer.MAX_VALUE).compareTo(other.getPlace());
        } else if (other.getPlace()==null) {
            return getPlace().compareTo(Integer.MAX_VALUE);
        } else {
            return getPlace().compareTo(other.getPlace());
        }
    }


    /**
     * Override with more comprehensive implementation. We're using
     * the amount, prize type and if it's not null, the place as the
     * business key.
     *
     * @param o the other object
     * @return whether they are the same or not
     */
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Prize)) return false;
        final Prize that = (Prize) o;
        if (this.getType().equals(that.getType())) {
            if (this.getPlace() != null && that.getPlace() != null) {
                return this.getPlace().equals(that.getPlace()) && this.getAmount().equals(that.getAmount());
            } else
                return this.getPlace() == null && that.getPlace() == null && this.getAmount().equals(that.getAmount());
        } else {
            return false;
        }
    }

    /**
     * Override hashcode with a more comprehensive implementation that includes
     * the business key of this object.
     *
     * @return the hash code
     */
    public int hashCode() {
        StringBuilder buf = new StringBuilder(30);
        buf.append(getType().hashCode()).append(" ");
        buf.append(getPlace()).append(" ");
        buf.append(getAmount());
        //have to use the string's hashcode here because the string builder's will change
        return buf.toString().hashCode();
    }

    public String toString() {
        StringBuilder buf = new StringBuilder(100);
        buf.append("place: ").append(place);
        buf.append("amount: ").append(amount);
        buf.append("type: ").append(type);
        buf.append("id: ").append(id);
        return buf.toString();
    }

}




