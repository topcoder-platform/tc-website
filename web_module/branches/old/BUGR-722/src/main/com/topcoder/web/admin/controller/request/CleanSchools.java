package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;


/**
 * @author  cucu
 */
public class CleanSchools extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        setDefault("cc", "");
        setDefault("type", new Integer(-1));
        setDefault("order", "c");
        setDefault("date", "");
        setDefault("ua", "true");

        getRequest().setAttribute("countries",  DAOUtil.getFactory().getCountryDAO().getCountries());

        setNextPage("/cleanSchools.jsp");
        setIsNextPageInContext(true);
    }

}
