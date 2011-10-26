package com.topcoder.web.ep.controller.request.admin;

import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrLocal;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.common.model.educ.ProfessorStatus;
import com.topcoder.web.ep.Constants;

/**
 * @author dok
 * @version $Revision: 66785 $ Date: 2005/01/01 00:00:00
 *          Create Date: Oct 18, 2007
 */
public class EnableTeacher extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        Long professorId = new Long(getRequest().getParameter(Constants.PROFESSOR_ID));
        Professor teacher = DAOUtil.getFactory().getProfessorDAO().find(professorId);
        if (teacher == null) {
            throw new NavigationException("teacher doesn't exist " + professorId);
        } else {
            if (ProfessorStatus.ACTIVE.equals(teacher.getStatus().getId())) {
                //don't do anything
            } else if (ProfessorStatus.PENDING.equals(teacher.getStatus().getId())) {
                teacher.setStatus(DAOUtil.getFactory().getProfessorStatusDA0().find(ProfessorStatus.ACTIVE));
                PrincipalMgrLocal pm =
                        (PrincipalMgrLocal) com.topcoder.web.common.security.Constants.createLocalEJB(PrincipalMgrLocal.class);
                UserPrincipal up = pm.getUser(professorId);
                RolePrincipal rp = pm.getRole(Constants.PROFESSOR_ROLE_ID);
                pm.assignRole(up, rp, new TCSubject(100129));
                //remove any cached stuff for the teacher
                SecurityHelper.getUserSubject(teacher.getId(), true);
            } else {
                throw new NavigationException("invalid status for teacher, can't activate " + teacher.getStatus().getId());
            }
        }
        setNextPage("/admin/teacherActivationSuccess.jsp");
        setIsNextPageInContext(true);
    }
}
