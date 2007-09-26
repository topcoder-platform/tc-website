package com.topcoder.web.tc.controller.request.introevent;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.IntroEventConfig;

import java.sql.Timestamp;

/**
 * Display an overview of the algorithm competition.
 * 
 * @author Cucu
 */
public class AlgoOverview extends Base {
    
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

        //todo figure out a way to order these and put them in the request so that we can loop through and display them.

        IntroEventConfig tempConfig = null;
        tempConfig = getMainEvent().getConfig(IntroEventConfig.EVENT_START_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            getRequest().setAttribute("eventStart", new Timestamp(codingStart.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60)));
        }

        tempConfig = getMainEvent().getConfig(IntroEventConfig.EVENT_END_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            getRequest().setAttribute("eventEnd", new Timestamp(codingStart.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60)));
        }

        tempConfig = getMainEvent().getConfig(IntroEventConfig.RESULTS_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            getRequest().setAttribute("resultsTime", new Timestamp(sysTestEnd.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60)));
        }

        tempConfig = getMainEvent().getConfig(IntroEventConfig.FOOD_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            getRequest().setAttribute("foodTime", new Timestamp(codingStart.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60)));
        }

        tempConfig = getMainEvent().getConfig(IntroEventConfig.PRESENTATION_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            getRequest().setAttribute("presentationTime", new Timestamp(codingStart.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60)));
        }

        tempConfig = getMainEvent().getConfig(IntroEventConfig.PRIZES_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            getRequest().setAttribute("prizeTime", new Timestamp(codingStart.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60)));
        }

        tempConfig = getMainEvent().getConfig(IntroEventConfig.FOOD_PRESENTATION_PROP_ID);
        if (tempConfig!=null && !"".equals(StringUtils.checkNull(tempConfig.getValue()))) {
            getRequest().setAttribute("foodPresentationTime", new Timestamp(codingStart.getTime()+(Integer.parseInt(tempConfig.getValue())*1000*60)));
        }
        setNextIntroEventPage("algoOverview.jsp");
    }


}
