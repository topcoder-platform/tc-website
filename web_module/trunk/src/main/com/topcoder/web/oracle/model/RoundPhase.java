package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2007
 */
public class RoundPhase extends Base {
    private Timestamp startTime;
    private Timestamp endTime;
    private Identifier id = new Identifier();


    public Round getRound() {
        return id.getRound();
    }

    public void setRound(Round round) {
        id.setRound(round);
    }

    public Phase getPhase() {
        return id.getPhase();
    }

    public void setPhase(Phase phase) {
        id.setPhase(phase);
    }

    public Identifier getId() {
        return id;
    }

    public void setId(RoundPhase.Identifier id) {
        this.id = id;
    }


    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                RoundPhase oa = (RoundPhase) o;
                boolean sameRound = (oa.getRound().getId() == null && getRound().getId() == null) ||
                        (oa.getRound().getId() != null && getRound().getId() != null && oa.getRound().getId().equals(getRound().getId()));
                boolean samePhase = (oa.getPhase().getId() == null && getPhase().getId() == null) ||
                        (oa.getPhase().getId() != null && getPhase().getId() != null && oa.getPhase().getId().equals(getPhase().getId()));
                return samePhase && sameRound;
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public int hashCode() {
        StringBuffer buf = new StringBuffer(30);

        if (getRound() == null) {
            buf.append("");
        } else if (getRound().getId() == null) {
            buf.append(getRound().hashCode());
        } else {
            buf.append(getRound().getId());
        }
        buf.append(" ");
        if (getPhase() == null) {
            buf.append("");
        } else if (getPhase().getId() == null) {
            buf.append(getPhase().hashCode());
        } else {
            buf.append(getPhase().getId());
        }
        return buf.toString().hashCode();
    }

    public static class Identifier implements Serializable, Cloneable {

        private Phase phase;
        private Round round;

        public Identifier() {

        }

        public Identifier(Phase phase, Round round) {
            this.phase = phase;
            this.round = round;
        }

        public Phase getPhase() {
            return phase;
        }

        public void setPhase(Phase phase) {
            this.phase = phase;
        }

        public Round getRound() {
            return round;
        }

        public void setRound(Round round) {
            this.round = round;
        }


        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    RoundPhase.Identifier oa = (RoundPhase.Identifier) o;
                    return (oa.phase.getId().equals(phase.getId()) &&
                            oa.round.getId().equals(round.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(phase.getId());
            buf.append(" ");
            buf.append(round.getId());
            return buf.toString().hashCode();
        }


    }
}
