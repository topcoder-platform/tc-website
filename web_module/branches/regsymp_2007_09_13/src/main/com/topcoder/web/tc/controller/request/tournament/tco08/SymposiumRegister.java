package com.topcoder.web.tc.controller.request.tournament.tco08;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.SymposiumReg;
import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;



public class SymposiumRegister extends SymposiumRegBase {

    /**
     * Last day for early bid.  Currently, February 1, 2008 (month is 0-based)
     */
    private static Calendar EARLY_BID_END_DATE = new GregorianCalendar(2008, 1, 1);

    @Override
    protected void dbProcessing() throws Exception {
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
        
        SymposiumReg sr = buildRegObject();
        
        if (hasErrors()) {
            setDefaults();
            setNextPage("tournaments/tco08/symposium/symposiumRegister.jsp");
            return;            
        }
    }
    
    private void setDefaults() {
        String []fields = {GIVEN_NAME, SURNAME};
        for (String field : fields) {
            setDefault(field, getRequest().getParameter(field));
        }        
    }

    private SymposiumReg buildRegObject() {
        SymposiumReg sr = new SymposiumReg();
        sr.setFirstName(validateNotEmpty(GIVEN_NAME, "given name"));
        sr.setLastName(validateNotEmpty(SURNAME, "surname"));
        return sr;
    }
    
    private String validateNotEmpty(String reqName, String descr) {
        String value = getRequest().getParameter(reqName);
        ValidationResult result =new NonEmptyValidator("Please enter your " + descr).validate(new StringInput(value));
        if (!result.isValid()) {
            addError(reqName, result.getMessage());
        }
        return value;
    }

}
