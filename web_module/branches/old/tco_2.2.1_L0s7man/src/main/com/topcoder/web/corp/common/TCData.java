/**
 * this class is an easy way to get data from a result set row and
 * will do exeption handling for you.  You can pass it the default
 * value to use if you are excepted.
 */

// bigjake: copied from com.topcoder.web.tc.controller.legacy.pacts.common

package com.topcoder.web.corp.common;

import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.logging.Logger;

import java.util.StringTokenizer;

public class TCData {
    private static Logger log = Logger.getLogger(TCData.class);

    private static final boolean LOG_EXCEPTIONS = false;

    public static long getTCLong(ResultSetContainer.ResultSetRow row,
                                 String key, long defaultVal,
                                 boolean printException) {
        try {
            return ((Long) ((TCLongResult) row.getItem(key)).
                    getResultData()).longValue();
        } catch (Exception e) {
            log.debug("getTCLong got excepted with key=" + key);
            if (printException) {
                e.printStackTrace();
            }
            return defaultVal;
        }
    }

    public static long getTCLong(ResultSetContainer.ResultSetRow row,
                                 String key) {
        return getTCLong(row, key, 0, LOG_EXCEPTIONS);
    }

    public static int getTCInt(ResultSetContainer.ResultSetRow row,
                               String key, int defaultVal,
                               boolean printException) {
        try {
            return ((Integer) ((TCIntResult) row.getItem(key)).
                    getResultData()).intValue();
        } catch (Exception e) {
            log.debug("getTCInt got excepted with key=" + key);
            if (printException) {
                e.printStackTrace();
            }
            return defaultVal;
        }
    }

    public static int getTCInt(ResultSetContainer.ResultSetRow row,
                               String key) {
        return getTCInt(row, key, 0, LOG_EXCEPTIONS);
    }

    public static String getTCString(ResultSetContainer.ResultSetRow row,
                                     String key, String defaultVal,
                                     boolean printException) {
        try {
            return ((TCStringResult) row.getItem(key)).toString();
        } catch (Exception e) {
            log.debug("getTCString got excepted with key=" + key);
            if (printException) {
                e.printStackTrace();
            }
            return defaultVal;
        }
    }

    public static String getTCString(ResultSetContainer.ResultSetRow row,
                                     String key) {
        return getTCString(row, key, new String(""), LOG_EXCEPTIONS);
    }

    public static String getTCDate(ResultSetContainer.ResultSetRow row,
                                   String key, String defaultVal,
                                   boolean printException) {
        try {
            // Commented out by STK 5/29/02
            //StringTokenizer token = new StringTokenizer(
            //    ((TCTimestampResult) row.getItem(key)).toString().substring(0,10),
            //    "-");

            // added by STK 5/29/02
            StringTokenizer tok1 = new StringTokenizer(
                    ((TCTimestampResult) row.getItem(key)).toString());
            StringTokenizer token = new StringTokenizer(
                    (String) tok1.nextElement(), "-");

            String year = (String) token.nextElement();
            String returnString = "";
            while (token.hasMoreElements()) {
                returnString += (String) token.nextElement() + "/";
            }

            return returnString + year;
        } catch (Exception e) {
            log.debug("getTCDate got excepted with key=" + key);
            if (printException) {
                e.printStackTrace();
            }
            if (defaultVal != null && defaultVal.equals("00/00/00"))
                return "00/00/0000";
            else
                return defaultVal;
        }
    }

    public static String getTCDate(ResultSetContainer.ResultSetRow row,
                                   String key) {
        return getTCDate(row, key, "00/00/0000", LOG_EXCEPTIONS);
    }

    public static double getTCDouble(ResultSetContainer.ResultSetRow row,
                                     String key, double defaultVal,
                                     boolean printException) {
        try {
            return ((Double) ((TCDoubleResult) row.getItem(key)).
                    getResultData()).doubleValue();
        } catch (Exception e) {
            log.debug("getTCDouble got excepted with key=" + key);
            if (printException) {
                e.printStackTrace();
            }
            return defaultVal;
        }
    }

    public static double getTCDouble(ResultSetContainer.ResultSetRow row,
                                     String key) {
        return getTCDouble(row, key, 0.0, LOG_EXCEPTIONS);
    }

    public static float getTCFloat(ResultSetContainer.ResultSetRow row,
                                   String key, float defaultVal,
                                   boolean printException) {
        try {
            return ((Float) ((TCFloatResult) row.getItem(key)).
                    getResultData()).floatValue();
        } catch (Exception e) {
            log.debug("getTCDouble got excepted with key=" + key);
            if (printException) {
                e.printStackTrace();
            }
            return defaultVal;
        }
    }

    public static float getTCFloat(ResultSetContainer.ResultSetRow row,
                                   String key) {
        return getTCFloat(row, key, 0, LOG_EXCEPTIONS);
    }

    public static String dateForm(String userDate, String defaultVal, boolean printError) {

        if (userDate == null) return "00/00/0000";

        StringTokenizer token = new StringTokenizer(userDate, "/");

        String piece;
        int count = 0;
        boolean error = false;
        String returnString = "";

        while (token.hasMoreElements() && !error) {

            piece = (String) token.nextElement();

            if (count < 2) {
                switch (piece.length()) {
                    case 1:
                        returnString += "0" + piece + "/";
                        break;
                    case 2:
                        returnString += piece + "/";
                        break;
                    default:
                        error = true;
                }
            } else if (count == 2) {
                switch (piece.length()) {
                    //Add the year prefix ONLY if a 2 digit year was entered.
                    //Users may always enter 4 digit years
                    //Hopefully TC won't be running this code for Y10k
                    case 2:
                        returnString += "20" + piece;
                        break;
                    case 4:
                        returnString += piece;
                        break;
                    default:
                        error = true;
                }
            } else
                error = true;

            count++;
        }

        if (error) {
            if (printError) log.error("Bad Date: " + userDate + "!");
            returnString = defaultVal;
        }

        return returnString;
    }

    public static String dateForm(String userDate) {
        return dateForm(userDate, "00/00/0000", LOG_EXCEPTIONS);
    }
}


