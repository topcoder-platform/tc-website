package com.topcoder.web.common.model.algo;

import java.io.Serializable;
import java.sql.Timestamp;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Coder;

/**
 * @author pulky
 */
public class RoundRegistration extends Base {

    private Identifier id = new Identifier();
    private Timestamp timestamp = null;
    private Integer eligible = null;
    private Long teamId = null;

    public RoundRegistration() {
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
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
     * @return the teamId
     */
    public Long getTeamId() {
        return teamId;
    }

    /**
     * @param teamId the teamId to set
     */
    public void setTeamId(Long teamId) {
        this.teamId = teamId;
    }

    /**
     * @return the timestamp
     */
    public Timestamp getTimestamp() {
        return timestamp;
    }

    /**
     * @param timestamp the timestamp to set
     */
    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
    
    public static class Identifier implements Serializable {

        private Round round = null;
        private Coder coder = null;

        public Identifier() {

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
         * @return the coder
         */
        public Coder getCoder() {
            return coder;
        }


        /**
         * @param coder the coder to set
         */
        public void setCoder(Coder coder) {
            this.coder = coder;
        }

        /* (non-Javadoc)
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int PRIME = 31;
            int result = 1;
            result = PRIME * result + ((round == null) ? 0 : round.hashCode());
            result = PRIME * result + ((coder == null) ? 0 : coder.getId().hashCode());
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
            final Identifier other = (Identifier) obj;
            if (round == null) {
                if (other.round != null)
                    return false;
            } else if (!round.equals(other.round))
                return false;
            if (coder == null) {
                if (other.coder != null)
                    return false;
            } else if (!coder.getId().equals(other.coder.getId()))
                return false;
            return true;
        }


    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
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
        final RoundRegistration other = (RoundRegistration) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

}
