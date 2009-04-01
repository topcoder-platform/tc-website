package com.topcoder.web.admin.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;

/**
 * @author cucu
 */
public class PassedReview extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        Long eid = new Long(getRequest().getParameter("eid"));
        
        Event event = DAOUtil.getFactory().getEventDAO().find(eid);
        
        Request r = new Request();
        r.setContentHandle("passed_review_for_event");
        r.setProperty("eid", eid + "");
        
        getRequest().setAttribute("coders", 
                new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("passed_review_for_event"));

        getRequest().setAttribute("event",event); 

        setNextPage("/passedReview.jsp");
        setIsNextPageInContext(true);

    }
}
