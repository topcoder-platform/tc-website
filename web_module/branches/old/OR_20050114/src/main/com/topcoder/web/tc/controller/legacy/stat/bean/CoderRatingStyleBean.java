package com.topcoder.web.tc.controller.legacy.stat.bean;

import java.util.*;

/**
 * This class represents a bean container of Rating Brackets.
 * It will maintain the syle-guide and output the style-name
 * for a particular rating.
 *
 *
 * @author tbone
 * @version $Revision$
 */
public class CoderRatingStyleBean {
    public static final String BEAN_TOKEN = "CODER_COLORS";
    private Map mtmBrackets;

    /**
     * Default constructor
     */
    public CoderRatingStyleBean() {
        super();
        mtmBrackets = new TreeMap();
    }

    /**
     * Overloaded constructor allowing a comparator
     * @param Comparator
     */
    public CoderRatingStyleBean(Comparator comp) {
        super();
        mtmBrackets = new TreeMap(comp);
    }

    /**
     * Retrieve the text-style of a rating based on the rules that a
     * style (for a particular value) falls within a presecified range.  This
     * method takes advantage of the backing TreeMap instance and some of the
     * rules of introspection in order to efficiently pidgeonhole a rating within
     * some established lowed and upper bounds.
     * @param int The actual value of a coder rating
     * @return String the style-name for a specific coder rating,
     *          e.g. &quot;coderTextRed&quot;
     */
    public String getStyle(int i) {
        String s = "";
        try {
            s = (String) mtmBrackets.get(new MyNumber(i));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    /**
     * Overrides getStyle(int i).  This method returns empty-string
     * @return String equal to &quot;&quot;
     */
    public String getStyle() {
        return "";
    }

    /**
     * Method used to populate the underlying map
     * @param String the name of a particular style
     * @param int the lower-bound of this particular style-name
     * @param int the upper-bound of this particular style-name
     */
    public void addStyle(String sStyle, int iMin, int iMax) {
        mtmBrackets.put(new CoderRatingBracket(iMin, iMax), sStyle);
    }

    /**
     *
     * <p>Description: the real efficiency is in these inner objects:
     *    compareTo will return &quot;equal&quot;
     *    when the object we are comparing is within the range (inclusive)
     *    of this CoderRatingBracket object.
     *    </p>
     */
    public final class CoderRatingBracket implements Comparable {
        private int miMin;
        private int miMax;
        private int miVal = Integer.MIN_VALUE;

        /**
         * Constructor for a coder rating bracket.
         * @param int the lower-bound (inclusive)
         * @param int the upper-bound (inclusive)
         */
        private CoderRatingBracket(int iMin, int iMax) {
            miMin = iMin;
            miMax = iMax;
        }

        /**
         * Implementation of Comparable
         * @param Object an object
         * @return int
         */
        public int compareTo(Object obj) {
            int iVal = 0;
            if (obj instanceof CoderRatingBracket) {
                iVal = ((CoderRatingBracket) obj).miMin;
                int iMaxVal = ((CoderRatingBracket) obj).miMax;
                if (miMin > iVal)
                    return miMax > iMaxVal ? (miMin - iVal):0;
                else if (miMin < iVal)
                    return miMax < iMaxVal ? (miMin - iVal):0;
                else
                    return 0;
            } else if (obj instanceof MyNumber) {
                iVal = ((MyNumber) obj).intValue();
                if (iVal < miMin)
                    return miMin - iVal;
                else if (iVal > miMax)
                    return miMax - iVal;
                else
                    return 0;
            } else
                throw new ClassCastException(obj.getClass().getName());
        }
    }


    /**
     *
     * <p>Description: this iner-class is just a wrapper for Integer
     *    compareTo will return &quot;equal&quot;
     *    when the object we are comparing is within the range (inclusive)
     *    of a CoderRatingBracket object.  We could not use Integer because
     *    Integer.compareTo throws a ClassCastException when comparing to the
     *    CoderRatingBracket
     *    </p>
     */
    private class MyNumber implements Comparable {
        private int miNum;

        protected MyNumber(int i) {
            miNum = i;
        }

        /**
         * Returns this integer value
         * @return int
         */
        public int intValue() {
            return miNum;
        }

        /**
         * Implementation of Comparable
         * @param Object
         * @return int
         */
        public int compareTo(Object obj) {
            int iVal = 0;
            if (obj instanceof CoderRatingBracket) {
                iVal = ((CoderRatingBracket) obj).miMin;
                int iMaxVal = ((CoderRatingBracket) obj).miMax;
                if (miNum >= iVal && (miNum <= iMaxVal))
                    return 0;
                else if (miNum < iVal)
                    return -1;
                else
                    return 1;
            } else
                throw new ClassCastException(obj.getClass().getName());
        }
    }
}
