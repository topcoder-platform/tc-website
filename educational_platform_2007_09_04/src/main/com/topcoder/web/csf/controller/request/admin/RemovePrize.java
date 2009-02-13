package com.topcoder.web.csf.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.csf.model.Prize;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;

import java.util.Iterator;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class RemovePrize extends Base {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else {
            Contest contest = CSFDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            String place = StringUtils.checkNull(getRequest().getParameter(Constants.PRIZE_PLACE));

            boolean found = false;
            Set prizes = contest.getPrizes();
            if (log.isDebugEnabled()) {
                log.debug("size before: " + prizes.size());
            }
            Prize curr;
            for (Iterator it = prizes.iterator(); it.hasNext() && !found;) {
                curr = (Prize) it.next();
                if (place.equals((curr).getPlace().toString())) {
                    prizes.remove(curr);
                    found = true;
                }
            }
            if (log.isDebugEnabled()) {
                log.debug("size after: " + prizes.size());
            }
            if (!found) {
                throw new NavigationException("Could not find the prize specified " + contestId + " " + place);
            }

            CSFDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);
            markForCommit();

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=AdminViewContest&" + Constants.CONTEST_ID + "=" + contestId);
            setIsNextPageInContext(false);

        }


    }
}
