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

        TimeZone fromTZ = TimeZone.getTimeZone(fromTimeZone);
        TimeZone toTZ = TimeZone.getTimeZone(toTimeZone);
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        int fromOffset = fromTZ.getOffset(c.get(Calendar.ERA), c.get(Calendar.YEAR), c.get(Calendar.MONTH),
                c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.DAY_OF_WEEK), c.get(Calendar.MILLISECOND));
        int toOffset = toTZ.getOffset(c.get(Calendar.ERA), c.get(Calendar.YEAR), c.get(Calendar.MONTH),
                c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.DAY_OF_WEEK), c.get(Calendar.MILLISECOND));
/*      will work in 1.4+
        int fromOffset = TimeZone.getTimeZone(fromTimeZone).getOffset(d.getTime());
        int toOffset = TimeZone.getTimeZone(toTimeZone).getOffset(d.getTime());
*/
        return toOffset-fromOffset;
    }

    /**
     * Determine the offset between the default timezone and another on the specified date
     * @param toTimeZone
     * @return the offset in milliseconds
     */
    public static int getOffset(Date d, String toTimeZone) {
        return getOffset(d, TimeZone.getDefault().getID(), toTimeZone);
    }


}
