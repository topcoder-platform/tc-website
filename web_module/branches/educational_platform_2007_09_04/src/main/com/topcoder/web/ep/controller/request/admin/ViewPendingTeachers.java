package com.topcoder.web.ep.controller.request.admin;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.educ.ProfessorStatus;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Oct 18, 2007
 */
public class ViewPendingTeachers extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        //load up the professors and put them in the request
        DAOFactory fact = DAOUtil.getFactory();
        getRequest().setAttribute("teachers",
                fact.getProfessorDAO().getProfessors(fact.getProfessorStatusDA0().find(ProfessorStatus.PENDING)));
        setNextPage("/admin/pendingTeachers.jsp");
        setIsNextPageInContext(true);
    }
}
