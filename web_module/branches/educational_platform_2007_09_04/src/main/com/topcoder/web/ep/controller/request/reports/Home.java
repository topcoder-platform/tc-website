/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.reports;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Home extends ShortHibernateProcessor {
    @Override
    protected void dbProcessing() throws Exception {
        getRequest().setAttribute("classrooms", DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingProfessorId(new Long(getUser().getId())));
        setNextPage("/reports/selectClassroom.jsp");
        setIsNextPageInContext(true);
    }
}
