package com.topcoder.web.tc.controller.request.tournament.tco08;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Country;
import com.topcoder.web.common.model.SymposiumReg;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;



public class SymposiumRegister extends SymposiumRegBase {

    /**
     * Last day for early bid.  Currently, February 1, 2008 (month is 0-based)
     */
    private static Calendar EARLY_BID_END_DATE = new GregorianCalendar(2008, 1, 1);

    private SimpleDateFormat expirationFormat = new SimpleDateFormat("MM/yy");

    @Override
    protected void dbProcessing() throws Exception {
               
        String url = getRequest().getRequestURL().toString(); 
        if (url.startsWith("http:")) {
            setNextPage("https://" + getRequest().getServerName() + getRequest().getServletPath() + "?" +  getRequest().getQueryString());
            setIsNextPageInContext(false);
            return;
        }
        
        boolean early = EARLY_BID_END_DATE.getTime().after(new Date());
        
        // just for test, remove!!
        if (getRequest().getParameter("early") != null) early = "true".equals(getRequest().getParameter("early"));
        
        getRequest().setAttribute("countries", DAOUtil.getFactory().getCountryDAO().getCountries());
        getRequest().setAttribute("early", early);
        setIsNextPageInContext(true);
        
        // The user is just opening the page
        if ("get".equalsIgnoreCase(getRequest().getMethod())) {
            setNextPage("tournaments/tco08/symposium/symposiumRegister.jsp");
            return;
        }
        
        SymposiumReg regData = buildRegObject();
        PaymentData paymentData = buildPaymentData();
        

        // If there are input errors, set the defaults and reload the page
        if (hasErrors()) {
            setDefaults();
            setNextPage("tournaments/tco08/symposium/symposiumRegister.jsp");
            return;            
        }
        
        getRequest().getSession().setAttribute(REG_DATA_ATTR, regData);
        getRequest().getSession().setAttribute(PAYMENT_DATA_ATTR, paymentData);

        // Everything OK, so go to the confirmation page
        setNextPage("tournaments/tco08/symposium/confirm.jsp");
    }
    
    private PaymentData buildPaymentData() {
        PaymentData pd = new PaymentData();
        
        pd.setMethod(validateNonEmpty(PAYMENT_METHOD, "method of payment"));
        pd.setCardNumber(validateNonEmpty(CARD_NUMBER, "card number"));
        String expiration = getRequest().getParameter(EXPIRATION_DATE);
        try {
            expirationFormat.parse(expiration);
        } catch (ParseException e) {
            addError(EXPIRATION_DATE, "Please enter a valid expiration date.");
        }
        pd.setExpirationDate(expiration);
        
        return pd;
    }

    private void setDefaults() {
        String []fields = {GIVEN_NAME, SURNAME, HANDLE, PROFESSIONAL, COLLEGE, COMPANY, PHONE_NUMBER, EMAIL_ADDRESS, ADDRESS_1, ADDRESS_2, CITY, ZIP, COUNTRY
                , REGISTRATION_TYPE, PAYMENT_METHOD, CARD_NUMBER, EXPIRATION_DATE};
        for (String field : fields) {
            setDefault(field, getRequest().getParameter(field));
        }        
    }

    private SymposiumReg buildRegObject() {
        SymposiumReg sr = new SymposiumReg();
        sr.setFirstName(validateNonEmpty(GIVEN_NAME, "given name"));
        sr.setLastName(validateNonEmpty(SURNAME, "surname"));
        
        
        String handle = getRequest().getParameter(HANDLE).trim();
        
        if (handle.length() > 0) {
            User u = DAOUtil.getFactory().getUserDAO().find(handle, true);
            if (u != null) {
                sr.setUser(u);
                log.debug("user id: "+ u.getId());
            } else {
                addError(HANDLE, "Handle not found");
            }
        }
        
        
        if (getRequest().getParameter(PROFESSIONAL) == null) {
            addError(PROFESSIONAL, "Please choose an option");
        } else {
            sr.setProfessional("pro".equalsIgnoreCase(getRequest().getParameter(PROFESSIONAL)));
        }
        
        sr.setCollegeName(getRequest().getParameter(COLLEGE));
        sr.setCompanyName(getRequest().getParameter(COMPANY));
        sr.setPhoneNumber(validateNonEmpty(PHONE_NUMBER, "phone number"));
        sr.setEmailAddress(validateNonEmpty(EMAIL_ADDRESS, "email address"));
        sr.setAddress1(validateNonEmpty(ADDRESS_1, "address"));
        sr.setAddress2(getRequest().getParameter(ADDRESS_2));
        sr.setCity(validateNonEmpty(CITY, "city"));
        sr.setZip(getRequest().getParameter(ZIP));

        String countryCode = getRequest().getParameter(COUNTRY);
        
        if (countryCode.length() > 0) {
            Country c = DAOUtil.getFactory().getCountryDAO().find(countryCode);
            sr.setCountry(c);
        }

        String rt = validateNonEmpty(REGISTRATION_TYPE, "registration type");
        if ( rt != null) {
            sr.setRegistrationType(new Integer(rt));
        }

        
        
        return sr;
    }
    
    private String validateNonEmpty(String reqName, String descr) {
        String value = getRequest().getParameter(reqName);
        ValidationResult result =new NonEmptyValidator("Please enter your " + descr).validate(new StringInput(value));
        if (!result.isValid()) {
            addError(reqName, result.getMessage());
        }
        return value;
    }

}
