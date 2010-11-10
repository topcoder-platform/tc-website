package com.topcoder.web.common.model;

import java.io.Serializable;

/**
 * A class to hold algorithm rating information.
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class AlgoRating extends Base {

    protected Identifier id = new Identifier();
    protected Integer rating;
    protected Long roundId;
    protected AlgoRatingType type;
    protected Coder coder;
    protected Integer numRatings;
    protected Integer volatility;

    public AlgoRating() {
        this.numRatings = 0;
        this.volatility = 0;
        this.rating = 0;
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public Long getRoundId() {
        return roundId;
    }

    public void setRoundId(Long roundId) {
        this.roundId = roundId;
    }

    public Integer getNumRatings() {
        return numRatings;
    }

    public void setNumRatings(Integer numRatings) {
        this.numRatings = numRatings;
    }

    public AlgoRatingType getType() {
        return type;
    }

    public void setType(AlgoRatingType type) {
        this.type = type;
    }

    public Coder getCoder() {
        return coder;
    }

    public void setCoder(Coder coder) {
        this.coder = coder;
    }


    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                AlgoRating oa = (AlgoRating) o;
                boolean sameUser = (oa.getCoder().getId() == null && getCoder().getId() == null) ||
                        (oa.getCoder().getId() != null && getCoder().getId() != null && oa.getCoder().getId().equals(getCoder().getId()));
                boolean sameType = (oa.getType().getId() == null && getType().getId() == null) ||
                        (oa.getType().getId() != null && getType().getId() != null && oa.getType().getId().equals(getType().getId()));
                return sameUser && sameType;
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public int hashCode() {
        StringBuffer buf = new StringBuffer(30);

        if (getCoder() == null) {
            buf.append("");
        } else if (getCoder().getId() == null) {
            buf.append(getCoder().hashCode());
        } else {
            buf.append(getCoder().getId());
        }
        buf.append(" ");
        if (getType() == null) {
            buf.append("");
        } else if (getType().getId() == null) {
            buf.append(getType().hashCode());
        } else {
            buf.append(getType().getId());
        }
        return buf.toString().hashCode();
    }


    public static class Identifier implements Serializable {

        private Coder coder;
        private AlgoRatingType type;


        public Identifier() {

        }

        public Identifier(Coder coder, AlgoRatingType type) {
            this.coder = coder;
            this.type = type;
        }

        public Coder getCoder() {
            return coder;
        }

        public void setCoder(Coder coder) {
            this.coder = coder;
        }

        public AlgoRatingType getType() {
            return type;
        }

        public void setType(AlgoRatingType type) {
            this.type = type;
        }


        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    AlgoRating.Identifier oa = (AlgoRating.Identifier) o;
                    return (oa.getCoder().equals(getCoder()) &&
                            oa.getType().equals(getType()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(getCoder().getId());
            buf.append(" ");
            buf.append(getType().getId());
            return buf.toString().hashCode();
        }
    }


}
