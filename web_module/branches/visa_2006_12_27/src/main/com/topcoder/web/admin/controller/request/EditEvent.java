package com.topcoder.web.admin.controller.request;

import java.text.SimpleDateFormat;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.VisaLetterEventDAO;
import com.topcoder.web.common.model.VisaLetterEvent;

/**
 * @author  cucu
 */
public class EditEvent extends ShortHibernateProcessor {
	
	public static final String EID = "eid";

	protected void dbProcessing() throws  Exception {  	
    	VisaLetterEventDAO eventDAO =  DAOUtil.getFactory().getVisaLetterEventDAO();
    	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    	
    	// the user is saving the event
    	if (getRequest().getParameter("name") != null) {
    		VisaLetterEvent event;
    		if (getRequest().getParameter(EID) != null) {
    			event = eventDAO.find(new Long(getRequest().getParameter(EID)));
    		} else {
    			event = new VisaLetterEvent();
    		}
    		// validation!
    		event.setName(getRequest().getParameter("name") );
    		event.setStartDate(sdf.parse(getRequest().getParameter("startDate")));
    		event.setEndDate(sdf.parse(getRequest().getParameter("endDate")));
    		eventDAO.saveOrUpdate(event);

        	setNextPage("/admin/?module=EventList");
            setIsNextPageInContext(false);
            return;
    	}
    			
    	// the user is editing (not adding!)
    	if (getRequest().getParameter(EID) != null) {
			VisaLetterEvent event = eventDAO.find(new Long(getRequest().getParameter(EID)));
			
			setDefault("name", event.getName());
			setDefault("startDate", event.getStartDate());
			setDefault("endDate", event.getEndDate());
		}
    	
    	setNextPage("/editEvent.jsp");
        setIsNextPageInContext(true);

    }


}
