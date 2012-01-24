package com.topcoder.web.aolicq.controller.request;

import com.topcoder.security.TCPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.aolicq.Constants;
import com.topcoder.web.aolicq.dao.AolicqDAOUtil;
import com.topcoder.web.aolicq.model.Contest;
import com.topcoder.web.aolicq.model.ContestStatus;

import java.util.Date;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ViewContestDetails extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
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
            Contest contest = AolicqDAOUtil.getFactory().getContestDAO().find(cid);
            if (log.isDebugEnabled()) {
                if (contest==null) {
                    log.debug("couldn't find contest " + cid);
                }
            }

            if (isAdmin()) {
                getRequest().setAttribute("contest", contest);
            } else {
                if (ContestStatus.ACTIVE.equals(contest.getStatus().getId())) {
                    Date now = new Date();
                    if (contest.getStartTime().before(now)) {
                        getRequest().setAttribute("contest", contest);
                    } else {
                        throw new NavigationException("Inactive contest specified.");
                    }
                } else {
                    throw new NavigationException("Invalid contest specified.");
                }
            }
            boolean registered = false;
            if (userIdentified()) {
                User u = DAOUtil.getFactory().getUserDAO().find(getUser().getId());
                if (AolicqDAOUtil.getFactory().getContestRegistrationDAO().find(contest, u) != null) {
                    registered = true;
                }
            }

            getRequest().setAttribute("registered", registered);

            getRequest().setAttribute("currentTime", new Date());

            setNextPage("/contestDetails.jsp");
            setIsNextPageInContext(true);
        }

    }

    private boolean isAdmin() throws Exception {
        TCSubject subject = SecurityHelper.getUserSubject(getUser().getId());
        boolean found = false;
        for (Iterator it = subject.getPrincipals().iterator(); it.hasNext() && !found;) {
            found = ((TCPrincipal) it.next()).getId() == Constants.CONTEST_ADMIN_ROLE_ID;
        }
        return found;
    }


}
