package com.topcoder.web.tc.controller.request.util;

import java.util.Date;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.VisaLetterEventDAO;
import com.topcoder.web.common.dao.VisaLetterRequestDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.VisaLetterEvent;
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

        Long eid = new Long(getRequest().getParameter(EVENT_ID));
        	
        VisaLetterRequestDAO reqDAO =  DAOUtil.getFactory().getVisaLetterRequestDAO();
        VisaLetterEventDAO eventDAO =  DAOUtil.getFactory().getVisaLetterEventDAO();

        VisaLetterEvent event = eventDAO.find(eid);
        
        if (event == null) {
        	throw new IllegalArgumentException("Event id not found: " + eid);
        }
        
        com.topcoder.web.common.model.VisaLetterRequest req = null;
        
        if (getRequest().getParameter("full_name") != null) {
        	// The user requested a letter
        	String fullName = getRequest().getParameter("full_name");
        	String address = getRequest().getParameter("address");
        	String shippingAddress = getRequest().getParameter("shipping_address");
        	String phoneNumber = getRequest().getParameter("phoneNumber");

        	log.debug("before user");
        	User user  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
        	log.debug("after user");
        	//User user = new User();
        	//user.setId(userId);
        	
        	req = new com.topcoder.web.common.model.VisaLetterRequest();
        	req.setUser(user);
        	req.setEvent(event);
        	req.setFullName(fullName);
        	req.setAddress(address);
        	req.setShippingAddress(shippingAddress);
        	req.setPhoneNumber(phoneNumber);
        	req.setRequestDate(new Date());
        	log.debug("before save");
        	
        	reqDAO.saveOrUpdate(req);
        	log.debug("after save");
        } else {

	        req = reqDAO.find(userId, eid);
        }

        if (req == null) {
        	getRequest().setAttribute("event", event);
        	setNextPage(Constants.VISA_LETTER_REQUEST);        	        	 
        } else {
        	// Display the status page
        	getRequest().setAttribute("req", req);
        	getRequest().setAttribute("event", req.getEvent());
            setNextPage(Constants.VISA_LETTER_REQUEST_STATUS);        	
        }
        
        setIsNextPageInContext(true);
    }


}
