package com.topcoder.web.admin.controller.request;

import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;

/**
 * Display a list of introductory events, where the user can do some actions on them.
 * 
 * @author Cucu
 */
public class IntroEventList extends ShortHibernateProcessor {

    
    @Override
    protected void dbProcessing() throws Exception {
        int sr = getRequest().getParameter("sr") == null? 0 : Integer.parseInt(getRequest().getParameter("sr"));
        
        List l = DAOUtil.getFactory().getIntroEventDAO().getList(sr, 20);

        getRequest().setAttribute("events", l);
        getRequest().setAttribute("sr", sr);
        getRequest().setAttribute("hasNext", l.size() == 20);

        setNextPage("/introEventList.jsp");
        setIsNextPageInContext(true);        
    }

}
