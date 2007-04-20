package com.topcoder.web.admin.controller.request;

import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;

/**
 * @author cucu
 */
public class AjaxSearchSchool extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {
        String search = getRequest().getParameter("school_search");

        boolean searchAgain = getRequest().getParameter("search_again") != null;
        
        if (!searchAgain) {
            List schools = DAOUtil.getFactory().getSchoolDAO().searchByName(search, 100);
            getRequest().setAttribute("schools", schools);
        }
        
        getRequest().setAttribute("school_search" , search);
        getRequest().setAttribute("search_again" , searchAgain);

        setNextPage("/ajaxSearchSchool.jsp");
        setIsNextPageInContext(true);
    }


}
