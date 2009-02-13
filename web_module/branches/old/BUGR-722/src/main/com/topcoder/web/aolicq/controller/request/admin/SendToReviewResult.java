package com.topcoder.web.aolicq.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.aolicq.Constants;
import com.topcoder.web.aolicq.dao.AolicqDAOFactory;
import com.topcoder.web.aolicq.dao.AolicqDAOUtil;
import com.topcoder.web.aolicq.model.Contest;
import com.topcoder.web.aolicq.model.Submission;

import java.util.Date;

/**
 * @author dok
 * @version $Revision: 73726 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 23, 2007
 */
public class SendToReviewResult extends Base {

    protected void dbProcessing() throws Exception {

        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else {
            AolicqDAOFactory factory = AolicqDAOUtil.getFactory();
            Date now = new Date();
            Long cid;
            try {
                cid = new Long(contestId);
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid contest id specified");
            }
            Contest c = factory.getContestDAO().find(cid);
            //check if all the submissions in the contest have been reviewed.

            int count = 0;
            if (c.getProject() != null) {
                if (now.after(c.getEndTime())) {
                    for (Submission s : c.getSubmissions()) {
                        count += s.getORSubmission() == null ? 0 : 1;
                    }
                    getRequest().setAttribute("count", count);
                    getRequest().setAttribute("contest", c);
                    setNextPage("/admin/sendToReviewResult.jsp");
                    setIsNextPageInContext(true);
                } else {
                    throw new NavigationException("Sorry, you can't send submissions to online review until the submission phase is over.");
                }
            } else {
                throw new NavigationException("Sorry, this contest is not associated with a project in Online Review.");
            }
        }
    }


}
