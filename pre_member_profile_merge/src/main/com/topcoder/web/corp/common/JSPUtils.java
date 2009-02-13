package com.topcoder.web.corp.common;

import com.topcoder.shared.dataAccess.resultSet.TCResultItem;
import com.topcoder.shared.util.logging.Logger;

import java.math.BigDecimal;
import java.util.*;

/**
 * <p>Title: JSPUtils </p>
 * <p>Description: contains a set of utility classes for encoding data or
 * anything else useful for JSP pages
 * </p>
 */
public class JSPUtils {

    private static Logger log = Logger.getLogger(JSPUtils.class);

    /** Encodes an object based on html encoding scheme.  Escape-out
     * items that are problematic for displaying in internet browsers
     * e.g. extended characters and &gt;, &lt; etc.
     * <b> This object does not deal with spaces and non-breaking spaces since
     * application of that formatting logic is JSP page specific and not
     * well-applied in this object</b>
     * @param s The string to be encoded.
     * @return The encoded version of the object
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

    /** Encodes an object based on html encoding scheme.  If object is null, return
     * &quot;&quot; else we use obj.toString and return the encoded value of that
     * method call
     * @param obj The object to be encoded
     * @return The encoded version of the object
     */
    public static String htmlEncode(Object obj) {
        if (obj != null)
            return htmlEncode(obj.toString());
        else
            return "";
    }

    /** Formats a TCResultItem as an elapsed time in minutes and
     * seconds. The TCResultItem must contain a numeric value,
     * which is taken to be an elapsed time expressed in
     * milliseconds.
     * @param result The TCResultItem containing an elapsed time in milliseconds.
     * @return The time value expressed as minutes and seconds.
     */
    public static String timeFormat(TCResultItem result) {
        double millisec = 0.0D;
        if (result.getResultData() != null) {
            millisec = Double.parseDouble(result.toString());
        }
        int sec = (int) (millisec / 1000);
        int min = sec / 60;
        sec %= 60;
        return min + " mins " + sec + " secs";
    }

    /** Formats a TCResultItem as a string according to the default
     * TCES rules. Floating-point numeric values are formatted
     * with TCESConstants.NUMBER_FORMAT, and timestamps are
     * formatted with TCESConstants.DATE_FORMAT. All other types
     * use their standard toString() methods.
     * @param result The TCResultItem to be formatted.
     * @return The formatted text string.
     */
    public static String autoFormat(TCResultItem result) {
        switch (result.getType()) {
            case TCResultItem.DOUBLE:
                return TCESConstants.NUMBER_FORMAT.format(((Double) result.getResultData()).doubleValue());
            case TCResultItem.FLOAT:
                return TCESConstants.NUMBER_FORMAT.format(((Float) result.getResultData()).floatValue());
            case TCResultItem.BIGDECIMAL:
                return TCESConstants.NUMBER_FORMAT.format(((BigDecimal) result.getResultData()).doubleValue());
            case TCResultItem.DATETIME:
                return TCESConstants.DATE_FORMAT.format((java.sql.Timestamp) result.getResultData());
            default:
                return result.toString();
        }
    }

    /** Sorts a list of Maps by the values in a given field. The
     * Maps typically represent rows in a data table, and the
     * fields are columns in the table. In this context, this
     * method sorts the rows in a table by the values in a given
     * column.
     * @param mapList The list of Maps to be sorted.
     * @param fieldName The name of the field by which the Maps will be sorted.
     * @param ascending The sort direction, <CODE>true</CODE> = ascending,
     * <CODE>false</CODE> = descending.
     * @return The sorted list of Maps.
     */
    public static ArrayList sortMapList(List mapList, String fieldName, boolean ascending) {
        TreeMap mapsMap = new TreeMap();
        ArrayList sortedMapList = new ArrayList();

        Iterator maps = mapList.iterator();
        while (maps.hasNext()) {
            Map curMap = (Map) maps.next();

            if (curMap.get(fieldName) == null) {
                System.out.println(curMap);
                Iterator it = curMap.keySet().iterator();
                while (it.hasNext())
                    log.debug(it.next());
            } else {

                ArrayList keyDupList = null;
                if (!mapsMap.containsKey(curMap.get(fieldName))) {
                    keyDupList = new ArrayList();
                    mapsMap.put(curMap.get(fieldName), keyDupList);
                } else {
                    keyDupList = (ArrayList) mapsMap.get(curMap.get(fieldName));
                }

                keyDupList.add(curMap);

            }
        }

        while (mapsMap.size() > 0) {
            List keyDupList = (List) mapsMap.get(ascending ? mapsMap.firstKey() : mapsMap.lastKey());

            Iterator keyDups = keyDupList.iterator();
            while (keyDups.hasNext()) {
                sortedMapList.add(keyDups.next());
            }

            mapsMap.remove(ascending ? mapsMap.firstKey() : mapsMap.lastKey());
        }

        return sortedMapList;
    }

    /**
     * Formats a <code>long</code> time as an elapsed time in hours, minutes and seconds. The parameter must contain a
     * numeric value which is taken to be an elapsed time expressed in milliseconds.
     *
     * @param  time a <code>String</code> containing an elapsed time in milliseconds.
     * @return a <code>String</code> representing the time value expressed as hours, minutes and seconds.
     * @since  Screening Tool 1.1
     */
    public static String timeFormat(String time) {
        if (time == null) {
            return "N/A";
        }

        double millisec = 0.0D;
        millisec = Double.parseDouble(String.valueOf(time));
        int sec = (int) (millisec / 1000);
        int hour = sec / 3600;
        int min = (sec - hour * 3600) / 60;
        sec %= 60;
        return hour + ":" + min + ":" + sec;
    }

}
