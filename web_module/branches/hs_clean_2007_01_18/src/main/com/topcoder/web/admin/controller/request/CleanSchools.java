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
public class CleanSchools extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
    	DAOFactory dao = DAOUtil.getFactory();
    	SchoolDAO s = dao.getSchoolDAO();
    	String cc = getRequest().getParameter("cc");
    	int sr = 1;
    	int nr = 50;
    	Integer type = SchoolType.HIGH_SCHOOL;
    	Date creationAfter = null;
    	String order = "c";
    	
    	if (getRequest().getParameter("type") != null) {
    		type = new Integer(getRequest().getParameter("type")); 
    	}
    	
    	if (getRequest().getParameter("sr") != null) {
    		sr = Integer.parseInt(getRequest().getParameter("sr")); 
    	}
    	if (getRequest().getParameter("nr") != null) {
    		nr = Integer.parseInt(getRequest().getParameter("nr")); 
    	}

    	if (getRequest().getParameter("order") != null) {
    		order = getRequest().getParameter("order"); 
    	}
    	
    	if (getRequest().getParameter("date") != null && getRequest().getParameter("date").trim().length() > 0) {
    		creationAfter = new SimpleDateFormat("MM/dd/yy").parse(getRequest().getParameter("date"));
    	}
    	
    	setDefault("sr", sr + "");
    	setDefault("nr", nr + "");
    	setDefault("cc", cc);
    	setDefault("type", type);
    	setDefault("order", order);
    	setDefault("date", getRequest().getParameter("date"));
    	setDefault("ua", getRequest().getParameter("cc") == null? "true" :getRequest().getParameter("ua") );
    	
    	List schools = s.search(type.intValue() <0? null:dao.getSchoolTypeDAO().find(type), creationAfter, cc, "c".equals(order), sr - 1, nr);
    	getRequest().setAttribute("schools", schools);
    	getRequest().setAttribute("displayNext", Boolean.valueOf(schools.size() == nr));
    	
        getRequest().setAttribute("countries", dao.getCountryDAO().getCountries());
    	
    	setNextPage("/cleanSchools.jsp");
        setIsNextPageInContext(true);
    }

}
