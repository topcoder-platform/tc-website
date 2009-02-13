package com.topcoder.web.email.servlet.jsp.tag;


import javax.servlet.jsp.JspException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;


/**

 * Custom tag to display a combobox with a range of days from

 * 1 to however many days there are in the specified month of the year.

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 *

 */


public class DaySelectTag

        extends NumericRangeSelectTag {

    int month;

    int year;


    public DaySelectTag() {

    }


    public void setMonth(String month) {

        try {

            this.month = Integer.parseInt(month);

        } catch (NumberFormatException e) {

            this.month = (new GregorianCalendar()).get(Calendar.MONTH);

        }

    }


    public void setYear(String year) {

        try {

            this.year = Integer.parseInt(year);

        } catch (NumberFormatException e) {

            this.year = (new GregorianCalendar()).get(Calendar.YEAR);

        }

    }


    String getOptionValue(Object o) {

        return String.valueOf(o);

    }


    String getOptionText(Object o) {

        return String.valueOf(o);

    }


    ArrayList getSelectOptions()

            throws JspException {

        setLow("1");

        setHigh(String.valueOf(DateTagUtilities.getNumDaysInMonth(month, year)));

        setNumDigitsToDisplay("2");


        return super.getSelectOptions();

    }

}