package com.topcoder.shared.util;

import java.text.DecimalFormat;

/**
 * @author unknown
 * @version  $Revision$
 */
public class Formatters {
    private static DecimalFormat s_doubleFormatter = new DecimalFormat("0.00");

    /**
     *
     * @param d
     * @return
     */
    public static Double getDouble(double d) {
        return new Double(s_doubleFormatter.format(d));
    }

    /**
     *
     * @param d
     * @return
     */
    public static String getDoubleString(double d) {
        return s_doubleFormatter.format(d);
    }
}
