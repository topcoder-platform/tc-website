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
		//log.debug("constructor");
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
    	compAddress2 = (String) request.getParameter("prim-company-address-2");
    	city = (String) request.getParameter("prim-company-city");
    	state = (String) request.getParameter("prim-company-state");
    	zip = (String) request.getParameter("prim-company-zip");
    	country = (String) request.getParameter("prim-company-country");
    	phone = (String) request.getParameter("prim-phone");
    	userName = (String) request.getParameter("prim-username");
    	password = (String) request.getParameter("prim-password");
    	password2 = (String) request.getParameter("prim-password-once-more");

    	email = (String) request.getParameter("prim-email");
    	email2 = (String) request.getParameter("prim-email-once-more");
        
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
        
        // first name validity
        if( firstName == null || firstName.length() == 0 ||
            (! StringUtils.consistsOf(firstName, StringUtils.ALPHABET_ALPHA_EN, true ) ) ||
            (! StringUtils.hasNotMoreWords(firstName, 1) )
        ) { // invalid
            formErrors.put(KEY_FIRSTNAME, "Ensure first name is not empty, consists of letters and has not spaces inside");
            ret = false;
        }
        formDefaults.put(KEY_FIRSTNAME, firstName == null ? "" : firstName);

        // last name validity
        if( lastName == null || lastName.length() == 0 ||
            (! StringUtils.consistsOf(lastName, StringUtils.ALPHABET_ALPHA_EN, true ) ) ||
            (! StringUtils.hasNotMoreWords(lastName, 1) )
        ) { // invalid
            formErrors.put(KEY_LASTNAME, "Ensure last name is not empty, consists of letters and has not spaces inside");
            ret = false;
        }
        formDefaults.put(KEY_LASTNAME, lastName == null ? "" : lastName);

        // title name validity
        if( title == null || title.length() == 0 ||
            (! StringUtils.consistsOf(title, StringUtils.ALPHABET_ALPHA_PUNCT_EN, true ) ) ||
            (! StringUtils.hasNotMoreWords(title, 5) )
        ) { // invalid
            formErrors.put(KEY_TITLE, "Ensure title is not empty, consists of letters and punctuation signs only");
            ret = false;
        }
        formDefaults.put(KEY_TITLE, title == null ? "" : title);
        
        // addr line 1 validity
    	if( compAddress1 == null || compAddress1.length() == 0 ||
    		(! StringUtils.consistsOf(compAddress1, StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true ) ) ||
    		(! StringUtils.hasNotMoreWords(compAddress1, 7) )
    	) { // invalid
    		formErrors.put(KEY_ADDRLINE1, "Ensure address line 1 is not empty, consists of letters, digits and punctuation signs only (no more than 7 words)");
    		ret = false;
    	}
    	formDefaults.put(KEY_ADDRLINE1, compAddress1 == null ? "" : compAddress1);
        return false;
    }
    
    /**
     * Makes user data persistent. Not implemented yet (until ejbs will be
     * ready).
     */
    private void makePersistent() throws Exception {
    }
}
