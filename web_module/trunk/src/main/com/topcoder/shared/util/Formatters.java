package com.topcoder.shared.util;

import java.text.*;

public class Formatters
{
    private static DecimalFormat s_doubleFormatter = new DecimalFormat("0.00");

    public static Double getDouble( double d )
    {
        return new Double( s_doubleFormatter.format( d ) );
    }
    public static String getDoubleString( double d )
    {
        return s_doubleFormatter.format( d );
    }
}
