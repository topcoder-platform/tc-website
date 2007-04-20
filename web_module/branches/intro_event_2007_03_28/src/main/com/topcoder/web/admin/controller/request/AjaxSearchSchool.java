package com.topcoder.web.admin.controller.request;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.School;

/**
 * @author cucu
 */
public class AjaxSearchSchool extends ShortHibernateProcessor {

    @SuppressWarnings("unchecked")
    @Override
    protected void dbProcessing() throws Exception {
        String search = getRequest().getParameter("school_search");

        boolean searchAgain = getRequest().getParameter("search_again") != null;
        
        if (!searchAgain) {
            List<Object[]> list = DAOUtil.getFactory().getSchoolDAO().searchByName("%" + search + "%", 100);
            
            List<School> schools = new ArrayList<School>();
            for(Object[] o : list) {
                Long count = (Long) o[0];
                School school = (School) o[1];
//                school.setName(school.getName() + " (" + count + ")");
                
                schools.add(school);
            }
            getRequest().setAttribute("schools", schools);
        }
        
        getRequest().setAttribute("school_search" , search);
        getRequest().setAttribute("search_again" , searchAgain);

        setNextPage("/ajaxSearchSchool.jsp");
        setIsNextPageInContext(true);
    }


}
