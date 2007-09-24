/*
* Room
*
* Created Sep 24, 2007
*/
package com.topcoder.web.common.model.algo;

import com.topcoder.web.common.model.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Room  extends Base {

    protected Long id = null;
    protected Round round = null;
    protected String name = null;
    protected Long divisionId = null;
    protected Long roomTypeId = null;
    protected Integer eligible = null;
    protected Integer unrated = null;

    
    /**
     * @return the divisionId
     */
    public Long getDivisionId() {
        return divisionId;
    }
    /**
     * @param divisionId the divisionId to set
     */
    public void setDivisionId(Long divisionId) {
        this.divisionId = divisionId;
    }
    /**
     * @return the eligible
     */
    public Integer getEligible() {
        return eligible;
    }
    /**
     * @param eligible the eligible to set
     */
    public void setEligible(Integer eligible) {
        this.eligible = eligible;
    }
    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }
    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * @return the roomTypeId
     */
    public Long getRoomTypeId() {
        return roomTypeId;
    }
    /**
     * @param roomTypeId the roomTypeId to set
     */
    public void setRoomTypeId(Long roomTypeId) {
        this.roomTypeId = roomTypeId;
    }
    /**
     * @return the round
     */
    public Round getRound() {
        return round;
    }
    /**
     * @param round the round to set
     */
    public void setRound(Round round) {
        this.round = round;
    }
    /**
     * @return the unrated
     */
    public Integer getUnrated() {
        return unrated;
    }
    /**
     * @param unrated the unrated to set
     */
    public void setUnrated(Integer unrated) {
        this.unrated = unrated;
    }

    
    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
        result = PRIME * result + ((name == null) ? 0 : name.hashCode());
        result = PRIME * result + ((round == null) ? 0 : round.hashCode());
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
        final Room other = (Room) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (round == null) {
            if (other.round != null)
                return false;
        } else if (!round.equals(other.round))
            return false;
        return true;
    }
}
