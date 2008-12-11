package com.topcoder.web.tc.controller.request.util;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.VisaLetterEventDAO;
import com.topcoder.web.common.dao.VisaLetterRequestDAO;
import com.topcoder.web.common.model.VisaLetterEvent;

/**
 * Gives a list of events in which the user asked for visa letter.
 * If there is just one event, it redirects to the status page directly.
 * 
 * @author cucu
 */
public class VisaSelection extends ShortHibernateProcessor {

    @SuppressWarnings("unchecked")
    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        Long userId  = new Long(getUser().getId());

        VisaLetterEventDAO eventDAO =  DAOUtil.getFactory().getVisaLetterEventDAO();
        VisaLetterRequestDAO reqDAO =  DAOUtil.getFactory().getVisaLetterRequestDAO();
        
        
        List<VisaLetterEvent> allEvents = eventDAO.findShowStatus();
        List<VisaLetterEvent> events = new ArrayList<VisaLetterEvent>();

        // find all the events where the coder has requests.
        for (VisaLetterEvent e : allEvents) {
            com.topcoder.web.common.model.VisaLetterRequest req = reqDAO.find(userId, e.getId());
            
            if (req != null) {
                events.add(e);
            }
        }

        // one request, go directly to status page.
        if (events.size() == 1) {
            setNextPage("http://" + ApplicationServer.SERVER_NAME + "/tc?module=VisaLetterRequestStatus&eid=" + events.get(0).getId());            
            setIsNextPageInContext(false);
            return;            
        }

        getRequest().setAttribute("events", events);
        setNextPage(com.topcoder.web.tc.Constants.VISA_SELECTION);
        setIsNextPageInContext(true);
        return;
    }

}
