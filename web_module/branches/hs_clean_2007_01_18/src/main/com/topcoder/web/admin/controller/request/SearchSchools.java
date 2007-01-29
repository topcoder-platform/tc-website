package com.topcoder.web.admin.controller.request;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.SchoolDAO;
import com.topcoder.web.common.model.SchoolType;


/**
 * @author  cucu
 */
public class SearchSchools extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
    	DAOFactory dao = DAOUtil.getFactory();
    	SchoolDAO s = dao.getSchoolDAO();
    	String cc = getRequest().getParameter("cc");
    	Integer type = SchoolType.HIGH_SCHOOL;
    	Date creationAfter = null;
    	String order = "c";
    	
    	if (getRequest().getParameter("type") != null) {
    		type = new Integer(getRequest().getParameter("type")); 
    	}
    	
    	if (getRequest().getParameter("order") != null) {
    		order = getRequest().getParameter("order"); 
    	}
    	
    	if (getRequest().getParameter("date") != null && getRequest().getParameter("date").trim().length() > 0) {
    		creationAfter = new SimpleDateFormat("MM/dd/yy").parse(getRequest().getParameter("date"));
    	}
    	    	
    	List schools = s.search(type.intValue() <0? null:dao.getSchoolTypeDAO().find(type), creationAfter, cc, "c".equals(order), 0, 10000);
    	getRequest().setAttribute("schools", schools);
    	
    	setNextPage("/searchSchools.jsp");
        setIsNextPageInContext(true);
    }

}
