package com.topcoder.web.reg.model;

/**
 * This AlgoRating implementation is for the regular TopCoder
 * algorithm rating.
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 5, 2006
 */
public class HSAlgoRating extends AlgoRating {
    public static final Integer RATING_TYPE_ID = new Integer(2);

    public HSAlgoRating() {
        super();
        getId().setRatingTypeId(RATING_TYPE_ID);
    }

    public HSAlgoRating(Coder c) {
        this();
        id.setCoderId(c.getId());
    }


}

