/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Date;

/**
 * <p>An utility class providing various static methods to be used by <code>Studio</code> controllers.</p>
 * 
 * @author isv
 * @version 1.0 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly)
 */
public class Utils {

    /**
     * <p>Constructs new <code>Utils</code> instance. This implementation does nothing.</p>
     */
    private Utils() {
    }

    /**
     * <p>Gets the textual description of the period in which the specified date (contest completion) will be reached.
     * </p>
     *
     * @param date a <code>Date</code> providing the date of contest completion.
     * @return a <code>String</code> providing the textual description of the period in which the specified date will be
     *         reached.
     */
    public static String getTextualDiff(Date date) {
        if (date == null) {
            return "";
        } else {
            long diff;
            Date now = new Date();
            if (now.after(date)) {
                diff = (now.getTime() - date.getTime()) / 1000L;
            } else {
                diff = (date.getTime() - now.getTime()) / 1000L;
            }

            long yearDuration = 365 * 24 * 3600L;
            long monthDuration = 31 * 24 * 3600L;
            long weekDuration = 7 * 24 * 3600L;
            long dayDuration = 24 * 3600L;
            long hourDuration = 3600L;
            long minuteDuration = 60L;

            long years = diff / yearDuration;
            diff %= yearDuration;
            long months = diff / monthDuration;
            diff %= monthDuration;
            long weeks = diff / weekDuration;
            diff %= weekDuration;
            long days = diff / dayDuration;
            diff %= dayDuration;
            long hours = diff / hourDuration;
            diff %= hourDuration;
            long minutes = diff / minuteDuration;

            StringBuilder b = new StringBuilder();
            addText(years, "year", b);
            addText(months, "month", b);
            addText(weeks, "week", b);
            addText(days, "day", b);
            addText(hours, "hour", b);
            addText(minutes, "min", b);

            if (now.after(date)) {
                b.append(" ago");
            } else {
                b.append(" left");
            }

            return b.toString();
        }
    }

    /**
     * <p>Adds textual presentation of specified numeric value to text output.</p>
     *
     * @param value a <code>long</code> providing the value.
     * @param title a <code>String</code> providing the title for value.
     * @param b a <code>StringBuilder</code> collecting the output.
     */
    private static void addText(long value, String title, StringBuilder b) {
        if (value > 0) {
            if (b.length() > 0) {
                b.append(" ");
            }
            b.append(value).append(" ");
            if (value % 10 == 1 && value % 100 != 11) {
                b.append(title);
            } else {
                b.append(title).append("s");
            }
        }
    }
}
