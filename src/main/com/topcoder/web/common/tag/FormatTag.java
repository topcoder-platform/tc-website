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

    public int doStartTag() throws JspException {
        try {
            ObjectFormatter  formatter = null;
            if (object!=null) {
                formatter = ObjectFormatterFactory.getEmptyFormatter();
                if (format!=null) {
                    formatter.setFormatMethodForClass(new Date().getClass(),
                            FormatMethodFactory.getDefaultDateFormatMethod(format), true);
                }
                formatter.setFormatMethodForClass(new Object().getClass(),
                        FormatMethodFactory.getDefaultObjectFormatMethod(), true);
            }
            pageContext.getOut().print(formatter.format(object));
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

}
