package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestStatus;

import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ViewRegistration extends ShortHibernateProcessor {
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

            setNextPage("/contestReg.jsp");
            setIsNextPageInContext(true);
        }
    }
}
