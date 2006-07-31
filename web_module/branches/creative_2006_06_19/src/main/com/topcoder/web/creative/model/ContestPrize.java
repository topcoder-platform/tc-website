package com.topcoder.web.creative.model;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 28, 2006
 */
public class ContestPrize {
    private Contest contest;
    private Integer place;
    private Float amount;
    private Identifier id = new Identifier();


    public Contest getContest() {
        return contest;
    }

    public void setContest(Contest contest) {
        this.contest = contest;
    }

    public Integer getPlace() {
        return place;
    }

    public void setPlace(Integer place) {
        this.place = place;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }


    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                ContestPrize oa = (ContestPrize) o;
                boolean sameContest = (oa.getContest().getId() == null && getContest().getId() == null) ||
                        (oa.getContest().getId() != null && getContest().getId() != null && oa.getContest().getId().equals(getContest().getId()));
                boolean samePlace = (oa.getPlace() == null && getPlace() == null) ||
                        (oa.getPlace() != null && getPlace() != null && oa.getPlace().equals(getPlace()));
                boolean sameAmount = (oa.getAmount() == null && getAmount() == null) ||
                        (oa.getAmount() != null && getAmount() != null && oa.getAmount().equals(getAmount()));
                return sameAmount && sameContest && samePlace;
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public int hashCode() {
        StringBuffer buf = new StringBuffer(30);

        if (getContest() == null) {
            buf.append("");
        } else if (getContest().getId() == null) {
            buf.append(getContest().hashCode());
        } else {
            buf.append(getContest().getId());
        }
        buf.append(" ");
        if (getAmount() == null) {
            buf.append("");
        } else {
            buf.append(getAmount().toString());
        }
        buf.append(" ");
        if (getPlace() == null) {
            buf.append("");
        } else {
            buf.append(getPlace().toString());
        }
        //log.debug(buf.toString() + " code: " + ret);
        return buf.toString().hashCode();
    }

    public static class Identifier implements Serializable, Cloneable {

        private Contest contest;
        private Integer place;

        public Identifier() {

        }

        public Identifier(Integer place, Contest contest) {
            this.place = place;
            this.contest = contest;
        }

        public Integer getPlace() {
            return place;
        }

        public void setPlace(Integer place) {
            this.place = place;
        }

        public Contest getContest() {
            return contest;
        }

        public void setContest(Contest contest) {
            this.contest = contest;
        }


        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    ContestPrize.Identifier oa = (ContestPrize.Identifier) o;
                    return (oa.place.equals(place) &&
                            oa.contest.getId().equals(contest.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(place);
            buf.append(" ");
            buf.append(contest.getId());
            return buf.toString().hashCode();
        }


    }
}




