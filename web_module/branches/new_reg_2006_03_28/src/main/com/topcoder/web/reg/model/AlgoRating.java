package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

import java.io.Serializable;

/**
 * A class to hold algorithm rating information.
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public abstract class AlgoRating extends Base {

    private Identifier id = new Identifier();
    private Integer rating;
    private Long roundId;
    private Integer numRatings;
    private Coder coder;

    public AlgoRating() {
        super();
    }

    public AlgoRating(Coder coder) {
        this.coder = coder;
    }

    public Coder getCoder() {
        return coder;
    }

    public void setCoder(Coder coder) {
        this.coder = coder;
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

    public class Identifier implements Serializable {
        private Long coderId;
        private Integer ratingTypeId;

        public Long getCoderId() {
            return coderId;
        }

        public void setCoderId(Long coderId) {
            this.coderId = coderId;
        }

        public Integer getRatingTypeId() {
            return ratingTypeId;
        }

        public void setRatingTypeId(Integer ratingTypeId) {
            this.ratingTypeId = ratingTypeId;
        }


        public Identifier() {

        }
        public Identifier(Long coderId, Integer ratingTypeId) {
            this.coderId = coderId;
            this.ratingTypeId = ratingTypeId;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    AlgoRating oa = (AlgoRating) o;
                    return (oa.getId().getCoderId().equals(coderId) &&
                            oa.getId().getRatingTypeId().equals(ratingTypeId));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(coderId);
            buf.append(" ");
            buf.append(ratingTypeId);
            return buf.toString().hashCode();
        }
    }


}
