package com.topcoder.web.common.tag;

import com.topcoder.util.format.ObjectFormatMethod;

import java.text.NumberFormat;
import java.text.DecimalFormat;

public class NumberFormatMethod implements ObjectFormatMethod {
    private String format; // the format string

    /* the SimpleDateFormat to use to format numbers */
    private NumberFormat nf;

    /* the default format */
    private static final String DEFAULT_NUMBER_FORMAT = "#.##";

    public NumberFormatMethod() {
        this(DEFAULT_NUMBER_FORMAT, null);
    }

    public NumberFormatMethod(String format) {
        this(format, null);
    }

    NumberFormatMethod(String format, NumberFormat nf)
            throws IllegalArgumentException {

        if (format==null) this.format = DEFAULT_NUMBER_FORMAT;
        else this.format = format;
        if (nf==null) this.nf = NumberFormat.getInstance();
        else this.nf = (NumberFormat)nf.clone();
        ((DecimalFormat)nf).applyPattern(format);

    }

    public String format(Number num) {
        return nf.format(num);
    }

    public String format(Object obj) throws IllegalArgumentException {
        if (!(obj instanceof Number)) {
            throw new IllegalArgumentException("expected Number");
        }

        return format((Number)obj);
    }
}
