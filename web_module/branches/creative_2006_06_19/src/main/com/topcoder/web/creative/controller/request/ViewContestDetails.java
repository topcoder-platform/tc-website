package com.topcoder.web.creative.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOUtil;
import com.topcoder.web.creative.model.Contest;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ViewContestDetails extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        //todo only allow the viewing of active contests..contests with appropriate status for normal users
        //todo admins can view projects with other statii

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
            Contest contest = CreativeDAOUtil.getFactory().getContestDAO().find(cid);
            getRequest().setAttribute("contest", contest);

            setNextPage("/contestDetails.jsp");
            setIsNextPageInContext(true);
        }

    }
}
