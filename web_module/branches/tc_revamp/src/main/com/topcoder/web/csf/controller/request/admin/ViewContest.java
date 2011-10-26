package com.topcoder.web.csf.controller.request.admin;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.model.ContestStatus;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ViewContest extends Base {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if (!"".equals(StringUtils.checkNull(contestId))) {
            //load
            Contest contest = CSFDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            loadEditContestData(contest);
        } else {
            setDefault(Constants.CONTEST_STATUS_ID, ContestStatus.UNACTIVE);
            loadGeneralEditContestData();
        }
        setNextPage("/admin/editContest.jsp");
        setIsNextPageInContext(true);

    }
}
