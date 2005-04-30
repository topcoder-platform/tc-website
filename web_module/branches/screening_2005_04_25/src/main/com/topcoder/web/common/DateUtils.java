package com.topcoder.web.common;

import com.topcoder.shared.util.logging.Logger;

import java.util.Date;
import java.util.TimeZone;
import java.util.Calendar;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 30, 2005
 */
public class DateUtils {

    private final static Logger log = Logger.getLogger(DateUtils.class);

    /**
     * Adjust a date from one timezone to another
     * @param d
     * @param fromTimeZone
     * @param toTimeZone
     * @return
     */
    public static Date getConvertedDate(Date d, String fromTimeZone, String toTimeZone) {
        return new Date(d.getTime()+(getOffset(d, fromTimeZone, toTimeZone)));
    }

    /**
     * Adjust a date from the default timezone to another
     * @param d
     * @param toTimeZone
     * @return
     */
    public static Date getConvertedDate(Date d, String toTimeZone) {
        return new Date(d.getTime()+(getOffset(d, toTimeZone)));
    }

    /**
     * Determine the offset between one timezone and another on the specified date
     * @param d
     * @param fromTimeZone
     * @param toTimeZone
     * @return the offset in milliseconds
     */
    public static int getOffset(Date d, String fromTimeZone, String toTimeZone) {
        int fromOffset = TimeZone.getTimeZone(fromTimeZone).getOffset(d.getTime());
        int toOffset = TimeZone.getTimeZone(toTimeZone).getOffset(d.getTime());
        return toOffset-fromOffset;
    }

    /**
     * Determine the offset between the default timezone and another on the specified date
     * @param toTimeZone
     * @return the offset in milliseconds
     */
    public static int getOffset(Date d, String toTimeZone) {
        int fromOffset = TimeZone.getDefault().getOffset(d.getTime());
        int toOffset = TimeZone.getTimeZone(toTimeZone).getOffset(d.getTime());
        return toOffset-fromOffset;
    }


}
