package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestStatus;

/**
 * @author dok, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ViewContest extends Base {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        // Update since TopCoder Studio Modifications v2 Assembly - the handle for contest creator is bound to request
        String contestCreatorHandle;
        if (!"".equals(StringUtils.checkNull(contestId))) {
            //load
            Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            loadEditContestData(contest);
            User contestCreator = DAOUtil.getFactory().getUserDAO().find(contest.getCreateUserId());
            contestCreatorHandle = contestCreator.getHandle();
        } else {
            setDefault(Constants.CONTEST_STATUS_ID, ContestStatus.UNACTIVE);
            loadGeneralEditContestData();
            contestCreatorHandle = getUser().getUserName();
        }
        getRequest().setAttribute("contestCreatorHandle", contestCreatorHandle);

        setNextPage("/admin/editContest.jsp");
        setIsNextPageInContext(true);
    }
}
