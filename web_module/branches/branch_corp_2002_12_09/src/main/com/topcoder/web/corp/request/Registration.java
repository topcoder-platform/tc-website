package com.topcoder.web.corp.request;

import java.rmi.RemoteException;
import java.util.Map;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.transaction.SystemException;
import javax.transaction.Transaction;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;

/**
 * This class contains logic Primary registration.
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class Registration extends BaseProcessor {
    private final static Logger log = Logger.getLogger(Registration.class);
   
    public static final String KEY_FIRSTNAME    = "prim-first-name";
    public static final String KEY_LASTNAME     = "prim-last-name";
    public static final String KEY_TITLE        = "prim-title";
    public static final String KEY_ADDRLINE1    = "prim-company-address-1";
    public static final String KEY_ADDRLINE2    = "prim-company-address-2";
    public static final String KEY_CITY         = "prim-company-city";
    public static final String KEY_STATE        = "prim-company-state";
    public static final String KEY_ZIP          = "prim-company-zip";
    public static final String KEY_COUNTRY      = "prim-company-country";
    public static final String KEY_PHONE        = "prim-phone";
    public static final String KEY_LOGIN        = "prim-username";
    public static final String KEY_PASSWORD1    = "prim-password";
    public static final String KEY_PASSWORD2    = "prim-password-once-more";
    public static final String KEY_EMAIL1       = "prim-email";
    public static final String KEY_EMAIL2       = "prim-email-once-more";

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
        pageInContext = true;
        // For this processor next page is always in the context. It is either
        // same form page (if any errors were encountered) or next workflow page
        // (something like to thank u very much for registration)
	}
    
    /**
     * @see com.topcoder.web.common.AbstractRequestProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
    	// for all methods except POST
    	//just return form to the user
    	if( ! "POST".equals(request.getMethod()) ) {
    		nextPage = "/reg/Registration.jsp";
    		return;
    	}
    	
    	//log.debug("business processing ("+request.getMethod()+")");
    	// well, user filled the form
    	// and possible he thinks that it is allright
    	// so lets prove that he is wrong
    	firstName      = (String) request.getParameter(KEY_FIRSTNAME);
    	lastName       = (String) request.getParameter(KEY_LASTNAME);
    	title          = (String) request.getParameter(KEY_TITLE);
    	compAddress1   = (String) request.getParameter(KEY_ADDRLINE1);
    	compAddress2   = (String) request.getParameter(KEY_ADDRLINE2);
    	city           = (String) request.getParameter(KEY_CITY);
    	state          = (String) request.getParameter(KEY_STATE);
    	zip            = (String) request.getParameter(KEY_ZIP);
    	country        = (String) request.getParameter(KEY_COUNTRY);
    	phone          = (String) request.getParameter(KEY_PHONE);
    	userName       = (String) request.getParameter(KEY_LOGIN);
    	password       = (String) request.getParameter(KEY_PASSWORD1);
    	password2      = (String) request.getParameter(KEY_PASSWORD2);
    	email          = (String) request.getParameter(KEY_EMAIL1);
    	email2         = (String) request.getParameter(KEY_EMAIL2);
        
        boolean formDataValid = isValid();
        if( formDataValid ) {
        	log.debug("data entered seem to be valid");

        	makePersistent();
            nextPage = "/reg/RegSuccess.jsp";
        }
        else {
            log.debug("invalid data entered");
            nextPage = "/reg/Registration.jsp";
        }
    }
    
    /**
     * performs validity checks of data entered by user
     * @return boolean true if all seems to be valid
     */
    private boolean isValid() {
        boolean ret = true;
        
        ret &=	// first name validity check 
        checkItemValidity(KEY_FIRSTNAME, firstName, 
            StringUtils.ALPHABET_ALPHA_EN, true, 1,
            "Ensure first name is not empty, consists of letters and has not spaces inside"
        );

        ret &= // last name validity check 
        checkItemValidity(KEY_LASTNAME, lastName, 
            StringUtils.ALPHABET_ALPHA_EN, true, 1,
            "Ensure last name is not empty, consists of letters and has not spaces inside"
        );

        ret &= // title name validity 
        checkItemValidity(KEY_TITLE, title, 
            StringUtils.ALPHABET_ALPHA_PUNCT_EN, true, 5,
            "Ensure title is not empty, consists of letters and punctuation signs only"
        );

        ret &= // addr line 1 validity (optional)
        checkItemValidity(KEY_ADDRLINE1, compAddress1, 
            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, false, 7,
            "Ensure address line 1 is not empty, consists of letters, digits and punctuation signs only (no more than 7 words)"
        );

        ret &= // addr line 2 validity (optional)
    	checkItemValidity(KEY_ADDRLINE2, compAddress2, 
            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, false, 7,
            "Ensure address line 2 is not empty, consists of letters, digits and punctuation signs only (no more than 7 words)"
        );

        ret &= // city validity (optional) 
    	checkItemValidity(KEY_CITY, city, 
            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, false, 3,
            "Ensure city is not empty, consists of letters, digits and punctuation signs only (no more than 3 words)"
        );
    	
        ret &= // state validity (optional)
        checkAgainstDB(
            KEY_STATE, 
            state, 
            "Please choose state from the list carefully"
        );

        ret &= // country validity (optional)
        checkAgainstDB(
            KEY_COUNTRY,
            country,
            "Please choose country from the list carefully"
        );

    	ret &= // zip validity (optional)
    	checkItemValidity(KEY_ZIP, zip, StringUtils.ALPHABET_DIGITS_EN, 
            false, 1, "Ensure ZIP code is not empty and, consists of digits only"
        );
        
        ret &= // phone validity
        checkItemValidity(KEY_PHONE, phone, StringUtils.ALPHABET_NUM_PUNCT_EN, 
            true, 1, 
            "Ensure phone is not empty and, consists of digits only (minus sign is allowed too)"
        );

        ret &= // username validity
        checkUsernameValidity();

        ret &= // password validity
        checkItemValidity(KEY_PASSWORD1, password, 
            StringUtils.ALPHABET_ALPHA_NUM_EN, true, 1,
            "Ensure password is not empty and, consists of letters and digits only"
        );

        // password2 validity
        if( password2 == null ) password2 = "";
        setFormFieldDefault(KEY_PASSWORD2, password2);
        if( ! password2.equals(password) ) {
            markFormFieldAsInvalid(
                KEY_PASSWORD2, 
                "Passwords entered must be same in the both fields"
            );
            ret = false;
        }
    	
        ret &= // email validity
        checkItemValidity(KEY_EMAIL1, email, 
            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 1,
            "Ensure email address is not empty and, has written correct"
        );

    	// email2 validity
    	if( email2 == null ) email2 = "";
        setFormFieldDefault(KEY_EMAIL2, email2);
    	if( ! email2.equals(email) ) {
            markFormFieldAsInvalid(
                KEY_EMAIL2,
                "e-mail addresses entered must be same in the both fields"
            );
            ret = false;
	    }
        return ret;
    }
    
    
    private boolean checkItemValidity(
        String itemKey, 
        String itemValue, 
        String alphabet, 
        boolean required,
        int maxWords,
        String errMsg
    )
    {
    	boolean ret = true;
    	boolean chkMore = true;
    	
        setFormFieldDefault(itemKey, itemValue == null ? "" : itemValue);
    	
    	if( !required ) {
    		if( itemValue == null || itemValue.length() == 0 ) {
    			chkMore = false;
    		}
    	}
    	if( ! chkMore ) return ret;
    	
    	// either this field is required or (optional and not empty)
    	if( itemValue == null || itemValue.length() == 0 ) {
    		ret = false;
            markFormFieldAsInvalid(itemKey, errMsg);
    	}
    	else {
	    	//  alphabet check
			if( (! StringUtils.consistsOf(itemValue, alphabet, true )) )  {
				ret = false;
                markFormFieldAsInvalid(itemKey, errMsg);
			}
			else {
				if( maxWords <= 1 ) maxWords = 1;
				
				if( ! StringUtils.hasNotMoreWords(itemValue, maxWords) ) {
					ret = false;
                    markFormFieldAsInvalid(itemKey, errMsg);
				}
			}
    	}
    	return ret;
    }
    
    /**
     * Makes user data persistent. Not implemented yet (until ejbs will be
     * ready).
     */
    private void makePersistent()
    throws SystemException, NamingException
    {
        //well, general scheme is
        
        // trying to start transaction
        Transaction tx = Util.beginTransaction();
        
        // trying to store data
        InitialContext ic = null;
        try {
            // store data in DB via EJB, eg.
            
//            // working with first ejb
//            ic = new InitialContext();
//            Object  l = ic.lookup(CountryMgrHome.EJB_REF_NAME);
//            CountryMgrHome cmgrHome = (CountryMgrHome)l;
//            CountryMgr mgr = cmgrHome.create();
//            mgr.create("US", "United States of America");
//
//            Country [] lst = mgr.listByName("%");
//            for( int i=0; i<lst.length; ++i ) {
//                // some actions here
//            }
//
//            // now working with other ejb
//            l = ic.lookup(CompanyHome.EJB_REF_NAME);
//            CompanyHome cmpHome = (CompanyHome)l;
//            Company cmp = cmpHome.create();
//            tx.commit(); // confirm tarnsaction - if all is ok
        }
        catch(Exception e) {
            tx.rollback(); // roll failed transaction back
//            throw e; 
        }
        finally {
            Util.closeIC(ic);
        }
    }
    
    /**
     * Checks if login consists of valid symbols and will it be allowed by DB
     * rules (uniquiness)
     * @return boolean true if allowed
     */
    private boolean checkUsernameValidity() {
        boolean success;
        //as usually check against char set 
        success = checkItemValidity(KEY_LOGIN, userName, 
            StringUtils.ALPHABET_ALPHA_EN, true, 1,
            "Handle entered must consist of alpha numeric symbols"
        );
        if( !success ) {
            return false;
        }
        // and additionally check against DB - not implemented for now
        InitialContext ic = null;
        boolean techProblems = false;
        try {
            ic = new InitialContext(Constants.SECURITY_CONTEXT_ENVIRONMENT);
            PrincipalMgrRemoteHome rh = (PrincipalMgrRemoteHome)
                ic.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote mgr = rh.create();
            try {
                success = false;
                UserPrincipal user = mgr.getUser(userName);
                markFormFieldAsInvalid(
                    KEY_LOGIN,
                    "There is the user with given handle at the database"
                );
            }
            catch(NoSuchUserException nsue) {
                // it is fine - handle seem to be free yet
                success = true;
            }
        }
        catch(RemoteException re) {
            techProblems = true;
            log.error("RemoteException - primary registration process");
            re.printStackTrace();
        }
        catch(CreateException ce) {
            techProblems = true;
            log.error("CreateException - primary registration process");
            ce.printStackTrace();
        }
        catch(NamingException ne) {
            techProblems = true;
            log.error("NamingException - primary registration process");
            ne.printStackTrace();
        }
        catch(GeneralSecurityException gse) {
            techProblems = true;
            log.error("GeneralSecurityException - primary registration process");
            gse.printStackTrace();
        }
        finally {
            Util.closeIC(ic);
            if( techProblems ) {
                markFormFieldAsInvalid(
                    KEY_LOGIN,
                    "Some technical problems prevent further processing. Try again later"
                );
                return false;
            }
        }
        return true;
    }

    /**
     * 
     * @param key
     * @param value
     * @param message
     * @return boolean
     */    
    private boolean checkAgainstDB(String key, String value, String message) {
        InitialContext ic = null;
        boolean techProblems = false;
        boolean success = false;
        try {
            ic = new InitialContext(Constants.EJB_CONTEXT_ENVIRONMENT);
            Request stateRequest = new Request();
            if( KEY_STATE.equals(key) ) {
                stateRequest.setContentHandle("cmd-state-name-from-id");
                stateRequest.setProperty("stateID", value );
            }
            else {
                stateRequest.setContentHandle("cmd-country-name-from-id");
                stateRequest.setProperty("countryID", value );
            }
            DataAccessInt dai = new DataAccess(
                (DataSource) ic.lookup(Constants.JTA_DATA_SOURCE)
            );
            Map state = dai.getData(stateRequest);
            ResultSetContainer rsc;
            if( KEY_STATE.equals(key) ) {
                rsc = (ResultSetContainer) state.get("qry-state-name-from-id");
            }
            else {
                rsc = (ResultSetContainer) state.get("qry-country-name-from-id");
            }
            success = rsc.getRowCount() == 1;
        }
        catch(NamingException ne) {
            techProblems = true;
            log.error("NamingException - primary registration process ["+key+"]");
            ne.printStackTrace();
        }
        catch(Exception e) {
            techProblems = true;
            log.error("Exception - primary registration process ["+key+"]");
            e.printStackTrace();
        }
        finally {
            Util.closeIC(ic);
            if( techProblems ) {
                markFormFieldAsInvalid(
                    key,
                    "Some technical problems prevent further processing. Try again later"
                );
                return false;
            }
        }
        return success;
    }
}
