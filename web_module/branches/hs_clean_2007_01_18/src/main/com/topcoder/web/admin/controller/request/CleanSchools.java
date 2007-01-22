package com.topcoder.web.admin.controller.request;


/**
 * @author  cucu
 */
public class CleanSchools extends Base {

    protected void businessProcessing() throws Exception {
/*    	long s1 = Long.parseLong(getRequest().getParameter("s1"));
    	long s2 = Long.parseLong(getRequest().getParameter("s2"));
    	
    	School s = (School) createEJB(getInitialContext(), School.class);

    	s.mergeSchools(s1, s2);*/
    	setNextPage("/cleanSchool.jsp");
        setIsNextPageInContext(true);
    }

}
