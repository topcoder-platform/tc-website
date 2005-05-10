package com.topcoder.web.common.tag;

import com.topcoder.util.format.FormatMethodFactory;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;
import com.topcoder.web.common.DateUtils;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Date;
import java.util.StringTokenizer;
import java.text.SimpleDateFormat;


public class FormatTag extends TagSupport {
    private final static Logger log = Logger.getLogger(FormatTag.class);
    private Object object = null;
    private String format = null;
    private String ifNull = "";
    private String timeZone = null;

    public int doStartTag() throws JspException {
        try {
            ObjectFormatter formatter = null;
            boolean isDate = false;
            if (object != null) {
                formatter = ObjectFormatterFactory.getEmptyFormatter();
                if (format != null) {
                    if (object instanceof Number) {
                        formatter.setFormatMethodForClass(Number.class,
                                new NumberFormatMethod(format), true);
                    } else if (object instanceof Date) {
                        isDate = true;
                        if (getTimeZone()!=null) object = DateUtils.getConvertedDate((Date)object, getTimeZone());
                        formatter.setFormatMethodForClass(Date.class,
                                FormatMethodFactory.getDefaultDateFormatMethod(format), true);
                        StringTokenizer st = new StringTokenizer(format);

                    }
                }
                formatter.setFormatMethodForClass(new Object().getClass(),
                            FormatMethodFactory.getDefaultObjectFormatMethod(), true);

                /**
                 * This chunk is an effort to provide support for z in the date
                 * formatter.  Unfortunately, the java implementation of Date does not
                 * provide timezone information, so we need to do something on our own.
                 * This is all i could come up with for now.  This code is really only
                 * supporting a single z, it will break if there are many z's
                 * in the format string as it will simply replace the first.
                 */
                StringBuffer ret = new StringBuffer(100);
                ret.append(formatter.format(object));
                if (isDate) {
                    String tz1 = new SimpleDateFormat("z").format(object);
                    log.debug("tz1: " + tz1 + " ret " + ret);
                    int start = ret.toString().indexOf(tz1);
                    if (start>-1) {
                        ret.replace(start, start+tz1.length(),
                                DateUtils.getUTCOffsetString(((Date)object), getTimeZone()));
                    }
                }
                pageContext.getOut().print(ret.toString());
            } else {
                pageContext.getOut().print(ifNull);
            }
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

    public void setTimeZone(String timeZone) {
        this.timeZone = timeZone;
    }

    protected String getTimeZone() {
        return timeZone;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public void setIfNull(String ifNull) {
        this.ifNull = ifNull;
    }

    /**
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     */
    public int doEndTag() throws JspException {
        this.object = null;
        this.format = null;
        this.ifNull = "";
        this.timeZone = null;
        return super.doEndTag();
    }

}
