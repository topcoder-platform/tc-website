package com.topcoder.web.tces.common;

import com.topcoder.shared.dataAccess.resultSet.TCResultItem;

import java.math.BigDecimal;
import java.util.TreeMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * <p>Title: JSPUtils </p>
 * <p>Description: contains a set of utility classes for encoding data or
 * anything else useful for JSP pages
 * </p>
 */
public class JSPUtils {

    /**
     * Encodes an object based on html encoding scheme.  Escape-out
     * items that are problematic for displaying in internet browsers
     * e.g. extended characters and &gt;, &lt; etc.
     * <b> This object does not deal with spaces and non-breaking spaces since
     * application of that formatting logic is JSP page specific and not
     * well-applied in this object</b>
     * @param String
     * @return String the encoded version of the object
     */
    public static String htmlEncode(String s) {
        StringBuffer sb = new StringBuffer();
        char ch = ' ';
        for (int i = 0; i < s.length(); i++) {
            if ((ch = s.charAt(i)) == '>') {
                sb.append("&gt;");
            } else if (ch == 9) {  //we'll go with 2 spaces for a tab
                sb.append("  ");
            } else if (ch == '<') {
                sb.append("&lt;");
            } else if (ch == 10 || ch == 13) {
                sb.append(ch);
            } else if (((int) ch) < 32) {
                //anything less than a "space" character is technically unprintable
                sb.append("[\\u" + (int) ch + "]");
            } else if ((((int) ch) > 126) && (((int) ch) < 160)) {
                //anything in this range is unprintable per latin-1
                sb.append("[\\u" + (int) ch + "]");
            } else if ((((int) ch) >= 160) && (((int) ch) <= 255)) {
                //anything in this range is printable per latin-1 with a little massaging
                sb.append("&#" + (int) ch + ";");
            } else if ((int) ch > 255) {
                //anything in this range is unprintable per latin-1
                //html4.0 has some support but it isn't worth picking out a few cases that
                //some browsers won't display properly.
                sb.append("[\\u" + (int) ch + "]");
            } else
                sb.append(ch);
        }
        return sb.toString();
    }

    /**
     * Encodes an object based on html encoding scheme.  If object is null, return
     * &quot;&quot; else we use obj.toString and return the encoded value of that
     * method call
     * @param Object
     * @return String the encoded version of the object
     */
    public static String htmlEncode(Object obj) {
        if (obj != null)
            return htmlEncode(obj.toString());
        else
            return "";
    }

    public static String timeFormat(TCResultItem result) {
        double millisec = Double.parseDouble(result.toString());
        int sec = (int)(millisec / 1000);
        int min = sec/60;
        sec %= 60;
        return min + " mins " + sec + " secs";
    }

    public static String autoFormat(TCResultItem result) {
        switch(result.getType()){
            case TCResultItem.DOUBLE:
                return TCESConstants.NUMBER_FORMAT.format(((Double)result.getResultData()).doubleValue());
            case TCResultItem.FLOAT:
                return TCESConstants.NUMBER_FORMAT.format(((Float)result.getResultData()).floatValue());
            case TCResultItem.BIGDECIMAL:
                return TCESConstants.NUMBER_FORMAT.format(((BigDecimal)result.getResultData()).doubleValue());
            case TCResultItem.DATETIME:
                return TCESConstants.DATE_FORMAT.format((java.sql.Timestamp)result.getResultData());
            default:
                return result.toString();
        }
    }

}
