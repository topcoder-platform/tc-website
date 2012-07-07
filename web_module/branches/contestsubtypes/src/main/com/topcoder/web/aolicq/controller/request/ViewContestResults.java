package com.topcoder.web.aolicq.controller.request;

import com.topcoder.security.TCPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.aolicq.Constants;
import com.topcoder.web.aolicq.dao.AolicqDAOUtil;
import com.topcoder.web.aolicq.model.Contest;
import com.topcoder.web.aolicq.model.ContestStatus;

import java.util.Date;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 13, 2007
 */
public class ViewContestResults extends ShortHibernateProcessor {
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
            getRequest().setAttribute("hasScores", contest.getProject()!=null);

            if (isAdmin()) {
                getRequest().setAttribute("contest", contest);
                loadData(cid);
            } else {
                if (ContestStatus.ACTIVE.equals(contest.getStatus().getId())) {
                    Date now = new Date();
                    if (contest.getEndTime().before(now)) {
                        getRequest().setAttribute("contest", contest);
                        loadData(cid);
                    } else {
                        throw new NavigationException("Inactive contest specified.");
                    }
                } else {
                    throw new NavigationException("Invalid contest specified.");
                }
            }

            setNextPage("/results.jsp");
            setIsNextPageInContext(true);
        }

    }

    private void loadData(Long cid) throws Exception {
        DataAccess da = new CachedDataAccess(DBMS.AOLICQ_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("contest_results");
        r.setProperty(Constants.CONTEST_ID, cid.toString());
        getRequest().setAttribute("results", da.getData(r).get("contest_results"));
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