package com.topcoder.web.common.tag;

import com.topcoder.util.format.ObjectFormatMethod;
import com.topcoder.web.common.StringUtils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 10, 2005
 */
public class CalendarDateFormatMethod implements ObjectFormatMethod {

    private static final String LONG_FORMAT = "zzz";
    private static final String MED_FORMAT = "zz";
    private static final String SHORT_FORMAT = "z";
    private static final String[] FORMATS = {LONG_FORMAT, MED_FORMAT, SHORT_FORMAT};

    /* the NumberFormat to use to format numbers */
    private DateFormat df = null;;
    private String format = null;


    /* the default format */
    private static final String DEFAULT_DATE_FORMAT = "MM.dd.yyyy HH:mm";

    public CalendarDateFormatMethod() {
        this(DEFAULT_DATE_FORMAT);
    }

    public CalendarDateFormatMethod(String format) {
        this.format = escape(format);
        df = new SimpleDateFormat(this.format);
    }

    public String format(Calendar cal) {
        Date d = cal.getTime();
        return descape(df.format(d));
    }

    private String descape(String s) {
        String ret = s;
        for (int i = 0; i < FORMATS.length; i++) {
            String deplacement = "'" + FORMATS[i] + "'";
            ret = StringUtils.replace(ret, deplacement, FORMATS[i]);
        }
        return ret.toString();
    }

    private String escape(String s) {
        String ret = s;
        for (int i = 0; i < FORMATS.length; i++) {
            String replacement = "'" + FORMATS[i] + "'";
            ret = StringUtils.replace(ret, FORMATS[i], replacement);
        }
        return ret.toString();
    }


    public String format(Object obj) throws IllegalArgumentException {
        if (!(obj instanceof Calendar)) {
            throw new IllegalArgumentException("expected a Calendar object");
        }
        return format((Calendar) obj);
    }
}


