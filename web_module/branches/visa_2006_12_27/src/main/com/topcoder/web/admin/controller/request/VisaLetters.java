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

    	if (getRequest().getParameter("event") != null) {
    		
    	}

    	VisaLetterEventDAO eventDAO =  DAOUtil.getFactory().getVisaLetterEventDAO();
    	List l = eventDAO.getAll();
    	List eventList = new ArrayList();
    	
    	for (int i = 0; i < l.size(); i++) {
    		VisaLetterEvent e = (VisaLetterEvent) l.get(0);
    		eventList.add(new ListSelectTag.Option(e.getId().toString(), e.getName(), i==0));
    	}
    	
    	getRequest().setAttribute("eventList", eventList);
    	setNextPage("/visaLetters.jsp");
        setIsNextPageInContext(true);

    }


}
