package com.topcoder.web.common.model.algo;

import java.io.Serializable;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Coder;

/**
 * @author pulky
 */
public class RoomResult extends Base {

    protected Identifier id = new Identifier();

    private Integer roomSeed = null;
    private Integer oldRating = null;
    private Integer newRating = null;
    private Double paid = null;
    private Integer roomPlaced = null;
    private Integer divisionPlaced = null;
    private String attended = null;
    private String advanced = null;
    private Integer overallRank = null;
    private Double pointTotal = null;
    private Integer divisionSeed = null;
    
    public RoomResult() {
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }
    

    /**
     * @return the advanced
     */
    public String getAdvanced() {
        return advanced;
    }

    /**
     * @param advanced the advanced to set
     */
    public void setAdvanced(String advanced) {
        this.advanced = advanced;
    }

    /**
     * @return the attended
     */
    public String getAttended() {
        return attended;
    }

    /**
     * @param attended the attended to set
     */
    public void setAttended(String attended) {
        this.attended = attended;
    }

    /**
     * @return the divisionPlaced
     */
    public Integer getDivisionPlaced() {
        return divisionPlaced;
    }

    /**
     * @param divisionPlaced the divisionPlaced to set
     */
    public void setDivisionPlaced(Integer divisionPlaced) {
        this.divisionPlaced = divisionPlaced;
    }

    /**
     * @return the divisionSeed
     */
    public Integer getDivisionSeed() {
        return divisionSeed;
    }

    /**
     * @param divisionSeed the divisionSeed to set
     */
    public void setDivisionSeed(Integer divisionSeed) {
        this.divisionSeed = divisionSeed;
    }

    /**
     * @return the newRating
     */
    public Integer getNewRating() {
        return newRating;
    }

    /**
     * @param newRating the newRating to set
     */
    public void setNewRating(Integer newRating) {
        this.newRating = newRating;
    }

    /**
     * @return the oldRating
     */
    public Integer getOldRating() {
        return oldRating;
    }

    /**
     * @param oldRating the oldRating to set
     */
    public void setOldRating(Integer oldRating) {
        this.oldRating = oldRating;
    }

    /**
     * @return the overallRank
     */
    public Integer getOverallRank() {
        return overallRank;
    }

    /**
     * @param overallRank the overallRank to set
     */
    public void setOverallRank(Integer overallRank) {
        this.overallRank = overallRank;
    }

    /**
     * @return the paid
     */
    public Double getPaid() {
        return paid;
    }

    /**
     * @param paid the paid to set
     */
    public void setPaid(Double paid) {
        this.paid = paid;
    }

    /**
     * @return the pointTotal
     */
    public Double getPointTotal() {
        return pointTotal;
    }

    /**
     * @param pointTotal the pointTotal to set
     */
    public void setPointTotal(Double pointTotal) {
        this.pointTotal = pointTotal;
    }

    /**
     * @return the roomPlaced
     */
    public Integer getRoomPlaced() {
        return roomPlaced;
    }

    /**
     * @param roomPlaced the roomPlaced to set
     */
    public void setRoomPlaced(Integer roomPlaced) {
        this.roomPlaced = roomPlaced;
    }

    /**
     * @return the roomSeed
     */
    public Integer getRoomSeed() {
        return roomSeed;
    }

    /**
     * @param roomSeed the roomSeed to set
     */
    public void setRoomSeed(Integer roomSeed) {
        this.roomSeed = roomSeed;
    }


    public static class Identifier implements Serializable {

        private Round round = null;
        private Room room = null;
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

        /**
         * @return the room
         */
        public Room getRoom() {
            return room;
        }

        /**
         * @param room the room to set
         */
        public void setRoom(Room room) {
            this.room = room;
        }

        /* (non-Javadoc)
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int PRIME = 31;
            int result = 1;
            result = PRIME * result + ((coder == null) ? 0 : coder.getId().hashCode());
            result = PRIME * result + ((room == null) ? 0 : room.hashCode());
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
            final Identifier other = (Identifier) obj;
            if (coder == null) {
                if (other.coder != null)
                    return false;
            } else if (!coder.getId().equals(other.coder.getId()))
                return false;
            if (room == null) {
                if (other.room != null)
                    return false;
            } else if (!room.equals(other.room))
                return false;
            if (round == null) {
                if (other.round != null)
                    return false;
            } else if (!round.equals(other.round))
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
        final RoomResult other = (RoomResult) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

}
