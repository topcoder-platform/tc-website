package com.topcoder.web.ep.controller.request.admin;

import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrLocal;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.common.model.educ.ProfessorStatus;
import com.topcoder.web.ep.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Oct 18, 2007
 */
public class EnableProfessor extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        Long professorId = new Long(getRequest().getParameter(Constants.PROFESSOR_ID));
        Professor prof = DAOUtil.getFactory().getProfessorDAO().find(professorId);
        if (prof == null) {
            throw new NavigationException("professor doesn't exist " + professorId);
        } else {
            if (ProfessorStatus.ACTIVE.equals(prof.getStatus().getId())) {
                //don't do anything
            } else if (ProfessorStatus.PENDING.equals(prof.getStatus().getId())) {
                prof.setStatus(DAOUtil.getFactory().getProfessorStatusDA0().find(ProfessorStatus.ACTIVE));
                PrincipalMgrLocal pm =
                        (PrincipalMgrLocal) com.topcoder.web.common.security.Constants.createLocalEJB(PrincipalMgrLocal.class);
                UserPrincipal up = pm.getUser(professorId);
                RolePrincipal rp = pm.getRole(Constants.PROFESSOR_ROLE_ID);
                pm.assignRole(up, rp, new TCSubject(100129));
            } else {
                throw new NavigationException("invalid status for professor, can't activate " + prof.getStatus().getId());
            }
        }
        setNextPage("/admin/profActivationSuccess.jsp");
        setIsNextPageInContext(true);
    }
}
