package com.topcoder.web.common.tag;

import com.topcoder.util.format.ObjectFormatMethod;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.DateUtils;
import com.topcoder.shared.util.logging.Logger;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 10, 2005
 */
public class CalendarDateFormatMethod implements ObjectFormatMethod {
    private final static Logger log = Logger.getLogger(CalendarDateFormatMethod.class);

    private static final String LONG_FORMAT = "zzz";
    private static final String MED_FORMAT = "zz";
    private static final String SHORT_FORMAT = "z";

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
        //log.debug("format string " + this.format);
    }

    public String format(Calendar cal) {
        Date d = cal.getTime();
        String ret = df.format(d);
        //log.debug("formatted : " + ret);
        TimeZone tz = cal.getTimeZone();
        ret = StringUtils.replace(ret, LONG_FORMAT, tz.getDisplayName(true, TimeZone.LONG));
        ret = StringUtils.replace(ret, MED_FORMAT, DateUtils.getUTCOffsetString(d, tz.getID()));
        ret = StringUtils.replace(ret, SHORT_FORMAT, tz.getDisplayName(true, TimeZone.SHORT));
        return ret;
    }

    private final static int OUT = 0;
    private final static int IN = 1;
    private String escape(String s) {
        int state = OUT;
        StringBuffer ret = new StringBuffer(s.length()+10);
        for (int i=0; i<s.length(); i++) {
            char ch = s.charAt(i);
            if (ch=='z'&&state==OUT) {
                ret.append('\'');
                state = IN;
            } else if (ch!='z'&&state==IN) {
                ret.append('\'');
                state = OUT;
            }
            ret.append(ch);
        }
        if (state==IN) {
            ret.append('\'');
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


