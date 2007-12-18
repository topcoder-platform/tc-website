package com.topcoder.web.common.tag;

import com.topcoder.util.format.ObjectFormatMethod;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class NumberFormatMethod implements ObjectFormatMethod {
    /* the NumberFormat to use to format numbers */
    private NumberFormat nf;

    /* the default format */
    private static final String DEFAULT_NUMBER_FORMAT = "#.##";

    public NumberFormatMethod() {
        this(DEFAULT_NUMBER_FORMAT);
    }

    public NumberFormatMethod(String format) {
        nf = NumberFormat.getInstance();
        ((DecimalFormat) nf).applyPattern(format);
    }

    public String format(Number num) {
        return nf.format(num);
    }

    public String format(Object obj) throws IllegalArgumentException {
        if (!(obj instanceof Number)) {
            throw new IllegalArgumentException("expected Number");
        }
        return format((Number) obj);
    }
}
