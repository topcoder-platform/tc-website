package com.topcoder.web.admin.controller.request;

import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;

/**
 * @author cucu
 */
public class AddIntroEvent extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {

        List tz = DAOUtil.getFactory().getTimeZoneDAO().getTimeZones();
        getRequest().setAttribute("timezones", tz);
        
        setNextPage("/editIntroEvent.jsp");
        setIsNextPageInContext(true);
    }


}
