package com.topcoder.web.tc.controller.request.util;

import java.util.Date;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.VisaLetterEventDAO;
import com.topcoder.web.common.dao.VisaLetterRequestDAO;
import com.topcoder.web.common.model.Address;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.VisaLetterEvent;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.reg.validation.Address1Validator;
import com.topcoder.web.reg.validation.Address2Validator;
import com.topcoder.web.reg.validation.Address3Validator;
import com.topcoder.web.reg.validation.CityValidator;
import com.topcoder.web.reg.validation.CountryValidator;
import com.topcoder.web.reg.validation.PostalCodeValidator;
import com.topcoder.web.reg.validation.ProvinceValidator;
import com.topcoder.web.reg.validation.StateValidator;
import com.topcoder.web.reg.Constants;

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
    	User user  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        boolean forceRequest = getRequest().getParameter(FORCE_REQUEST) != null;
        Long eid = null;
        VisaLetterEvent event = null;
        boolean noEvent = getRequest().getParameter(EVENT_ID) == null;
        
        if (noEvent) {
        	event = eventDAO.findCurrent();
        	if (event != null) {
        		eid = event.getId(); 
        	} else {
                setNextPage(com.topcoder.web.tc.Constants.VISA_LETTER_REQUEST_STATUS);        	
                setIsNextPageInContext(true);
                return;
            }
        	
        } else {
        	eid = new Long(getRequest().getParameter(EVENT_ID));
            event = eventDAO.find(eid);
        }
        	
        
        if (event == null) {
        	throw new IllegalArgumentException("Event id not found: " + eid);
        }
        
        Date today = new Date();
        String dateError = null;
        if (event.getStartDate().after(today)) {
        	dateError = "tooEarly";
        } else if (event.getEndDate().before(today)) {
        	dateError = "tooLate";
        }
        
        if (dateError != null) {
        	getRequest().setAttribute("event_name", event.getName());        	
        	getRequest().setAttribute(dateError, "true");
            setNextPage(com.topcoder.web.tc.Constants.VISA_LETTER_REQUEST_STATUS);        	
            setIsNextPageInContext(true);
            return;
        }
        

        com.topcoder.web.common.model.VisaLetterRequest req = null;
        
        if (getRequest().getParameter(FULL_NAME) != null) {
        	// The user requested a letter
        	String fullName = getRequest().getParameter(FULL_NAME);
        	String phoneNumber = getRequest().getParameter(PHONE_NUMBER);
        	
        	
        	if (fullName.trim().length() == 0) {
        		addError(FULL_NAME, "Please enter the full name");
        	}
        	
        	if (phoneNumber == null || phoneNumber.trim().length() == 0) {
        		addError(PHONE_NUMBER, "Please enter the phone number");
        	}

        	Address addr = getAddress("");
        	addr.setAddressTypeId(Address.PASSPORT_TYPE_ID);

        	Address shippingAddr = getAddress("s_");
        	shippingAddr.setAddressTypeId(Address.VISA_LETTER_TYPE_ID);
        	 
        	if (hasErrors()) {
            	setDefault(FULL_NAME, fullName);
            	setDefault(PHONE_NUMBER, phoneNumber);
            	
            	String []fields = {Constants.ADDRESS1, Constants.ADDRESS2, Constants.ADDRESS3, Constants.CITY, 
            			           Constants.POSTAL_CODE, Constants.PROVINCE, Constants.COUNTRY_CODE, Constants.STATE_CODE};
            	
            	for (int i = 0; i < fields.length; i++) {
            		setDefault(fields[i], getRequest().getParameter(fields[i])); 
            		setDefault("s_"+ fields[i], getRequest().getParameter("s_" + fields[i])); 
            	}            	
        	} else {
	        	
	        	req = new com.topcoder.web.common.model.VisaLetterRequest();
	        	req.setUser(user);
	        	req.setEvent(event);
	        	req.setFullName(fullName);
	        	req.setAddress(addr);
	        	req.setShippingAddress(shippingAddr);
	        	req.setPhoneNumber(phoneNumber);
	        	req.setRequestDate(new Date());
	        	
	        	reqDAO.saveOrUpdate(req);
        	}
        } else {
	        req = reqDAO.find(userId, eid);
        }

        // can't force a request when you were denied
        if (req != null && req.isDenied()) {
        	forceRequest = false;
        }
        
        if ((forceRequest || req == null) && !noEvent) {
        	setDefault(FULL_NAME, user.getFirstName() + " " + user.getMiddleName() + " " + user.getLastName());
        	setDefault(PHONE_NUMBER, user.getPrimaryPhoneNumber().getNumber());
        	getRequest().setAttribute("event", event);
        	getRequest().setAttribute("address", user.getHomeAddress());
            getRequest().setAttribute("countries", DAOUtil.getFactory().getCountryDAO().getCountries());
        	
        	setNextPage(com.topcoder.web.tc.Constants.VISA_LETTER_REQUEST);        		
        } else {
        	// Display the status page
        	getRequest().setAttribute("req", req);
            setNextPage(com.topcoder.web.tc.Constants.VISA_LETTER_REQUEST_STATUS);        	
        }
        
        setIsNextPageInContext(true);
    }


    private Address getAddress(String prefix) {
        simpleValidation(Address1Validator.class, prefix + Constants.ADDRESS1);
        simpleValidation(Address2Validator.class, prefix + Constants.ADDRESS2);
        simpleValidation(Address3Validator.class, prefix + Constants.ADDRESS3);
        simpleValidation(CityValidator.class, prefix + Constants.CITY);
        simpleValidation(PostalCodeValidator.class, prefix + Constants.POSTAL_CODE);
        simpleValidation(ProvinceValidator.class, prefix + Constants.PROVINCE);
        simpleValidation(CountryValidator.class, prefix + Constants.COUNTRY_CODE);
        
        if (!hasError(prefix + Constants.COUNTRY_CODE)) {
            ValidationResult stateResult = new StateValidator(DAOUtil.getFactory().getCountryDAO().find(
            		getRequest().getParameter(prefix + Constants.COUNTRY_CODE))).validate(
                    new StringInput(getRequest().getParameter(prefix + Constants.STATE_CODE)));
            if (!stateResult.isValid()) {
                addError(prefix + Constants.STATE_CODE, stateResult.getMessage());
            }            
        }

        
        Address a = new Address();
        a.setAddress1(getRequest().getParameter(prefix + Constants.ADDRESS1));
        a.setAddress2(getRequest().getParameter(prefix + Constants.ADDRESS2));
        a.setAddress3(getRequest().getParameter(prefix + Constants.ADDRESS3));
        a.setCity(getRequest().getParameter(prefix + Constants.CITY));
        a.setPostalCode(getRequest().getParameter(prefix + Constants.POSTAL_CODE));

        if (!hasError(prefix + Constants.COUNTRY_CODE)) {
        	a.setCountry(DAOUtil.getFactory().getCountryDAO().find(getRequest().getParameter(prefix + Constants.COUNTRY_CODE)));
        }

        if (!hasError(prefix + Constants.COUNTRY_CODE) 
        		&& DAOUtil.getFactory().getCountryDAO().getUS().equals(a.getCountry()) 
        		&& !hasError(prefix + Constants.STATE_CODE)) {
            a.setState(DAOUtil.getFactory().getStateDAO().find(getRequest().getParameter(prefix + Constants.STATE_CODE)));
        } else {
            a.setState(null);
            a.setProvince(getRequest().getParameter(prefix + Constants.PROVINCE));
        }


        return a;
    }


    private void simpleValidation(Class validationClass, String field) throws RuntimeException {
        Validator v;
        try {
            v = (Validator) Class.forName(validationClass.getName()).newInstance();
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        ValidationResult result = v.validate(new StringInput(getRequest().getParameter(field)));
        if (!result.isValid()) {
            addError(field, result.getMessage());
        }
    }

}
