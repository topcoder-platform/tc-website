package com.topcoder.web.creative.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOFactory;
import com.topcoder.web.creative.dao.CreativeDAOUtil;
import com.topcoder.web.creative.model.Contest;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class ViewSubmission extends HibernateProcessor {
    //check if they're registered
    //if not, go to reg page
    //if so, go to submission page

    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            CreativeDAOFactory cFactory = CreativeDAOUtil.getFactory();
            DAOFactory factory = DAOUtil.getFactory();
            Long contestId;
            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid Contest Specified");
            }

            Contest c = cFactory.getContestDAO().find(contestId);
            User u = factory.getUserDAO().find(new Long(getUser().getId()));

            if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                //not registered
                setNextPage("/contestReg.jsp");
                setIsNextPageInContext(true);
            } else {
                //registered
                setDefault(Constants.CONTEST_ID, contestId.toString());
                setNextPage("/submit.jsp");
                setIsNextPageInContext(true);
            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
}
