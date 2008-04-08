package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.studio.util.Util;

import java.util.Date;

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
            Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(cid);
            getRequest().setAttribute("hasScores", contest.getProject() != null);

            if (Util.isAdmin(getUser().getId())) {
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
        DataAccess da = new CachedDataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("contest_results");
        r.setProperty(Constants.CONTEST_ID, cid.toString());
        getRequest().setAttribute("results", da.getData(r).get("contest_results"));
    }

}