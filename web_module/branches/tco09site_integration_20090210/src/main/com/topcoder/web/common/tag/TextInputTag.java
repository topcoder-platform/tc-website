package com.topcoder.web.common.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.format.FormatMethodFactory;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;
import com.topcoder.web.common.DateUtils;
import com.topcoder.web.common.StringUtils;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class TextInputTag extends BaseTag {
    protected static Logger log = Logger.getLogger(TextInputTag.class);
    private Object value;
    private int size = -1;
    private int maxlength = -1;
    private boolean passw = false;
    private String styleClass = null;
    private String onKeyPress = null;
    private boolean editable = true;
    private String format = null;
    private String timeZone = null;
    private boolean escapeHtml = true;
    private String onClick = null;
    private String style = null;

    public int doStartTag() {
        //log.debug("XXXX TextInputTag called for " + name);
        StringBuffer ret = new StringBuffer();

        if (editable) {
            //log.debug("editable");
            ret.append("<input type=\"").append(passw ? "password" : "text")
                    .append("\" name=\"").append(name).append("\" ");
            if (size >= 0) {
                ret.append("size=\"").append(size).append("\" ");
            }
            if (maxlength >= 0) {
                ret.append("maxlength=\"").append(maxlength).append("\" ");
            }
            if (styleClass != null) {
                ret.append("class=\"").append(styleClass).append("\" ");
            }
            if (style != null) {
                ret.append("style=\"").append(style).append("\" ");
            }
            if (onClick!=null) {
                ret.append("onclick=\"").append(onClick).append("\" ");
            }
            if (id != null) {
                ret.append("id=\"").append(id).append("\" ");
            }
            if (onKeyPress != null) {
                ret.append("onkeypress=\"").append(onKeyPress).append("\" ");
            }

            if (value == null) {
                value = getDefaultValue() == null ? null : getDefaultValue();
            }
            if (value != null) {
                ret.append("value=\"").append(format(value)).append("\" ");
            }
            ret.append("/>");
        } else {
            //log.debug("not editable");
            if (value == null) {
                value = getDefaultValue() == null ? null : getDefaultValue();
            }
            if (value != null) {
                ret.append(format(value));
            }
        }
        //log.debug("gonna print " + ret.toString());
        try {
            pageContext.getOut().print(ret.toString());
        } catch (java.io.IOException ioe) {
        }
        return SKIP_BODY;
    }

    public String format(final Object value) {
        ObjectFormatter formatter = ObjectFormatterFactory.getEmptyFormatter();
        Object object = value;
        if (format != null) {
            if (object instanceof Number) {
                formatter.setFormatMethodForClass(Number.class,
                        new NumberFormatMethod(format), true);
            } else if (object instanceof Date) {
                Calendar cal = Calendar.getInstance();
                if (timeZone != null) {
                    object = DateUtils.getConvertedDate((Date) object, timeZone);
                    cal.setTimeZone(TimeZone.getTimeZone(timeZone));
                } else {
                    cal.setTimeZone(TimeZone.getDefault());
                }
                cal.setTime((Date) object);
                object = cal;
                formatter.setFormatMethodForClass(Calendar.class,
                        new CalendarDateFormatMethod(format), true);
            }
        }
        formatter.setFormatMethodForClass(new Object().getClass(),
                FormatMethodFactory.getDefaultObjectFormatMethod(), true);
        if (escapeHtml) return StringUtils.htmlEncode(formatter.format(object));
        return formatter.format(object);
    }

    /**
     * Sets the value.
     *
     * @param value The value to set
     */
    public void setValue(String value) {
        this.value = value;
    }

    /**
     * Sets the maxlength.
     *
     * @param maxlength The maxlength to set
     */
    public void setMaxlength(int maxlength) {
        this.maxlength = maxlength;
    }

    /**
     * Sets the size.
     *
     * @param size The size to set
     */
    public void setSize(int size) {
        this.size = size;
    }

    /**
     * Sets the passw.
     *
     * @param passw The passw to set
     */
    public void setPassw(boolean passw) {
        this.passw = passw;
    }

    /**
     * Sets the aclass.
     *
     * @param aclass The aclass to set
     */
    public void setStyleClass(String aclass) {
        this.styleClass = aclass;
    }

    /**
     * Sets the onKeyPress.
     *
     * @param onKeyPress The onKeyPress to set
     */
    public void setOnKeyPress(String onKeyPress) {
        this.onKeyPress = onKeyPress;
    }

    /**
     * Sets the editable.
     *
     * @param edit The editable to set
     */
    public void setEditable(String edit) {
        editable = String.valueOf(true).equalsIgnoreCase(edit);
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public void setTimeZone(String timeZone) {
        this.timeZone = timeZone;
    }

    public void setEscapeHtml(boolean escapeHtml) {
        this.escapeHtml = escapeHtml;
    }

    public void setEscapeHtml(String escapeHtml) {
        this.escapeHtml = String.valueOf(true).equalsIgnoreCase(escapeHtml);
    }


    public void setOnClick(String onClick) {
        this.onClick = onClick;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    protected void init() {
        this.value = null;
        this.size = -1;
        this.maxlength = -1;
        this.passw = false;
        this.styleClass = null;
        this.onKeyPress = null;
        this.editable = true;
        this.format = null;
        this.escapeHtml = true;
        this.style = null;
        this.onClick = null;
    }


}
