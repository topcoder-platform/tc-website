package com.topcoder.web.creative.controller.request.admin;

import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.creative.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class EditContest extends HibernateProcessor {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        String name = getRequest().getParameter(Constants.CONTEST_NAME);
        String startTime = getRequest().getParameter(Constants.START_TIME);
        String endTime = getRequest().getParameter(Constants.START_TIME);

        if ("".equals(StringUtils.checkNull(contestId))) {
            //add
        } else {
            //edit
        }
        setNextPage("/admin/editContest.jsp");
        setIsNextPageInContext(true);

    }
}
