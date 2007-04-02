package com.topcoder.web.common.model;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author cucu
= */
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

        private Long roundId = null;
        private Long segmentId = null;

        public Identifier() {

        }


        public Identifier(Long roundId, Long segmentId) {
            super();
            this.roundId = roundId;
            this.segmentId = segmentId;
        }


        protected void setRoundId(Long roundId) {
            this.roundId = roundId;
        }


        protected void setSegmentId(Long segmentId) {
            this.segmentId = segmentId;
        }


        protected Long getRoundId() {
            return roundId;
        }


        protected Long getSegmentId() {
            return segmentId;
        }


        @Override
        public boolean equals(Object obj) {
            if (obj == null || !(obj instanceof RoundSegment.Identifier)) {
                return false;
            }
            RoundSegment.Identifier rs = (RoundSegment.Identifier) obj;
            
            return rs.getRoundId().equals(this.getRoundId()) && rs.getSegmentId().equals(this.getSegmentId()); 
        }

        @Override
        public int hashCode() {
            return (getRoundId() + " " + getSegmentId()).hashCode();
        }
    }




}
