package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.VisaLetterRequestDAO;
import com.topcoder.web.tc.Constants;

/**
 * @author cucu
 */
public class VisaLetterRequest extends ShortHibernateProcessor {


	private final static String EVENT_ID = "eid";
	
    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        Long userId  = new Long(getUser().getId());

        long eid = Long.parseLong(getRequest().getParameter(EVENT_ID));

        VisaLetterRequestDAO reqDAO =  DAOUtil.getFactory().getVisaLetterRequestDAO();
        
        com.topcoder.web.common.model.VisaLetterRequest req = reqDAO.find(userId, new Long(eid));
        
        if (req == null) {
            setNextPage(Constants.VISA_LETTER_REQUEST);        	        	 
        } else {
        	// Display the status page
        	getRequest().setAttribute("req", req);
            setNextPage(Constants.VISA_LETTER_REQUEST_STATUS);        	
        }
        
        setIsNextPageInContext(true);
    }


}
