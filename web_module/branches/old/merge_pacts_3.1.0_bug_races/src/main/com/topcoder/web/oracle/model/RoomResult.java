package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.User;

import java.io.Serializable;
import java.util.Comparator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 14, 2007
 */
public class RoomResult extends Base {
    private Identifier id = new Identifier();
    private Double score;
    private Integer placed;
    private Boolean advanced;
    //todo add attended
    private Boolean attended;

    public RoomResult() {

    }


    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public User getUser() {
        return id.getUser();
    }

    public void setUser(User user) {
        id.setUser(user);
    }

    public Room getRoom() {
        return id.getRoom();
    }

    public void setRoom(Room room) {
        id.setRoom(room);
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public Integer getPlaced() {
        return placed;
    }

    public void setPlaced(Integer placed) {
        this.placed = placed;
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


    public Boolean getAttended() {
        return attended;
    }

    public void setAttended(Boolean attended) {
        this.attended = attended;
    }

    public boolean attended() {
        return attended!=null &&  attended;
    }

    public static class Identifier implements Serializable, Cloneable {

        private User user;
        private Room room;

        public Identifier() {
        }

        public Identifier(User user, Room room) {
            this.user = user;
            this.room = room;
        }


        public User getUser() {
            return user;
        }

        public void setUser(User user) {
            this.user = user;
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
                    return (oa.user.getId().equals(user.getId()) &&
                            oa.room.getId().equals(room.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(user.getId());
            buf.append(" ");
            buf.append(room.getId());
            return buf.toString().hashCode();
        }
        public String toString() {
            return (user!=null?user.getId():"null user") + " " + (room!=null?room.getId():"null room"); 
        }


    }

    public static class ScoreComparator implements Comparator<RoomResult> {

        public int compare(RoomResult c1, RoomResult c2) {
            return c2.getScore().compareTo(c1.getScore());
        }
    }




}
