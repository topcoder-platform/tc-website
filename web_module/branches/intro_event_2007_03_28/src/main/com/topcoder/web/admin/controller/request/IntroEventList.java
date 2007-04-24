package com.topcoder.web.admin.controller.request;

import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;

public class IntroEventList extends ShortHibernateProcessor {

    public static final int NUM_ROWS = 5;
    
    @Override
    protected void dbProcessing() throws Exception {
        int sr = getRequest().getParameter("sr") == null? 0 : Integer.parseInt(getRequest().getParameter("sr"));
        
        List l = DAOUtil.getFactory().getIntroEventDAO().getList(sr, NUM_ROWS);

        getRequest().setAttribute("events", l);
        getRequest().setAttribute("sr", sr);
        getRequest().setAttribute("hasNext", l.size() < NUM_ROWS);

        setNextPage("/introEventList.jsp");
        setIsNextPageInContext(true);        
    }

}
