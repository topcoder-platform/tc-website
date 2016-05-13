package com.topcoder.web.admin.controller.request;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.SchoolDAO;


/**
 * @author  cucu
 */
public class SearchSchools extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        try {
        DAOFactory dao = DAOUtil.getFactory();
        SchoolDAO s = dao.getSchoolDAO();
        String cc = getRequest().getParameter("cc");
        String name = getRequest().getParameter("name");
        Integer type = new Integer(getRequest().getParameter("type"));
        Date creationAfter = StringUtils.checkNull(getRequest().getParameter("date")).trim().length()==0 ? null :
            new SimpleDateFormat("MM/dd/yy").parse(getRequest().getParameter("date"));
        String order = getRequest().getParameter("order");


        List schools = s.search(type.intValue() <0? null:dao.getSchoolTypeDAO().find(type), name, creationAfter, cc, "c".equals(order));
        getRequest().setAttribute("schools", schools);
        } catch (Exception e) {
            addError("error", e.getMessage());
        }
        setNextPage("/searchSchools.jsp");
        setIsNextPageInContext(true);
    }

}
