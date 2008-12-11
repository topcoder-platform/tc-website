package com.topcoder.web.common.model.algo;

import java.io.Serializable;
import java.sql.Timestamp;
import com.topcoder.web.common.model.Base;

/**
 * @author cucu
 */
public class RoundSegment extends Base {

    public static final String FUTURE_STATUS = "F";
    private Identifier id = new Identifier();
    private Timestamp startTime = null;
    private Timestamp endTime = null;
    private String status;

    public RoundSegment() {
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public static class Identifier implements Serializable {

        private Round round = null;
        private Long segmentId = null;

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
         * @return the segment
         */
        public Long getSegmentId() {
            return segmentId;
        }


        /**
         * @param segment the segment to set
         */
        public void setSegmentId(Long segmentId) {
            this.segmentId = segmentId;
        }

        /* (non-Javadoc)
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int PRIME = 31;
            int result = 1;
            result = PRIME * result + ((round == null) ? 0 : round.hashCode());
            result = PRIME * result + ((segmentId == null) ? 0 : segmentId.hashCode());
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
            if (segmentId == null) {
                if (other.segmentId != null)
                    return false;
            } else if (!segmentId.equals(other.segmentId))
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
        final RoundSegment other = (RoundSegment) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }
}
