package com.topcoder.web.tc.view.reg.tag;

import javax.servlet.jsp.JspException;
import java.util.ArrayList;

public class YearSelect
        extends Select {
    private static final int MIN_YEAR = 1900;
    private static final int MAX_YEAR = 2100;

    private int startYear = MIN_YEAR;
    private int endYear = MAX_YEAR;

    public void setStartYear(String startYear) {
        try {
            this.startYear = Integer.parseInt(startYear);
        } catch (Exception e) {
            this.startYear = MIN_YEAR;
        }
        this.startYear = Math.max(this.startYear, MIN_YEAR);
        this.startYear = Math.min(this.startYear, MAX_YEAR);
    }

    public void setEndYear(String endYear) {
        try {
            this.endYear = Integer.parseInt(endYear);
        } catch (Exception e) {
            this.endYear = MAX_YEAR;
        }
        this.endYear = Math.max(this.endYear, MIN_YEAR);
        this.endYear = Math.min(this.endYear, MAX_YEAR);
    }

    String getOptionValue(Object o) {
        return o.toString();
    }

    String getOptionText(Object o) {
        return o.toString();
    }

    ArrayList getSelectOptions()
            throws JspException {
        ArrayList years = new ArrayList();
        if (startYear > endYear) {
            for (int y = startYear; y >= endYear; y--) {
                years.add(new Integer(y));
            }
        } else {
            for (int y = startYear; y <= endYear; y++) {
                years.add(new Integer(y));
            }
        }
        return years;
    }
}
