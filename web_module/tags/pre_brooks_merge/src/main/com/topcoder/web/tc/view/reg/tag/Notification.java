package com.topcoder.web.tc.view.reg.tag;

import com.topcoder.common.web.data.Notify;
import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.DataCache.DataCache;

import javax.naming.Context;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.util.*;

public class Notification
        extends BodyTagSupport {
    public static final String NOTIFY_ID = "notifyId";
    public static final String NOTIFY_NAME = "notifyName";
    public static final String NOTIFY = "notifyControl";
    public static final String PREFIX = "notify_";
    public static final String DESC_PREFIX = "desc_";

    Iterator notifications;

    private String ccsclass;
    private boolean selectedOnly;
    private Set selectedValues;


    public Notification() {
        super();
        init();
    }


    void init() {
        notifications = null;
        ccsclass = null;
        selectedValues = null;
        selectedOnly = false;
    }


    public void setClass(String ccsclass) {
        this.ccsclass = ccsclass;
    }


    public void setSelectedOnly(boolean selectedOnly) {
        this.selectedOnly = selectedOnly;
    }


    public void setSelectedValues(Set selectedValues) {
        this.selectedValues = selectedValues;
    }


    public boolean getSelectedOnly() {
        return this.selectedOnly;
    }


    public Set getSelectedValues() {
        if (this.selectedValues == null) {
            this.selectedValues = new HashSet();
        }
        return this.selectedValues;
    }


    public int doStartTag()
            throws JspException {
        notifications = getNotifications().iterator();
        return doAfterBody();
    }


    public int doAfterBody()
            throws JspException {
        if (notifications.hasNext()) {
            Notify notify = (Notify) notifications.next();
            String notifyId = Integer.toString(notify.getNotifyId());
            String control = null;
            if (selectedOnly) {
                control = buildDisplay(notifyId, notify.getName());
            } else {
                control = buildText(notifyId);
            }
            pageContext.setAttribute(NOTIFY_ID, notifyId, PageContext.PAGE_SCOPE);
            pageContext.setAttribute(NOTIFY_NAME, notify.getName(), PageContext.PAGE_SCOPE);
            pageContext.setAttribute(NOTIFY, control, PageContext.PAGE_SCOPE);
            return EVAL_BODY_TAG;
        } else {
            if (bodyContent != null && bodyContent.getEnclosingWriter() != null) {
                try {
                    bodyContent.writeOut(bodyContent.getEnclosingWriter());
                } catch (Exception e) {
                    throw new JspException(e.toString());
                }
            }
            return SKIP_BODY;
        }
    }


    public int doEndTag()
            throws JspException {
        notifications = null;
        return EVAL_PAGE;
    }


    public static ArrayList getNotifications()
            throws JspException {
        ArrayList cachedNotifications = new ArrayList();
        Context context = null;
        try {
            DataCache cache = Cache.get();
            cachedNotifications.addAll(cache.getNotifications());
        } catch (Exception e) {
            throw new JspException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (Exception e) {
                }
            }
        }
        return cachedNotifications;
    }


    String buildText(String selectedKey)
            throws JspException {
        StringBuffer s = new StringBuffer(500);
        s.append("<input type=\"checkbox\"");
        s.append(" name=\"");
        s.append(PREFIX);
        s.append(selectedKey);
        s.append("\"");

        if (ccsclass != null) {
            s.append(" class=\"" + ccsclass + "\"");
        }
        if (selectedValues.contains(selectedKey)) {
            s.append(" checked=\"true\"");
        }
        s.append(" />");
        return s.toString();
    }


    String buildDisplay(String selectedKey, String desc)
            throws JspException {
        StringBuffer s = new StringBuffer(500);
        if (selectedValues.contains(selectedKey)) {
            s.append("<span");
            if (ccsclass != null) {
                s.append(" class=\"" + ccsclass + "\"");
            }
            s.append(">");
            s.append(desc);
            s.append("</span>");
        }
        return s.toString();
    }


}
