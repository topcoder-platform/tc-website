package com.topcoder.web.common.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Date;

import com.topcoder.util.format.FormatMethodFactory;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;


public class FormatTag  extends TagSupport {
    private Object object = null;
    private String format = null;
    private String ifNull = "";

    public int doStartTag() throws JspException {
        try {
            ObjectFormatter  formatter = null;
            if (object!=null) {
                formatter = ObjectFormatterFactory.getEmptyFormatter();
                if (format!=null) {
                    if (object instanceof Number) {
                        formatter.setFormatMethodForClass(Number.class,
                                new NumberFormatMethod(format), true);
                    } else if (object instanceof Date) {
                        formatter.setFormatMethodForClass(Date.class,
                                FormatMethodFactory.getDefaultDateFormatMethod(format), true);
                    }
                }
                formatter.setFormatMethodForClass(new Object().getClass(),
                        FormatMethodFactory.getDefaultObjectFormatMethod(), true);
                pageContext.getOut().print(formatter.format(object));
            } else {
                pageContext.getOut().print(ifNull);
            }
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
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
        return super.doEndTag();
    }

}
