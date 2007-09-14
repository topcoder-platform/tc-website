package com.topcoder.web.tc.controller.request.tournament.tco08;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.topcoder.web.common.dao.DAOUtil;



public class SymposiumRegister extends SymposiumRegBase {

    /**
     * Last day for early bid.  Currently, February 1, 2008 (month is 0-based)
     */
    private static Calendar EARLY_BID_END_DATE = new GregorianCalendar(2008, 1, 1);

    @Override
    protected void dbProcessing() throws Exception {
        //boolean early = new Date().before(EARLY_BID_END_DATE);
        boolean early = EARLY_BID_END_DATE.after(new Date());
        
        // just for test, remove!!
        if (getRequest().getParameter("early") != null) early = "true".equals(getRequest().getParameter("early"));
        
        getRequest().setAttribute("countries", DAOUtil.getFactory().getCountryDAO().getCountries());
        getRequest().setAttribute("early", early);

        setNextPage("tournaments/tco08/symposium/symposiumRegister.jsp");
        setIsNextPageInContext(true);                        
    }

}
