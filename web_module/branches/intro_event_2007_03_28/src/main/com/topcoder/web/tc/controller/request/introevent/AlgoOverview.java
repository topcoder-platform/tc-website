package com.topcoder.web.tc.controller.request.introevent;

import java.sql.Timestamp;

import org.hibernate.Query;

import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.model.IntroEvent;

public class AlgoOverview extends Base {

    private Timestamp codingStart = null;
    private Timestamp sysTestEnd = null;
    private String contestName = null;

    
    @Override
    protected void introEventProcessing() throws Exception {
        getRequest().setAttribute("contestName", contestName);
        getRequest().setAttribute("roundStart", codingStart);
        getRequest().setAttribute("sysTestEnd", sysTestEnd);
        getRequest().setAttribute("eventStart", new Timestamp(codingStart.getTime()+(getMainEvent().getEventStartDelta()*1000*60)));
        getRequest().setAttribute("eventEnd", new Timestamp(codingStart.getTime()+(getMainEvent().getEventEndDelta()*1000*60)));
        getRequest().setAttribute("resultsTime", new Timestamp(codingStart.getTime()+(getMainEvent().getResultsDelta())*1000*60));

        setNextIntroEventPage("algoOverview.jsp");

    }

    protected IntroEvent retrieveMainEvent(Long eventId) {
        String str = "select ie" +
                "   , rs1.startTime " +
                "   , rs2.endTime " +
                "   , r.contest.name " +
                " from IntroEvent as ie" +
                "   , RoundSegment rs1" +
                "   , RoundSegment rs2 " +
                "   , Round r " +
                " where ie.id = ? " +
                " and ie.roundId = rs1.id.roundId " +
                " and rs1.id.segmentId=2 " +
                " and ie.roundId = rs2.id.roundId " +
                " and rs2.id.segmentId=5 " +
                " and r.id = ie.roundId";
        
        Query q = HibernateUtils.getSession().createQuery(str);
        q.setLong(1, eventId);
        Object[] r = (Object[]) q.uniqueResult();

        codingStart = (Timestamp) r[1];
        sysTestEnd = (Timestamp) r[1];
        contestName = (String) r[2];
        
        return (IntroEvent) r[0];
    }
}
