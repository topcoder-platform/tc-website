package com.topcoder.web.admin.controller.request;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.VisaLetterEventDAO;
import com.topcoder.web.common.model.VisaLetterEvent;

/**
 * @author  cucu
 */
public class UpdateEvent extends ShortHibernateProcessor {
	
	public static final String EID = "eid";

	protected void dbProcessing() throws  Exception {  	
    	VisaLetterEventDAO eventDAO =  DAOUtil.getFactory().getVisaLetterEventDAO();
    	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    	
    	String name = getRequest().getParameter(EditEvent.NAME);
    	if (name == null || name.trim().length() == 0) {
    		addError("error", "Please enter the event name");
    	}
    	
    	Date startDate = null;
    	try {
    		startDate = sdf.parse(getRequest().getParameter(EditEvent.START_DATE));
    	} catch(Exception e) {
    		addError("error", "Please insert a valid start date");
    	}

    	Date endDate = null;
    	try {
    		endDate = sdf.parse(getRequest().getParameter(EditEvent.END_DATE));
    	} catch(Exception e) {
    		addError("error", "Please insert a valid end date");
    	}

		if (hasErrors()) {
			setDefault("name", getRequest().getParameter(EditEvent.NAME));
			setDefault("startDate",getRequest().getParameter(EditEvent.START_DATE));
			setDefault("endDate", getRequest().getParameter(EditEvent.END_DATE));
	        setNextPage("/editEvent.jsp");
	        setIsNextPageInContext(true);
	        return;			
		}
		VisaLetterEvent event;
		if (getRequest().getParameter(EID) != null) {
			event = eventDAO.find(new Long(getRequest().getParameter(EID)));
		} else {
			event = new VisaLetterEvent();
		}
		
		event.setName(name);
		event.setStartDate(startDate);
		event.setEndDate(endDate);
		eventDAO.saveOrUpdate(event);

    	setNextPage("/admin/?module=EventList");
        setIsNextPageInContext(false);
    }


}
