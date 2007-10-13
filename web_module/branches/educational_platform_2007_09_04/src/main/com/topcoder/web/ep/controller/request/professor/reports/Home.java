/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor.reports;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Home extends ShortHibernateProcessor {

    private static Logger log = Logger.getLogger(Home.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        getRequest().setAttribute("classrooms", DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingProfessorId(new Long(getUser().getId())));
        setNextPage("/reports/selectClassroom.jsp");
        setIsNextPageInContext(true);
    }
}
