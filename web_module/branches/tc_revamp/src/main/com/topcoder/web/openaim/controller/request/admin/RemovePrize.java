package com.topcoder.web.openaim.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.openaim.Constants;
import com.topcoder.web.openaim.dao.OpenAIMDAOUtil;
import com.topcoder.web.openaim.model.Contest;
import com.topcoder.web.openaim.model.Prize;

import java.util.Iterator;
import java.util.Set;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class RemovePrize extends Base {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        String prizeId = getRequest().getParameter(Constants.PRIZE_ID);
        if (log.isDebugEnabled()) {
            log.debug("prize id " + prizeId);
        }

        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else if ("".equals(StringUtils.checkNull(prizeId))) {
            throw new NavigationException("No prize specified");
        } else {
            Contest contest = OpenAIMDAOUtil.getFactory().getContestDAO().find(new Long(contestId));

            boolean found = false;
            Set prizes = contest.getPrizes();
            if (log.isDebugEnabled()) {
                log.debug("size before: " + prizes.size());
            }
            Prize curr;
            for (Iterator it = prizes.iterator(); it.hasNext() && !found;) {
                curr = (Prize) it.next();
                if (curr.getId().toString().equals(prizeId)) {
                    prizes.remove(curr);
                    found = true;
                }
            }
            if (log.isDebugEnabled()) {
                log.debug("size after: " + prizes.size());
            }
            if (!found) {
                throw new NavigationException("Could not find the prize specified " + contestId + " " + prizeId);
            }

            OpenAIMDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=AdminViewContest&" + Constants.CONTEST_ID + "=" + contestId);
            setIsNextPageInContext(false);

        }


    }
}
