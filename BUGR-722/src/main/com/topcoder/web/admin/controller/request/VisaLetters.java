package com.topcoder.web.admin.controller.request;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.VisaLetterEventDAO;
import com.topcoder.web.common.dao.VisaLetterRequestDAO;
import com.topcoder.web.common.model.VisaLetterEvent;
import com.topcoder.web.common.model.VisaLetterRequest;
import com.topcoder.web.common.tag.ListSelectTag;

/**
 * @author  cucu
 */
public class VisaLetters extends ShortHibernateProcessor {

    public static final String FILTER_EVENT = "event";
    public static final String VIEW_DENIED = "denied";
    public static final String VIEW_SENT = "sent";
    public static final String VIEW_PENDING = "pending";

    public static final String PENDING = "p";
    public static final String SENT = "s";
    public static final String DENIED ="d";

    protected void dbProcessing() throws  Exception {

        boolean pending = true;
        boolean sent = false;
        boolean denied = false;
        Long eid;

        DAOFactory factory = DAOUtil.getFactory();

        VisaLetterEventDAO eventDAO =  factory.getVisaLetterEventDAO();
        VisaLetterRequestDAO reqDAO =  factory.getVisaLetterRequestDAO();

        if (getRequest().getParameter("update") != null) {
            String status = getRequest().getParameter("status");
            String []ids = getRequest().getParameterValues("selected");

            if (ids != null) {
                for (int i = 0; i < ids.length; i++) {
                    VisaLetterRequest r = reqDAO.find(new Long(ids[i]));
                    if (status.equals(PENDING)) {
                        r.setDenied(false);
                        r.setSentDate(null);
                    } else if (status.equals(SENT)) {
                        r.setDenied(false);
                        r.setSentDate(new Date());
                    } else if (status.equals(DENIED)) {
                        r.setDenied(true);
                        r.setSentDate(null);
                    } else {
                        throw new IllegalArgumentException("Invalid status code: " + status);
                    }
                    reqDAO.saveOrUpdate(r);
                }
                HibernateUtils.getSession().flush();
                getRequest().setAttribute("rowsUpdated", ids.length + "");
            }
        }

        if (getRequest().getParameter(FILTER_EVENT) != null) {
            pending = "true".equals(getRequest().getParameter(VIEW_PENDING));
            sent = "true".equals(getRequest().getParameter(VIEW_SENT));
            denied = "true".equals(getRequest().getParameter(VIEW_DENIED));

            eid =  new Long(getRequest().getParameter(FILTER_EVENT));
        } else {
            VisaLetterEvent event = eventDAO.findCurrent();
            eid = event==null? null : event.getId();
        }


        // Fill the event combo box
        List l = eventDAO.getAll();
        List eventList = new ArrayList();

        if (eid == null) {
            if (l.size() > 0) {
                eid = ((VisaLetterEvent) l.get(0)).getId();
            } else {
                setNextPage("/visaLetters.jsp");
                setIsNextPageInContext(true);
                return;
            }
        }

        for (int i = 0; i < l.size(); i++) {
            VisaLetterEvent e = (VisaLetterEvent) l.get(i);

            eventList.add(new ListSelectTag.Option(e.getId().toString(), e.getName(), e.getId().equals(eid)));
        }

        List reqs = reqDAO.find(eid, pending, sent, denied);

        getRequest().setAttribute(VIEW_PENDING, Boolean.valueOf(pending));
        getRequest().setAttribute(VIEW_SENT, Boolean.valueOf(sent));
        getRequest().setAttribute(VIEW_DENIED, Boolean.valueOf(denied));

        getRequest().setAttribute("eventList", eventList);
        getRequest().setAttribute("reqs", reqs);

        setNextPage("/visaLetters.jsp");
        setIsNextPageInContext(true);

    }


}
