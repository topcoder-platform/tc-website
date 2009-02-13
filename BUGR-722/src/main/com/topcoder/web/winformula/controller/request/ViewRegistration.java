package com.topcoder.web.winformula.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.dao.WinformulaDAOUtil;
import com.topcoder.web.winformula.model.Contest;
import com.topcoder.web.winformula.model.ContestStatus;

import java.util.Date;

/**
 * @author dok
 * @version $Revision: 72012 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ViewRegistration extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {

        if (userLoggedIn()) {
            String contestId = getRequest().getParameter(Constants.CONTEST_ID);
            if ("".equals(StringUtils.checkNull(contestId))) {
                throw new NavigationException("No contest specified");
            } else {
                Long cid;
                try {
                    cid = new Long(contestId);
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid contest specified");
                }
                Contest contest = WinformulaDAOUtil.getFactory().getContestDAO().find(cid);

                if (ContestStatus.ACTIVE.equals(contest.getStatus().getId())) {
                    Date now = new Date();
                    if (contest.getStartTime().before(now) && contest.getEndTime().after(now)) {
                        setDefault(Constants.CONTEST_ID, contest.getId().toString());
                        getRequest().setAttribute("contest", contest);
                    } else {
                        throw new NavigationException("Inactive contest specified.");
                    }
                } else {
                    throw new NavigationException("Invalid contest specified.");
                }

                boolean registered = false;
                User u = DAOUtil.getFactory().getUserDAO().find(getUser().getId());
                if (WinformulaDAOUtil.getFactory().getContestRegistrationDAO().find(contest, u) != null) {
                    registered = true;
                }

                getRequest().setAttribute("registered", registered);

                setNextPage("/contestReg.jsp");
                setIsNextPageInContext(true);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
}
