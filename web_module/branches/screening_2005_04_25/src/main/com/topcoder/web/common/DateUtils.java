package com.topcoder.web.common;

import java.util.Date;
import java.util.TimeZone;
import java.util.Calendar;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 30, 2005
 */
public class DateUtils {

    /**
     * Adjust a date from one timezone to another
     * @param d
     * @param fromTimeZone
     * @param toTimeZone
     * @return
     */
    public static Date getConvertedDate(Date d, String fromTimeZone, String toTimeZone) {
        return new Date(d.getTime()+getOffset(fromTimeZone, toTimeZone));
    }

    /**
     * Adjust a date from the default timezone to another
     * @param d
     * @param toTimeZone
     * @return
     */
    public static Date getConvertedDate(Date d, String toTimeZone) {
        return new Date(d.getTime()+getOffset(toTimeZone));
    }

    /**
     * Determine the offset between one timezone and another
     * @param fromTimeZone
     * @param toTimeZone
     * @return
     */
    public static int getOffset(String fromTimeZone, String toTimeZone) {
        Calendar to = Calendar.getInstance(TimeZone.getTimeZone(toTimeZone));
        Calendar from = Calendar.getInstance(TimeZone.getTimeZone(fromTimeZone));
        return to.get(Calendar.ZONE_OFFSET)-from.get(Calendar.ZONE_OFFSET);
    }

    /**
     * Determine the offset between the default timezone and another
     * @param toTimeZone
     * @return
     */
    public static int getOffset(String toTimeZone) {
        Calendar to = Calendar.getInstance(TimeZone.getTimeZone(toTimeZone));
        Calendar from = Calendar.getInstance();
        return to.get(Calendar.ZONE_OFFSET)-from.get(Calendar.ZONE_OFFSET);
    }


}
