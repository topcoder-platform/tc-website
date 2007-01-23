package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.SchoolDAO;
import com.topcoder.web.common.model.SchoolType;


/**
 * @author  cucu
 */
public class CleanSchools extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
    	DAOFactory dao = DAOUtil.getFactory();
    	SchoolDAO s = dao.getSchoolDAO();
    	String cc = getRequest().getParameter("cc");
    	int sr = 1;
    	int nr = 50;
    	
    	if (getRequest().getParameter("sr") != null) {
    		sr = Integer.parseInt(getRequest().getParameter("sr")); 
    	}
    	if (getRequest().getParameter("nr") != null) {
    		nr = Integer.parseInt(getRequest().getParameter("nr")); 
    	}
    	
    	getRequest().setAttribute("schools", s.search(dao.getSchoolTypeDAO().find(SchoolType.HIGH_SCHOOL), null, cc, sr, nr));
        getRequest().setAttribute("countries", dao.getCountryDAO().getCountries());
    	
    	setNextPage("/cleanSchools.jsp");
        setIsNextPageInContext(true);
    }

}
