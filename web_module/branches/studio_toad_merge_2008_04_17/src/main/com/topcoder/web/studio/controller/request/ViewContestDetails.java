package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.studio.util.Util;

import java.util.Date;

/**
 * @author dok, isv
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
            Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(cid);

            // Since TopCoder Studio Modifications Assembly - the contest creator may also view the contest
            // details (for preview) (Req# 5.5)
            long userId = getUser().getId();
            if (Util.isAdmin(userId) || (userId == contest.getCreateUserId())) {
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
                User u = DAOUtil.getFactory().getUserDAO().find(userId);
                if (StudioDAOUtil.getFactory().getContestRegistrationDAO().find(contest, u) != null) {
                    registered = true;
                }
            }
            
            getRequest().setAttribute("registered", registered);

            if ("on".equalsIgnoreCase(Constants.GLOBAL_AD_FLAG)) {
                if (userIdentified()) {
                    getRequest().setAttribute("has_global_ad", PactsServicesLocator.getService().hasGlobalAD(getUser().getId()));
                } else {
                    getRequest().setAttribute("has_global_ad", false);
                }
            }

            getRequest().setAttribute("currentTime", new Date());

            setNextPage("/contestDetails.jsp");
            setIsNextPageInContext(true);
        }

    }

}
