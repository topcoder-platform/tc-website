package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.VisaLetterEventDAO;

/**
 * @author  cucu
 */
public class EventList extends ShortHibernateProcessor {


    protected void dbProcessing() throws  Exception {
        DAOFactory factory = DAOUtil.getFactory();

        VisaLetterEventDAO eventDAO =  factory.getVisaLetterEventDAO();

        getRequest().setAttribute("events", eventDAO.getAll());

        setNextPage("/eventList.jsp");
        setIsNextPageInContext(true);

    }


}
