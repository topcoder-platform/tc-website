package com.topcoder.web.csf.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.model.ContestStatus;

import java.util.Date;

/**
 * @author dok
 * @version $Revision: 58490 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ViewContestDetails extends Base {
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
            Contest contest = CSFDAOUtil.getFactory().getContestDAO().find(cid);

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
                User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
                if (CSFDAOUtil.getFactory().getContestRegistrationDAO().find(contest, u) != null) {
                    registered = true;
                }
            }

            getRequest().setAttribute("registered", Boolean.valueOf(registered));

            getRequest().setAttribute("currentTime", new Date());

            setNextPage("/contestDetails.jsp");
            setIsNextPageInContext(true);
        }

    }


}
