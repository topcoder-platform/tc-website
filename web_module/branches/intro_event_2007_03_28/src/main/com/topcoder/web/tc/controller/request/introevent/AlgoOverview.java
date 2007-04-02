package com.topcoder.web.tc.controller.request.introevent;

import java.sql.Timestamp;

import org.hibernate.Query;

import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.IntroEvent;

public class AlgoOverview extends Base {

    private Timestamp codingStart = null;
    private Timestamp sysTestEnd = null;
    private String contestName = null;

    
    @Override
    protected void introEventProcessing() throws Exception {
        if (!getEvent().getType().getId().equals(EventType.INTRO_EVENT_ALGO_ID)) {
            throw new NavigationException("Invalid event type.");
        }
        getRequest().setAttribute("contestName", contestName);
        getRequest().setAttribute("roundStart", codingStart);
        getRequest().setAttribute("sysTestEnd", sysTestEnd);
        getRequest().setAttribute("eventStart", new Timestamp(codingStart.getTime()+(getMainEvent().getEventStartDelta()*1000*60)));
        getRequest().setAttribute("eventEnd", new Timestamp(codingStart.getTime()+(getMainEvent().getEventEndDelta()*1000*60)));
        getRequest().setAttribute("resultsTime", new Timestamp(sysTestEnd.getTime()+(getMainEvent().getResultsDelta())*1000*60));

        setNextIntroEventPage("algoOverview.jsp");

    }

    protected IntroEvent retrieveMainEvent(Long eventId) {
        String str = "select ie" +
                "   , rs1.startTime " +
                "   , rs2.endTime " +
                "   , r.contest.name " +
                " from IntroEvent as ie inner join fetch ie.timeZone" +
                "   , RoundSegment rs1" +
                "   , RoundSegment rs2 " +
                "   , Round r " +
                " where ie.id = :eventId " +
                " and ie.roundId = rs1.id.roundId " +
                " and rs1.id.segmentId=2 " +
                " and ie.roundId = rs2.id.roundId " +
                " and rs2.id.segmentId=5 " +
                " and r.id = ie.roundId";
        
        Query q = HibernateUtils.getSession().createQuery(str);
        q.setLong("eventId", eventId);
        Object[] r = (Object[]) q.uniqueResult();

        codingStart = (Timestamp) r[1];
        sysTestEnd = (Timestamp) r[2];
        contestName = (String) r[3];
        
        return (IntroEvent) r[0];
    }
}
