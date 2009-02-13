package com.topcoder.web.hs.model;



/**
 * This class represents a bean container of Rating Brackets.
 *
 * @author Ambrose Feinstein
 */
public class CoderRatingStyleBean {

    private int[] bandLimits = new int[]{
        900,
        1200,
        1500,
        2200
    };
    /** should have one more item than bandLimits, so we can't fall off the end of the array */
    private String[] bandNames = new String[]{
        "coderTextGray",
        "coderTextGreen",
        "coderTextBlue",
        "coderTextYellow",
        "coderTextRed"
    };

    public CoderRatingStyleBean() {
    }

    /**
     * Get the CSS style name for a given coder rating.
     */
    public String getStyle(int i) {
        int p;
        for (p = 0; p < bandLimits.length; p++)
            if (i < bandLimits[p]) break;
        return bandNames[p];
    }
}
