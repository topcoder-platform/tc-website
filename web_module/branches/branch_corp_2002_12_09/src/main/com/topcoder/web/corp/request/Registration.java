package com.topcoder.web.corp.request;

import java.util.HashMap;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;

/**
 * This class contains logic Primary registration.
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class Registration extends BaseProcessor {
	private final static Logger log = Logger.getLogger(Registration.class);
	
	public static final String KEY_FIRSTNAME = "prim-first-name";
	public static final String KEY_LASTNAME = "prim-last-name";
	public static final String KEY_TITLE = "prim-title";
	public static final String KEY_ADDRLINE1 = "prim-company-address-1";
	public static final String KEY_ADDRLINE2 = "prim-company-address-2";
	public static final String KEY_CITY = "prim-company-city";
	public static final String KEY_STATE = "prim-company-state";
	public static final String KEY_ZIP = "prim-company-zip";

	public static final String KEY_EMAIL1 = "prim-email";
	public static final String KEY_EMAIL2 = "prim-email-once-more";

	private String firstName;
	private String lastName;
	private String title;
	private String compAddress1;
	private String compAddress2;
	private String city;
	private String state;
	private String zip;
	private String country;
	private String phone;
	private String userName;
	private String password;
	private String password2;

	private String email;
	private String email2;

	public Registration() {
		formErrors = new HashMap();
		formDefaults = new HashMap();
        pageInContext = true;
        // For this processor next page is always in the context. It is either same
        // form page (if any errors were encountered) or next workflow page
        // (something like to thank u very much for registration)
	}
    
    /**
     * @see com.topcoder.web.common.AbstractRequestProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
    	// for all methods except POST
    	//just return form to the user
    	if( ! "POST".equals(request.getMethod()) ) {
    		nextPage = "/reg/prim-reg.jsp";
    		return;
    	}
    		
    	//log.debug("business processing ("+request.getMethod()+")");
    	// well, user filled the form
    	// and possible he thinks that it is allright
    	// so lets prove that he is wrong
    	firstName = (String) request.getParameter(KEY_FIRSTNAME);
    	lastName = (String) request.getParameter(KEY_LASTNAME);
    	title = (String) request.getParameter(KEY_TITLE);
    	compAddress1 = (String) request.getParameter(KEY_ADDRLINE1);
    	compAddress2 = (String) request.getParameter(KEY_ADDRLINE2);
    	city = (String) request.getParameter(KEY_CITY);
    	state = (String) request.getParameter(KEY_STATE);
    	zip = (String) request.getParameter(KEY_ZIP);
    	country = (String) request.getParameter("prim-company-country");
    	phone = (String) request.getParameter("prim-phone");
    	userName = (String) request.getParameter("prim-username");
    	password = (String) request.getParameter("prim-password");
    	password2 = (String) request.getParameter("prim-password-once-more");

    	email = (String) request.getParameter(KEY_EMAIL1);
    	email2 = (String) request.getParameter(KEY_EMAIL2);
        
        boolean formDataValid = isValid();
        if( formDataValid ) {
        	log.debug("data entered seem to be valid");

        	makePersistent();
            nextPage = "/greetings.jsp";
        }
        else {
        	log.debug("invalid data entered");
            nextPage = "/reg/prim-reg.jsp";
        }
    }
    
    /**
     * performs validity checks of data entered by user
     * @return boolean true if all seems to be valid
     */
    private boolean isValid() {
        boolean ret = true;
        
        ret &=	// first name validity check 
        checkItemValidity(KEY_FIRSTNAME, firstName, StringUtils.ALPHABET_ALPHA_EN, true, 1);

        ret &= // last name validity check 
        checkItemValidity(KEY_LASTNAME, lastName, StringUtils.ALPHABET_ALPHA_EN, true, 1);

        ret &= // title name validity 
        checkItemValidity(KEY_TITLE, title, StringUtils.ALPHABET_ALPHA_PUNCT_EN, true, 5);

        ret &= // addr line 1 validity (optional)
        checkItemValidity(KEY_ADDRLINE1, compAddress1, StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, false, 7);

        ret &= // addr line 2 validity (optional)
    	checkItemValidity(KEY_ADDRLINE2, compAddress2, StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, false, 7);

        ret &= // city validity (optional) 
    	checkItemValidity(KEY_CITY, city, StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, false, 3);
    	
        ret &= // state validity (optional) 
    	checkItemValidity(KEY_STATE, state, StringUtils.ALPHABET_ALPHA_EN, false, 2);

    	ret &= // zip validity (optional)
    	checkItemValidity(KEY_ZIP, zip, StringUtils.ALPHABET_DIGITS_EN, false, 1);

    	ret &= // email validity
    	checkItemValidity(KEY_EMAIL1, email, StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 1);
    	
    	// email2 validity
    	if( email2 == null ) email2 = "";
    	formDefaults.put(KEY_EMAIL2, email2);
    	if( ! email2.equals(email) ) {
	    	formErrors.put(KEY_EMAIL2, new Object());
	    }
    	ret = false; 
        return ret;
    }
    
    
    private boolean checkItemValidity(String itemKey, String itemValue, String alphabet, 
    									boolean required, int maxWords
    ) {
    	boolean ret = true;
    	boolean chkMore = true;
    	
    	formDefaults.put(itemKey, itemValue == null ? "" : itemValue);
    	
    	if( !required ) {
    		if( itemValue == null || itemValue.length() == 0 ) {
    			chkMore = false;
    		}
    	}
    	if( ! chkMore ) return ret;
    	
    	// either this field is required or (optional and not empty)
    	if( itemValue == null || itemValue.length() == 0 ) {
    		ret = false;
			formErrors.put(itemKey, new Object());
    	}
    	else {
	    	//  alphabet check
			if( (! StringUtils.consistsOf(itemValue, alphabet, true )) )  {
				ret = false;
 				formErrors.put(itemKey, new Object());
			}
			else {
				if( maxWords <= 1 ) maxWords = 1;
				
				if( ! StringUtils.hasNotMoreWords(itemValue, maxWords) ) {
					ret = false;
	    			formErrors.put(itemKey, new Object());
				}
			}
    	}
    	return ret;
    }
    
    /**
     * Makes user data persistent. Not implemented yet (until ejbs will be
     * ready).
     */
    private void makePersistent() throws Exception {
    }
}
