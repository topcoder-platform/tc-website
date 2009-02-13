package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;

import java.io.Serializable;
import java.util.Comparator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 14, 2007
 */
public class CandidateRoomResult extends Base {
    private Identifier id;
    private Boolean advanced;
    private Integer placed;
    private Integer correctValue;

    public CandidateRoomResult() {
        id = new Identifier();
    }

    public CandidateRoomResult(Candidate c) {
        this();
        setCandidate(c);
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public Candidate getCandidate() {
        return id.getCandidate();
    }

    public void setCandidate(Candidate candidate) {
        id.setCandidate(candidate);
    }

    public Room getRoom() {
        return id.getRoom();
    }

    public void setRoom(Room room) {
        id.setRoom(room);
    }


    public Boolean getAdvanced() {
        return advanced;
    }

    public boolean advanced() {
        return advanced!=null && advanced;
    }

    public void setAdvanced(Boolean advanced) {
        this.advanced = advanced;
    }


    public int hashCode() {
       return id.hashCode();
    }


    public static class Identifier implements Serializable, Cloneable {

        private Candidate candidate;
        private Room room;

        public Identifier() {

        }

        public Identifier(Candidate candidate, Room room) {
            this.candidate = candidate;
            this.room = room;
        }


        public Candidate getCandidate() {
            return candidate;
        }

        public void setCandidate(Candidate candidate) {
            this.candidate = candidate;
        }

        public Room getRoom() {
            return room;
        }

        public void setRoom(Room room) {
            this.room = room;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    Identifier oa = (Identifier) o;
                    return (oa.candidate.getId().equals(candidate.getId()) &&
                            oa.room.getId().equals(room.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(candidate.getId());
            buf.append(" ");
            buf.append(room.getId());
            return buf.toString().hashCode();
        }

        public String toString() {
            return candidate + " " + room;
        }

    }


    public Integer getPlaced() {
        return placed;
    }

    public void setPlaced(Integer placed) {
        this.placed = placed;
    }

    public Integer getCorrectValue() {
        return correctValue;
    }

    public void setCorrectValue(Integer correctValue) {
        this.correctValue = correctValue;
    }


    public static class CorrectValueComparator implements Comparator<CandidateRoomResult> {

        public int compare(CandidateRoomResult c1, CandidateRoomResult c2) {
            return c1.getCorrectValue().compareTo(c2.getCorrectValue());
        }
    }



}
