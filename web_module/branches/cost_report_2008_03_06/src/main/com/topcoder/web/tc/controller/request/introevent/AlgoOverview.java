package com.topcoder.web.tc.controller.request.introevent;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.Pair;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.IntroEventConfig;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 * Display an overview of the algorithm competition.
 * 
 * @author Cucu
 */
public class AlgoOverview extends Base {
    public static final Integer ROUND_START_ID = -1;
    public static final Integer SYS_TEST_END_ID = -2;
    
    @Override
    protected void introEventProcessing() throws Exception {
        if (!getEvent().getType().getId().equals(EventType.INTRO_EVENT_ALGO_ID)) {
            throw new NavigationException("Invalid event type.");
        }
        
        Timestamp codingStart = getMainEvent().getRoundStart();
        Timestamp sysTestEnd = getMainEvent().getRoundEnd();
        
        getRequest().setAttribute("contestName",  getMainEvent().getRoundName());
        getRequest().setAttribute("roundStart", codingStart);
        getRequest().setAttribute("sysTestEnd", sysTestEnd);

        Pair<Integer, Timestamp> h;

        ArrayList<Pair<Integer, Timestamp>> schedule = new ArrayList<Pair<Integer, Timestamp>>(10);
        schedule.add(new Pair<Integer, Timestamp>(ROUND_START_ID, codingStart));
        schedule.add(new Pair<Integer, Timestamp>(SYS_TEST_END_ID, sysTestEnd));

        IntroEventConfig tempConfig;
        tempConfig = getMainEvent().getConfig(IntroEventConfig.EVENT_START_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            Timestamp t = new Timestamp(codingStart.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60));
            getRequest().setAttribute("eventStart", t);
            h= new Pair<Integer, Timestamp>(IntroEventConfig.EVENT_START_PROP_ID, t);
            schedule.add(h);
        }

        tempConfig = getMainEvent().getConfig(IntroEventConfig.EVENT_END_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            Timestamp t = new Timestamp(codingStart.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60));
            getRequest().setAttribute("eventEnd", t);
            h= new Pair<Integer, Timestamp>(IntroEventConfig.EVENT_END_PROP_ID, t);
            schedule.add(h);
        }

        tempConfig = getMainEvent().getConfig(IntroEventConfig.RESULTS_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            Timestamp t =new Timestamp(sysTestEnd.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60));
            getRequest().setAttribute("resultsTime", t);
            h= new Pair<Integer, Timestamp>(IntroEventConfig.RESULTS_PROP_ID, t);
            schedule.add(h);
        }

        tempConfig = getMainEvent().getConfig(IntroEventConfig.FOOD_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            Timestamp t =new Timestamp(codingStart.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60));
            getRequest().setAttribute("foodTime", t);
            h= new Pair<Integer, Timestamp>(IntroEventConfig.FOOD_PROP_ID, t);
            schedule.add(h);
        }

        tempConfig = getMainEvent().getConfig(IntroEventConfig.PRESENTATION_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            Timestamp t =new Timestamp(codingStart.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60));
            getRequest().setAttribute("presentationTime", t);
            h= new Pair<Integer, Timestamp>(IntroEventConfig.PRESENTATION_PROP_ID, t);
            schedule.add(h);
        }

        tempConfig = getMainEvent().getConfig(IntroEventConfig.PRIZES_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            Timestamp t =new Timestamp(codingStart.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60));
            getRequest().setAttribute("prizeTime", t);
            h= new Pair<Integer, Timestamp>(IntroEventConfig.PRIZES_PROP_ID, t);
            schedule.add(h);
        }

        tempConfig = getMainEvent().getConfig(IntroEventConfig.FOOD_PRESENTATION_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            Timestamp t =new Timestamp(codingStart.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60));
            getRequest().setAttribute("foodPresentationTime", t);
            h= new Pair<Integer, Timestamp>(IntroEventConfig.FOOD_PRESENTATION_PROP_ID, t);
            schedule.add(h);
        }
        setNextIntroEventPage("algoOverview.jsp");


        Collections.sort(schedule, new Comparator<Pair<Integer, Timestamp>>(){
            public int compare(Pair<Integer, Timestamp> o1, Pair<Integer, Timestamp> o2) {
                return o1.getB().compareTo(o2.getB());
            }
        });

        getRequest().setAttribute("schedule", schedule);
    }


}
