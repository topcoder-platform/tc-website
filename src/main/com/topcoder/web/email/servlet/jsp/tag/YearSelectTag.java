package com.topcoder.web.email.servlet.jsp.tag;


import javax.servlet.jsp.JspException;
import java.util.*;


/**

 * Custom tag to create a combobox of years.  The first entry will be the

 * current year.  The number of years to include in the combobox is

 * determined by the numYearsAhead property.

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 *

 */


public class YearSelectTag

        extends Select {

    // number of years ahead of the current year to consider

    int numYearsAhead;

    // year to start at

    int startingYear;


    public YearSelectTag() {

        startingYear = (new GregorianCalendar()).get(Calendar.YEAR);

        numYearsAhead = 0;

    }


    public void setNumYearsAhead(String numYearsAhead) {

        try {

            this.numYearsAhead = Integer.parseInt(numYearsAhead);

        } catch (Exception e) {

            this.numYearsAhead = 0;

        }

    }


    public void setStartingYear(String startingYear) {

        try {

            this.startingYear = Integer.parseInt(startingYear);

        } catch (Exception e) {

            // default to current year

            this.startingYear = (new GregorianCalendar()).get(Calendar.YEAR);

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

        ArrayList years = new ArrayList();

        for (int i = 0; i <= numYearsAhead; i++) {

            years.add(new Integer(startingYear + i));

        }


        return years;

    }

}