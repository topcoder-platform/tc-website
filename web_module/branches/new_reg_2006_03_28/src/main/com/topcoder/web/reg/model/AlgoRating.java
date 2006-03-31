package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class AlgoRating extends Base {

    private Long coderId;
    private Integer ratingTypeId;
    private Integer rating;
    private Long roundId;
    private Integer numRatings;

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


}
