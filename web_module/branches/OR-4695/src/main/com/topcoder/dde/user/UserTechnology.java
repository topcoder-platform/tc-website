package com.topcoder.dde.user;

import java.io.Serializable;

/**
 * The UserTechnology object represents one of a user's technology experiences.
 * This includes an id that is the primary key value of the respective
 * technology in the database, the user's rating in this technology, and
 * number of months of experience they have in it.
 *
 * @author Heather Van Aelst
 * @version 1.0 July 2002
 */
public class UserTechnology implements Serializable {

    private long technologyId;
    private int rating;
    private int months;

    /**
     * Constructs a UserTechnology object.
     *
     * @param technologyId
     * @param rating
     * @param months
     */
    public UserTechnology(long technologyId, int rating, int months) {
        this.technologyId = technologyId;
        this.rating = rating;
        this.months = months;
    }

    public long getTechnologyId() {
        return technologyId;
    }

    public int getRating() {
        return rating;
    }

    public int getMonths() {
        return months;
    }
}
