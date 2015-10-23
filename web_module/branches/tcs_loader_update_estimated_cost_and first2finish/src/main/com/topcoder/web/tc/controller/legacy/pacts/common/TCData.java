/**
 * this class is an easy way to get data from a result set row and
 * will do exeption handling for you.  You can pass it the default
 * value to use if you are excepted.
 */

package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCTimestampResult;
import com.topcoder.shared.util.logging.Logger;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.StringTokenizer;

public class TCData {
    private static Logger log = Logger.getLogger(TCData.class);

    private static final boolean LOG_EXCEPTIONS = false;

    public static long getTCLong(ResultSetContainer.ResultSetRow row,
                                 String key, long defaultVal,
                                 boolean printException) {
        try {
            return row.getLongItem(key);
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

    public static boolean getTCBoolean(ResultSetContainer.ResultSetRow row,
                               String key, boolean defaultVal,
                               boolean printException) {
        try {
            return row.getBooleanItem(key);
        } catch (Exception e) {
            log.debug("getTCBoolean got excepted with key=" + key);
            if (printException) {
                e.printStackTrace();
            }
            return defaultVal;
        }
    }

    public static boolean getTCBoolean(ResultSetContainer.ResultSetRow row,
                               String key) {
        return getTCBoolean(row, key, false, LOG_EXCEPTIONS);
    }

    public static int getTCInt(ResultSetContainer.ResultSetRow row,
                               String key, int defaultVal,
                               boolean printException) {
        try {
            return row.getIntItem(key);
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
            return row.getStringItem(key);
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
                                   String key, String format, String defaultVal,
                                   boolean printException) {
        try {
            return new SimpleDateFormat(format).format((Timestamp) row.getItem(key).getResultData());
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
                                   String key, String defaultVal,
                                   boolean printException) {

        return getTCDate(row, key, "MM/dd/yyyy", defaultVal, LOG_EXCEPTIONS);

    }

    public static String getTCDate(ResultSetContainer.ResultSetRow row,
                                   String key) {
        return getTCDate(row, key, "00/00/0000", LOG_EXCEPTIONS);
    }

    public static double getTCDouble(ResultSetContainer.ResultSetRow row,
                                     String key, double defaultVal,
                                     boolean printException) {
        try {
            return row.getDoubleItem(key);
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
            return row.getFloatItem(key);
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

        if (userDate == null || "".equals(userDate.trim())) return defaultVal;

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
                        returnString += PactsConstants.YEAR_PREFIX + piece;
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


