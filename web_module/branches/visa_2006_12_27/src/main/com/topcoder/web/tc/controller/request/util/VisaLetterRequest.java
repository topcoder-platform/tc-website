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


	public static final String PHONE_NUMBER = "phone_number";
	public static final String SHIPPING_ADDRESS = "shipping_address";
	public static final String ADDRESS = "address";
	public static final String FULL_NAME = "full_name";
	public static final String FORCE_REQUEST = "fr";
	
	private final static String EVENT_ID = "eid";
	
    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        Long userId  = new Long(getUser().getId());

        VisaLetterRequestDAO reqDAO =  DAOUtil.getFactory().getVisaLetterRequestDAO();
        VisaLetterEventDAO eventDAO =  DAOUtil.getFactory().getVisaLetterEventDAO();

        boolean forceRequest = getRequest().getParameter(FORCE_REQUEST) != null;
        Long eid = null;
        VisaLetterEvent event = null;
        boolean noEvent = getRequest().getParameter(EVENT_ID) == null;
        
        if (noEvent) {
        	event = eventDAO.findCurrent();
        	if (event != null) {
        		eid = event.getId(); 
        	}
        	
        } else {
        	eid = new Long(getRequest().getParameter(EVENT_ID));
            event = eventDAO.find(eid);
        }
        	
        
        if (event == null) {
        	throw new IllegalArgumentException("Event id not found: " + eid);
        }
        
        com.topcoder.web.common.model.VisaLetterRequest req = null;
        
        if (getRequest().getParameter(FULL_NAME) != null) {
        	// The user requested a letter
        	String fullName = getRequest().getParameter(FULL_NAME);
        	String address = getRequest().getParameter(ADDRESS);
        	String shippingAddress = getRequest().getParameter(SHIPPING_ADDRESS);
        	String phoneNumber = getRequest().getParameter(PHONE_NUMBER);
        	
        	setDefault(FULL_NAME, fullName);
        	setDefault(ADDRESS, address);
        	setDefault(SHIPPING_ADDRESS, shippingAddress);
        	setDefault(PHONE_NUMBER, phoneNumber);
        	
        	validate(fullName, "full name");
        	validate(address, "address");
        	validate(shippingAddress, "shipping address");
        	validate(phoneNumber, "phone number");
        	
        	if (!hasErrors()) {
	        	User user  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
	        	
	        	req = new com.topcoder.web.common.model.VisaLetterRequest();
	        	req.setUser(user);
	        	req.setEvent(event);
	        	req.setFullName(fullName);
	        	req.setAddress(address);
	        	req.setShippingAddress(shippingAddress);
	        	req.setPhoneNumber(phoneNumber);
	        	req.setRequestDate(new Date());
	        	
	        	reqDAO.saveOrUpdate(req);
        	}
        } else {
	        req = reqDAO.find(userId, eid);
        }

        if ((forceRequest || req == null) && !noEvent) {
        	getRequest().setAttribute("event", event);
            getRequest().setAttribute("countries", DAOUtil.getFactory().getCountryDAO().getCountries());
        	
        	setNextPage(Constants.VISA_LETTER_REQUEST);        		
        } else {
        	// Display the status page
        	getRequest().setAttribute("req", req);
        	//getRequest().setAttribute("event", req.getEvent());
            setNextPage(Constants.VISA_LETTER_REQUEST_STATUS);        	
        }
        
        setIsNextPageInContext(true);
    }


    private void validate(String value, String fieldName) {
    	if (value == null || value.trim().length() == 0) {
    		addError("error", "Please enter the " + fieldName);
    	}
    }
    
}
