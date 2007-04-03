package com.topcoder.web.tc.controller.request.introevent;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.voting.Pair;

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

        long dt = endDate.getTime() - startDate.getTime();        
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
        getRequest().setAttribute("startDateFormatted", start);
        getRequest().setAttribute("endDateFormatted", end);
        getRequest().setAttribute("weeks", weeks);

        q = HibernateUtils.getSession().createQuery("select cp.place, cp.prizeTypeId, min(cp.amount)" +
                " from com.topcoder.web.common.model.comp.ContestPrize cp " +
                " where cp.contest.event.id = :eventId " +
                " group by cp.place, cp.prizeTypeId " +
                " order by cp.place");
        q.setLong("eventId", getEvent().getId());
        List l = q.list();
        
        List<Double> weeklyPrizes = new ArrayList<Double>();
        List<Double> overallPrizes = new ArrayList<Double>();
        
        for (Object objects : l) {
            Object []o = (Object[]) objects;
            Integer type = (Integer) o[1];
            if (type.equals(12)) {  // fix: use constant!
                weeklyPrizes.add((Double) o[1]);
            }
            if (type.equals(13)) { // fix: use constant!
                overallPrizes.add((Double) o[1]);
            }
        }

        getRequest().setAttribute("weeklyPrizes", weeklyPrizes);
        getRequest().setAttribute("overallPrizes", overallPrizes);

        setNextIntroEventPage("compOverview.jsp");

    }
}
