package com.topcoder.web.creative.controller.request.admin;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOUtil;
import com.topcoder.web.creative.model.Contest;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ViewContest extends Base {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if (!"".equals(StringUtils.checkNull(contestId))) {
            //load
            Contest contest = CreativeDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            loadEditContestData(contest);

        }
        setNextPage("/admin/editContest.jsp");
        setIsNextPageInContext(true);

    }
}
