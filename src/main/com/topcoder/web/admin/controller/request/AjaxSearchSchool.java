package com.topcoder.web.admin.controller.request;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
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
            
            List<SchoolOption> schools = new ArrayList<SchoolOption>();
            for(Object[] o : list) {
                School school = (School) o[1];
                schools.add(new SchoolOption(school.getName(), (Long) o[0], school.getId()));
            }
            getRequest().setAttribute("schools", schools);            
        }
        
        if (getRequest().getParameter(UpdateIntroEvent.SCHOOL_SELECT_ID) != null) {
            setDefault(UpdateIntroEvent.SCHOOL_SELECT_ID, getRequest().getParameter(UpdateIntroEvent.SCHOOL_SELECT_ID));
        }
        getRequest().setAttribute("school_search" , search);
        getRequest().setAttribute("search_again" , searchAgain);

        setNextPage("/ajaxSearchSchool.jsp");
        setIsNextPageInContext(true);
    }


    public class SchoolOption {
        private String name;
        private Long id;
        
        public SchoolOption(String name, Long count, Long id) {
            this.name = StringUtils.htmlEncode(name) + " (" + count + ")";
            this.id = id;
        }

        public Long getId() {
            return id;
        }

        public String getName() {
            return name;
        }
        
    }
}
