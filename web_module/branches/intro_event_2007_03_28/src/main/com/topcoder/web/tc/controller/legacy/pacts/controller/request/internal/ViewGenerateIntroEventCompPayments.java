package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.IntroEvent;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

public class ViewGenerateIntroEventCompPayments extends ShortHibernateProcessor implements PactsConstants {

    @Override
    protected void dbProcessing() throws Exception {

        List<IntroEvent> l = DAOUtil.getFactory().getIntroEventDAO().getList();

        // filter the events that have component competitions.
        List<IntroEvent> compEvents = new ArrayList<IntroEvent>();         
        for (IntroEvent ie : l) {
            boolean hasComp = false;
            for (Event e : ie.getChildren()) {
                if (e.getType().equals(EventType.INTRO_EVENT_COMP_ID)) {
                    hasComp = true;
                }
            }
            if (hasComp) {
                compEvents.add(ie);
            }
        }
            
        getRequest().setAttribute("events", compEvents);

        setNextPage(INTERNAL_VIEW_GENERATE_INTRO_EVENT_COMPONENT_PAYMENTS);        
        setIsNextPageInContext(true);

    }


}
