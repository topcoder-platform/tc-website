package com.topcoder.web.stat.servlet.jsp.tag;

import java.util.Locale;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.Format;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import org.apache.struts.util.MessageResources;
import org.apache.struts.util.RequestUtils;
import org.apache.struts.util.ResponseUtils;

public class Formatter extends TagSupport {
    public static final String SQL_TIMESTAMP_FORMAT_KEY = "org.apache.struts.taglib.bean.format.sql.timestamp";
    public static final String SQL_DATE_FORMAT_KEY = "org.apache.struts.taglib.bean.format.sql.date";
    public static final String SQL_TIME_FORMAT_KEY = "org.apache.struts.taglib.bean.format.sql.time";
    public static final String DATE_FORMAT_KEY = "org.apache.struts.taglib.bean.format.date";
    public static final String INT_FORMAT_KEY = "org.apache.struts.taglib.bean.format.int";
    public static final String FLOAT_FORMAT_KEY = "org.apache.struts.taglib.bean.format.float";
    protected static MessageResources messages = MessageResources.getMessageResources("org.apache.struts.taglib.bean.LocalStrings");
    protected boolean filter;
    protected boolean ignore;
    protected String name;
    protected String property;
    protected String scope;
    protected String formatStr;
    protected String formatKey;
    protected String localeKey;
    protected String bundle;

    public Formatter() {
        filter = true;
        ignore = false;
        name = null;
        property = null;
        scope = null;
        formatStr = null;
        formatKey = null;
        localeKey = "org.apache.struts.action.LOCALE";
        bundle = "org.apache.struts.action.MESSAGE";
    }

    public boolean getFilter() {
        return filter;
    }

    public void setFilter(boolean filter) {
        this.filter = filter;
    }

    public boolean getIgnore() {
        return ignore;
    }

    public void setIgnore(boolean ignore) {
        this.ignore = ignore;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getFormat() {
        return formatStr;
    }

    public void setFormat(String formatStr) {
        this.formatStr = formatStr;
    }

    public String getFormatKey() {
        return formatKey;
    }

    public void setFormatKey(String formatKey) {
        this.formatKey = formatKey;
    }

    public String getLocale() {
        return localeKey;
    }

    public void setLocale(String localeKey) {
        this.localeKey = localeKey;
    }

    public String getBundle() {
        return bundle;
    }

    public void setBundle(String bundle) {
        this.bundle = bundle;
    }

    public int doStartTag() throws JspException {
        Object bean = null;
        if(ignore && RequestUtils.lookup(super.pageContext, name, scope) == null)
            return 0;
        Object value = RequestUtils.lookup(super.pageContext, name, property, scope);
        if(value == null)
            return 0;
        String output = formatValue(value);
        if(filter)
            ResponseUtils.write(super.pageContext, ResponseUtils.filter(output));
        else
            ResponseUtils.write(super.pageContext, output);
        return 0;
    }

    protected String retrieveFormatString(String formatKey) throws JspException {
        String result = RequestUtils.message(super.pageContext, bundle, localeKey, formatKey);
        if(result != null && (!result.startsWith("???") || !result.endsWith("???")))
            return result;
        else
            return null;
    }

    protected String formatValue(Object valueToFormat) throws JspException {
        Format format = null;
        Object value = valueToFormat;
        /* force to the locale of our JVM */
        java.util.Locale locale = Locale.getDefault();
        /* the following isn't ready as of struts 1.02, but will be included in later versions */
//        java.util.Locale locale = RequestUtils.retrieveUserLocale(super.pageContext, localeKey);
        boolean formatStrFromResources = false;
        if(value instanceof String)
            return (String)value;
        if(formatStr == null && formatKey != null)
        {
            formatStr = retrieveFormatString(formatKey);
            if(formatStr != null)
                formatStrFromResources = true;
        }
        if(value instanceof Number)
        {
            if(formatStr == null)
            {
                if((value instanceof Byte) || (value instanceof Short) || (value instanceof Integer) || (value instanceof Long) || (value instanceof BigInteger))
                    formatStr = retrieveFormatString("org.apache.struts.taglib.bean.format.int");
                else
                if((value instanceof Float) || (value instanceof Double) || (value instanceof BigDecimal))
                    formatStr = retrieveFormatString("org.apache.struts.taglib.bean.format.float");
                if(formatStr != null)
                    formatStrFromResources = true;
            }
            if(formatStr != null)
                try
                {
                    format = NumberFormat.getNumberInstance(locale);
                    if(formatStrFromResources)
                        ((DecimalFormat)format).applyLocalizedPattern(formatStr);
                    else
                        ((DecimalFormat)format).applyPattern(formatStr);
                }
                catch(IllegalArgumentException illegalargumentexception)
                {
                    JspException e = new JspException(messages.getMessage("write.format", formatStr));
                    RequestUtils.saveException(super.pageContext, e);
                    throw e;
                }
        } else
        if(value instanceof Date)
        {
            if(formatStr == null)
            {
                if(value instanceof Timestamp)
                    formatStr = retrieveFormatString("org.apache.struts.taglib.bean.format.sql.timestamp");
                else
                if(value instanceof java.sql.Date)
                    formatStr = retrieveFormatString("org.apache.struts.taglib.bean.format.sql.date");
                else
                if(value instanceof Time)
                    formatStr = retrieveFormatString("org.apache.struts.taglib.bean.format.sql.time");
                else
                if(value instanceof Date)
                    formatStr = retrieveFormatString("org.apache.struts.taglib.bean.format.date");
                if(formatStr != null)
                    formatStrFromResources = true;
            }
            if(formatStr != null)
                if(formatStrFromResources)
                    format = new SimpleDateFormat(formatStr, locale);
                else
                    format = new SimpleDateFormat(formatStr);
        }
        if(format != null)
            return format.format(value);
        else
            return value.toString();
    }

    public void release() {
        super.release();
        filter = true;
        ignore = false;
        name = null;
        property = null;
        scope = null;
        formatStr = null;
        localeKey = null;
        bundle = null;
    }
}
