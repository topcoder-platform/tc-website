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
    	Integer type = SchoolType.HIGH_SCHOOL;
    	
    	if (getRequest().getParameter("type") != null) {
    		type = new Integer(getRequest().getParameter("type")); 
    	}
    	
    	if (getRequest().getParameter("sr") != null) {
    		sr = Integer.parseInt(getRequest().getParameter("sr")); 
    	}
    	if (getRequest().getParameter("nr") != null) {
    		nr = Integer.parseInt(getRequest().getParameter("nr")); 
    	}
    	
    	setDefault("sr", sr + "");
    	setDefault("nr", nr + "");
    	setDefault("cc", cc);
    	setDefault("type", type);
    	
    	getRequest().setAttribute("schools", s.search(dao.getSchoolTypeDAO().find(type), null, cc, sr, nr));
        getRequest().setAttribute("countries", dao.getCountryDAO().getCountries());
    	
    	setNextPage("/cleanSchools.jsp");
        setIsNextPageInContext(true);
    }

}
