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

    protected Long registrationLimit = null;
    protected Integer invitational = null;
    protected RoundType type = null;
    protected Integer rated = null;

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
    /**
     * @return the invitational
     */
    public Integer getInvitational() {
        return invitational;
    }
    /**
     * @param invitational the invitational to set
     */
    public void setInvitational(Integer invitational) {
        this.invitational = invitational;
    }
    /**
     * @return the rated
     */
    public Integer getRated() {
        return rated;
    }
    /**
     * @param rated the rated to set
     */
    public void setRated(Integer rated) {
        this.rated = rated;
    }
    /**
     * @return the registrationLimit
     */
    public Long getRegistrationLimit() {
        return registrationLimit;
    }
    /**
     * @param registrationLimit the registrationLimit to set
     */
    public void setRegistrationLimit(Long registrationLimit) {
        this.registrationLimit = registrationLimit;
    }

    /**
     * @return the type
     */
    public RoundType getType() {
        return type;
    }
    /**
     * @param type the type to set
     */
    public void setType(RoundType type) {
        this.type = type;
    }
    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((contest == null) ? 0 : contest.hashCode());
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
        result = PRIME * result + ((invitational == null) ? 0 : invitational.hashCode());
        result = PRIME * result + ((name == null) ? 0 : name.hashCode());
        return result;
    }
    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final Round other = (Round) obj;
        if (contest == null) {
            if (other.contest != null)
                return false;
        } else if (!contest.equals(other.contest))
            return false;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (invitational == null) {
            if (other.invitational != null)
                return false;
        } else if (!invitational.equals(other.invitational))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        return true;
    }


}
