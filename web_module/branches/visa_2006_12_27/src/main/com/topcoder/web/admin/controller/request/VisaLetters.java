package com.topcoder.web.admin.controller.request;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.VisaLetterEventDAO;
import com.topcoder.web.common.model.VisaLetterEvent;
import com.topcoder.web.common.tag.ListSelectTag;

/**
 * @author  cucu
 */
public class VisaLetters extends Base {
	
    protected void businessProcessing() throws Exception {

    	boolean pending = true;
    	boolean sent = false;
    	boolean denied = false;
    	
    	if (getRequest().getParameter("event") != null) {
    		pending = "true".equals(getRequest().getParameter("pending"));
    		sent = "true".equals(getRequest().getParameter("sent"));
    		denied = "true".equals(getRequest().getParameter("denied"));    		
    	}

    	VisaLetterEventDAO eventDAO =  DAOUtil.getFactory().getVisaLetterEventDAO();
    	List l = eventDAO.getAll();
    	List eventList = new ArrayList();
    	
    	for (int i = 0; i < l.size(); i++) {
    		VisaLetterEvent e = (VisaLetterEvent) l.get(0);
    		eventList.add(new ListSelectTag.Option(e.getId().toString(), e.getName(), i==0));
    	}
    	
    	setDefault("pending", String.valueOf(pending));
    	setDefault("sent", String.valueOf(sent));
    	setDefault("denied", String.valueOf(denied));
    	getRequest().setAttribute("eventList", eventList);
    	setNextPage("/visaLetters.jsp");
        setIsNextPageInContext(true);

    }


}
