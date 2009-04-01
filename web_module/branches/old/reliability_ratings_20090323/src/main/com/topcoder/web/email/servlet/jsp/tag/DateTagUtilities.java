package com.topcoder.web.email.servlet.jsp.tag;


import java.util.Calendar;
import java.util.GregorianCalendar;


/**

 * Date utilities used by date custom tags.

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 *

 */


public class DateTagUtilities {

    // list of month names

    public static String[] monthArray = new String[]{

        "January",

        "February",

        "March",

        "April",

        "May",

        "June",

        "July",

        "August",

        "September",

        "October",

        "November",

        "December"

    };


    /**

     * This method will return the number of days in a given month/year

     *

     * @param month		the month

     * @param year		the year

     *

     * @return int		the number of days in the specified month/year

     */


    public static int getNumDaysInMonth(int month, int year) {

        Calendar calendar = new GregorianCalendar(year, month, 1);

        // go ahead one month

        calendar.add(Calendar.MONTH, 1);

        // go back one day

        calendar.add(Calendar.DAY_OF_MONTH, -1);

        // return the day

        return calendar.get(Calendar.DAY_OF_MONTH);

    }

}