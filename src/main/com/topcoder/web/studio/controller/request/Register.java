package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestRegistration;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class Register extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        if ("POST".equals(getRequest().getMethod())) {
            Long contestId;
            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid Contest Specified");
            }

            StudioDAOFactory cFactory = StudioDAOUtil.getFactory();
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

                    StudioDAOUtil.getFactory().getContestRegistrationDAO().saveOrUpdate(cr);

                    markForCommit();
                } else {
                    addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
                }
            }

            if (hasErrors()) {
                setDefault(Constants.CONTEST_ID, contestId.toString());
                setNextPage("/contestReg.jsp");
                setIsNextPageInContext(true);
            } else {
                setDefault(Constants.CONTEST_ID, contestId.toString());
                setNextPage("/submit.jsp");
                setIsNextPageInContext(true);
            }

        } else {
            throw new NavigationException("Invalid request type.");
        }

    }
}
