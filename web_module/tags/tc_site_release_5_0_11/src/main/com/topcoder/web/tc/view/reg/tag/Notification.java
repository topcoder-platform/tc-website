package com.topcoder.web.tc.view.reg.tag;

import com.topcoder.common.web.data.Notify;
import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.CachedQueryDataAccess;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import javax.naming.Context;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Notification
        extends BodyTagSupport {
    public static final String NOTIFY_ID = "notifyId";
    public static final String NOTIFY_NAME = "notifyName";
    public static final String NOTIFY = "notifyControl";
    public static final String PREFIX = "notify_";
    public static final String DESC_PREFIX = "desc_";

    Iterator notifications;

    private String styleClass;
    private boolean selectedOnly;
    private Set selectedValues;


    public Notification() {
        super();
        init();
    }


    void init() {
        notifications = null;
        styleClass = null;
        selectedValues = null;
        selectedOnly = false;
    }


    public void setStyleClass(String ccsclass) {
        this.styleClass = ccsclass;
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
            return EVAL_BODY_AGAIN;
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
            QueryRequest r = new QueryRequest();
            r.addQuery("notify_list", "select notify_id, name, sort from notify_lu where status = 'A' order by sort");
            CachedQueryDataAccess dataAccess = new CachedQueryDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            ResultSetContainer rsc = (ResultSetContainer)dataAccess.getData(r).get("notify_list");
            Notify temp = null;
            ResultSetContainer.ResultSetRow row = null;
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)it.next();
                temp = new Notify();
                temp.setName(row.getStringItem("name"));
                temp.setNotifyId(row.getIntItem("notify_id"));
                temp.setSort(row.getIntItem("sort"));
                cachedNotifications.add(temp);
            }
/*
            DataCache cache = Cache.get();
            cachedNotifications.addAll(cache.getNotifications());
*/
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

        if (styleClass != null) {
            s.append(" class=\"" + styleClass + "\"");
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
            if (styleClass != null) {
                s.append(" class=\"" + styleClass + "\"");
            }
            s.append(">");
            s.append(desc);
            s.append("</span>");
        }
        return s.toString();
    }


}
