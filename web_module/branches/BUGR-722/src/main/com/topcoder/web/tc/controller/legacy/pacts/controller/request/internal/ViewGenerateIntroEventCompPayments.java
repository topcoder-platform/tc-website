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
        List<Event> compEvents = new ArrayList<Event>();         
        for (IntroEvent ie : l) {
            for (Event e : ie.getChildren()) {
                if (e.getType().getId().equals(EventType.INTRO_EVENT_COMP_ID)) {
                    compEvents.add(e);
                }
            }
        }
            
        getRequest().setAttribute("events", compEvents);

        setNextPage(INTERNAL_VIEW_GENERATE_INTRO_EVENT_COMPONENT_PAYMENTS);        
        setIsNextPageInContext(true);

    }


}
