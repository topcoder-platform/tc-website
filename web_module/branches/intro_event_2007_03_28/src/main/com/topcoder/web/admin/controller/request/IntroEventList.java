package com.topcoder.web.admin.controller.request;

import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;

public class IntroEventList extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {
        int start = getRequest().getParameter("sr") == null? 0 : Integer.parseInt(getRequest().getParameter("sr"));
        
        List l = DAOUtil.getFactory().getIntroEventDAO().getList(start, 20);

        getRequest().setAttribute("events", l);

        setNextPage("/introEventList.jsp");
        setIsNextPageInContext(true);        
    }

}
