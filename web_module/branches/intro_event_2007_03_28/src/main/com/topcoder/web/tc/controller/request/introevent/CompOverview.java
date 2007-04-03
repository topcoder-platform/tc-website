package com.topcoder.web.tc.controller.request.introevent;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.hibernate.Query;

import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.EventType;

public class CompOverview extends Base {

   
    @Override
    protected void introEventProcessing() throws Exception {
        if (!getEvent().getType().getId().equals(EventType.INTRO_EVENT_COMP_ID)) {
            throw new NavigationException("Invalid event type.");
        }

        // make that code nicer!
        Query q = HibernateUtils.getSession().createQuery("select min(c.startDate), max(c.startDate) from com.topcoder.web.common.model.comp.Contest c where c.event.id=:eventId");
        q.setLong("eventId", getEvent().getId());
        
        Object obj[] = (Object[]) q.uniqueResult();
        Date startDate = (Date) obj[0];
        Date endDate = (Date) obj[1];

        long dt = startDate.getTime() - endDate.getTime();        
        int weeks = (int) (dt / (7 * 24 * 60 * 60 * 1000)) + 1;
        
        Calendar startCal = Calendar.getInstance();
        startCal.setTime(startDate);

        Calendar endCal = Calendar.getInstance();
        endCal.setTime(endDate);

        SimpleDateFormat endFmt = new SimpleDateFormat("MMMMM d, yyyy");
        SimpleDateFormat startFmt = endFmt;

        if (startCal.get(Calendar.YEAR) == endCal.get(Calendar.YEAR)) {
            startFmt = new SimpleDateFormat("MMMMM d");
        }
        
        String start =  startFmt.format(startDate);
        String end =  endFmt.format(endDate);

        getRequest().setAttribute("startDate", startDate);
        getRequest().setAttribute("endDate", endDate);
        getRequest().setAttribute("startDateFormated", start);
        getRequest().setAttribute("endDateFormatted", end);
        getRequest().setAttribute("weeks", weeks);
        setNextIntroEventPage("compOverview.jsp");

    }
}
