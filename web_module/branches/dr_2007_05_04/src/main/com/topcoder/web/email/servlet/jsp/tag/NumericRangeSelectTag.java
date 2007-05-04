package com.topcoder.web.email.servlet.jsp.tag;


import javax.servlet.jsp.JspException;
import java.util.ArrayList;


/**

 * Custom tag to display a combobox with a range of numbers.

 * The low and high properties determine the range.  The numDigitsToDisplay

 * property is used to determine the minimum number of digits to display

 * for each number.

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 *

 */


public class NumericRangeSelectTag

        extends Select {

    // numbers range from 'low' to 'high' inclusive

    int low;

    int high;

    // the minimum number of digits to display

    int numDigitsToDisplay;


    public void setLow(String low) {

        try {

            this.low = Integer.parseInt(low);

        } catch (NumberFormatException e) {

            this.low = 0;

        }

    }


    public void setHigh(String high) {

        try {

            this.high = Integer.parseInt(high);

        } catch (NumberFormatException e) {

            this.high = 0;

        }

    }


    public void setNumDigitsToDisplay(String numDigitsToDisplay) {

        try {

            this.numDigitsToDisplay = Integer.parseInt(numDigitsToDisplay);

        } catch (NumberFormatException e) {

            this.numDigitsToDisplay = 0;

        }

    }


    public NumericRangeSelectTag() {

    }


    String getOptionValue(Object o) {

        return String.valueOf(o);

    }


    String getOptionText(Object o) {

        return String.valueOf(o);

    }


    ArrayList getSelectOptions()

            throws JspException {

        ArrayList numbers = new ArrayList();

        for (int i = low; i <= high; i++) {

            String numberString = String.valueOf(i);

            // pad with leading zeros

            while (numberString.length() < numDigitsToDisplay) {

                numberString = "0" + numberString;

            }

            numbers.add(numberString);

        }

        return numbers;

    }

}