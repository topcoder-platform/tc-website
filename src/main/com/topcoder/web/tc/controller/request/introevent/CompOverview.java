package com.topcoder.web.tc.controller.request.introevent;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.comp.ContestPrize;

/**
 * Display an overview of the component competition.
 * 
 * @author Cucu
 *
 */
public class CompOverview extends Base {

   
    @Override
    protected void introEventProcessing() throws Exception {
        if (!getEvent().getType().getId().equals(EventType.INTRO_EVENT_COMP_ID)) {
            throw new NavigationException("Invalid event type.");
        }


        Date[] dates = DAOUtil.getFactory().getEventDAO().getComponentContestDates(getEvent().getId());
        
        Date startDate = dates[0];
        Date endDate = dates[1];

        long dt = endDate.getTime() - startDate.getTime();        
        int weeks = (int) (dt / (7 * 24 * 60 * 60 * 1000)) + 1;
        
        Calendar startCal = Calendar.getInstance();
        startCal.setTime(startDate);

        Calendar endCal = Calendar.getInstance();
        endCal.setTime(endDate);

        // format dates.  Start date uses the year only if the year is different than the end date.
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

        // Find out the prizes for the contest
        List<ContestPrize> prizes = DAOUtil.getFactory().getContestPrizeDAO().getPrizesForEvent(getEvent().getId());
        List<Double> weeklyPrizes = new ArrayList<Double>();
        List<Double> overallPrizes = new ArrayList<Double>();
        
        for (ContestPrize prize : prizes) {
            if (prize.getPrizeTypeId().equals(ContestPrize.CONTEST_PRIZE_INTRO_EVENT_WEEKLY)) {  
                weeklyPrizes.add(prize.getAmount());
            }
            if (prize.getPrizeTypeId().equals(ContestPrize.CONTEST_PRIZE_INTRO_EVENT_OVERALL)) {
                overallPrizes.add(prize.getAmount());
            }
        }

        getRequest().setAttribute("weeklyPrizes", weeklyPrizes);
        getRequest().setAttribute("overallPrizes", overallPrizes);

        setNextIntroEventPage("compOverview.jsp");

    }
        
    
}
