package com.topcoder.web.common.model.algo;

import java.io.Serializable;
import java.sql.Timestamp;
import com.topcoder.web.common.model.Base;

/**
 * @author cucu
 */
public class RoundSegment extends Base {

    protected Identifier id = new Identifier();
    protected Timestamp startTime = null;
    protected Timestamp endTime = null;
    protected String status;

    public RoundSegment() {
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    protected Timestamp getEndTime() {
        return endTime;
    }

    protected void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    protected Timestamp getStartTime() {
        return startTime;
    }

    protected void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    protected String getStatus() {
        return status;
    }

    protected void setStatus(String status) {
        this.status = status;
    }


    public static class Identifier implements Serializable {

        private Round round = null;
        private Segment segment = null;

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
        public Segment getSegment() {
            return segment;
        }


        /**
         * @param segment the segment to set
         */
        public void setSegment(Segment segment) {
            this.segment = segment;
        }

        /* (non-Javadoc)
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int PRIME = 31;
            int result = 1;
            result = PRIME * result + ((round == null) ? 0 : round.hashCode());
            result = PRIME * result + ((segment == null) ? 0 : segment.hashCode());
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
            if (segment == null) {
                if (other.segment != null)
                    return false;
            } else if (!segment.equals(other.segment))
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
