package com.topcoder.web.admin.controller.request;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.school.School;

/**
 * @author  cucu
 */
public class MergeSchools extends Base {

    protected void businessProcessing() throws Exception {
    	long s1 = Long.parseLong(getRequest().getParameter("s1"));
    	long s2 = Long.parseLong(getRequest().getParameter("s2"));
    	
    	School s = (School) createEJB(getInitialContext(), School.class);

    	s.createSchool(DBMS.OLTP_DATASOURCE_NAME, "", "A", "Bs As", "Argentina", 7545675,"Test");
    	s.mergeSchools(s1, s2);
    	
    	setNextPage("/admin/?" + getRequest().getQueryString().replaceFirst("MergeSchools", "CleanSchools"));
        setIsNextPageInContext(false);
    }

}
