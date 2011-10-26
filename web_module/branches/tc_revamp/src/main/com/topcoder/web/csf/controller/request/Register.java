package com.topcoder.web.csf.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOFactory;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.model.ContestRegistration;

/**
 * @author dok
 * @version $Revision: 57868 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class Register extends Base {
    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            if ("POST".equals(getRequest().getMethod())) {
                Long contestId;
                try {
                    contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid Contest Specified");
                }

                CSFDAOFactory cFactory = CSFDAOUtil.getFactory();
                DAOFactory factory = DAOUtil.getFactory();

                Contest c = cFactory.getContestDAO().find(contestId);
                User u = factory.getUserDAO().find(new Long(getUser().getId()));

                if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                    if ("on".equals(getRequest().getParameter(Constants.TERMS_AGREE))) {

                        ContestRegistration cr = new ContestRegistration();
                        cr.setContest(c);
                        cr.setUser(u);
                        cr.setTerms(DAOUtil.getFactory().getTermsOfUse().find(new Integer(Constants.CONTEST_TERMS_OF_USE_ID)));
                        cr.getId().setContest(c);
                        cr.getId().setUser(u);

                        cFactory.getContestRegistrationDAO().saveOrUpdate(cr);

                        markForCommit();
                    } else {
                        addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
                    }
                }

                if (hasErrors()) {
                    setDefault(Constants.CONTEST_ID, contestId.toString());
                    getRequest().setAttribute("contest", c);
                    setNextPage("/contestReg.jsp");
                    setIsNextPageInContext(true);
                } else {
                    StringBuffer buf = new StringBuffer(50);
                    buf.append(getSessionInfo().getServletPath());
                    buf.append("?" + Constants.MODULE_KEY + "=ViewContestDetails&");
                    buf.append(Constants.CONTEST_ID + "=").append(contestId);
                    setNextPage(buf.toString());
                    setIsNextPageInContext(false);

                }

            } else {
                throw new NavigationException("Invalid request type.");
            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }


}
