package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.SchoolDAO;
import com.topcoder.web.common.model.SchoolType;


/**
 * @author  cucu
 */
public class CleanSchools extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
    	SchoolDAO s = DAOUtil.getFactory().getSchoolDAO();
    	Integer cc = null;
    	
    	if (getRequest().getParameter("cc") != null) {
    		cc = new Integer(getRequest().getParameter("cc"));
    	}
    	
    	getRequest().setAttribute("schools", s.search(DAOUtil.getFactory().getSchoolTypeDAO().find(SchoolType.HIGH_SCHOOL), null, cc, 1, 100));
    	
    	setNextPage("/cleanSchools.jsp");
        setIsNextPageInContext(true);
    }

}
