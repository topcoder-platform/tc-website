package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.VisaLetterRequestDAO;

/**
 * Display the status of a visa letter request for an event.
 * 
 * @author cucu
 */
public class VisaLetterRequestStatus extends ShortHibernateProcessor {



    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        if (getRequest().getParameter(VisaLetterRequest.EVENT_ID) == null) {
            throw new NavigationException("Expected " + VisaLetterRequest.EVENT_ID + " parameter");
        }
        
        Long userId  = new Long(getUser().getId());
        Long eventId = new Long(getRequest().getParameter(VisaLetterRequest.EVENT_ID));

        VisaLetterRequestDAO reqDAO =  DAOUtil.getFactory().getVisaLetterRequestDAO();

        com.topcoder.web.common.model.VisaLetterRequest req = reqDAO.find(userId, eventId);

        if (req == null) {
            throw new NavigationException("Event or Visa Letter Request not found");
        }
        
        getRequest().setAttribute("req", req);
        setNextPage(com.topcoder.web.tc.Constants.VISA_LETTER_REQUEST_STATUS);

        setIsNextPageInContext(true);
    }

}
