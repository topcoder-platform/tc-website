package com.topcoder.web.creative.controller.request.admin;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOUtil;
import com.topcoder.web.creative.model.Contest;

import java.text.SimpleDateFormat;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ViewContest extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if (!"".equals(StringUtils.checkNull(contestId))) {
            //load
            Contest contest = CreativeDAOUtil.getFactory().getContestDAO().find(new Long(contestId));

            getRequest().setAttribute("contest", contest);

            SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);

            setDefault(Constants.CONTEST_ID, contest.getId());
            setDefault(Constants.CONTEST_NAME, contest.getName());
            setDefault(Constants.START_TIME, sdf.format(contest.getStartTime()));
            setDefault(Constants.END_TIME, sdf.format(contest.getEndTime()));

        }
        setNextPage("/admin/editContest.jsp");
        setIsNextPageInContext(true);

    }
}
