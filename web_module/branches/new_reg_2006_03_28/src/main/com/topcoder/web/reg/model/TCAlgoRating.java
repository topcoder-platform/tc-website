package com.topcoder.web.reg.model;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 5, 2006
 */
public class TCAlgoRating extends AlgoRating {
    public static final Integer RATING_TYPE_ID = new Integer(1);

    public TCAlgoRating() {
        super();
        setRatingTypeId(RATING_TYPE_ID);
    }
}
