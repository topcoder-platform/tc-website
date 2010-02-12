/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.admin;

import java.util.Arrays;
import java.util.List;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestStatus;

/**
 * <p>This class will process a request to view contest administration page.</p>
 *
 * <p>
 *   Version 1.1 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) Change notes:
 *   <ol>
 *     <li>Added constant with all the options for the number of milestone prizes.</li>
 *     <li>Added constants with the values for the Contest Format radiobuttons.</li>
 *   </ol>
 * </p>
 *
 * @author dok, isv, pulky
 * @version 1.1
 */
public class ViewContest extends Base {

    /**
     * <p>A <code>List<Integer></code> providing a list with all the options for the number of milestone prizes.</p>
     *
     * @since 1.1
     */
    public static final List<Integer> NUMBER_MILESTONE_PRIZES_OPTIONS = Arrays.asList(0, 1, 2, 3, 4, 5);

    /**
     * <p>A <code>String</code> providing the value of the single round option for the radiobutton selection.</p>
     *
     * @since 1.1
     */
    public static final String SINGLE_ROUND = "sr";

    /**
     * <p>A <code>String</code> providing the value of the single round option for the radiobutton selection.</p>
     *
     * @since 1.1
     */
    public static final String MULTI_ROUND = "mr";

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
