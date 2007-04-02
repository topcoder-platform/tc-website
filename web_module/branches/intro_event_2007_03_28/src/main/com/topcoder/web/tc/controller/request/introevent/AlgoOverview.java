package com.topcoder.web.tc.controller.request.introevent;

import java.sql.Timestamp;

import org.hibernate.Query;

import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.model.IntroEvent;

public class AlgoOverview extends Base {

    private Timestamp codingStart = null;
    
    @Override
    protected void introEventProcessing() throws Exception {
        getRequest().setAttribute("roundStart", codingStart);
        getRequest().setAttribute("eventStart", new Timestamp(codingStart.getTime()+(getMainEvent().getRoundStart()*1000*60)));
        
        setNextIntroEventPage("algoOverview.jsp");

    }

    protected IntroEvent retrieveMainEvent(Long eventId) {
        String str = "select ie, rs1.startTime, rs2.endTime from IntroEvent as ie, RoundSegment rs1, RoundSegment rs2 " +
        " where ie.id = "+ eventId + " and ie.roundId = rs1.id.roundId and rs1.id.segmentId=2 and ie.roundId = rs2.id.roundId and rs2.id.segmentId=5";
        
        Query q = HibernateUtils.getSession().createQuery(str);
        Object [] r= (Object[]) q.uniqueResult();

        codingStart = (Timestamp) r[1];
        
        return (IntroEvent) r[0];
    }
}
