package com.topcoder.web.csf.controller.request;

import com.topcoder.web.studio.controller.request.*;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.model.User;
import com.topcoder.shared.security.ClassResource;

import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class ViewSubmission extends com.topcoder.web.studio.controller.request.BaseSubmissionDataProcessor {

    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            StudioDAOFactory cFactory = StudioDAOUtil.getFactory();
            DAOFactory factory = DAOUtil.getFactory();
            Long contestId;
            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid Contest Specified");
            }

            Contest c = cFactory.getContestDAO().find(contestId);
            Date now = new Date();
            if (now.before(c.getStartTime()) ||
                    now.after(c.getEndTime()) ||
                    !ContestStatus.ACTIVE.equals(c.getStatus().getId())) {
                throw new NavigationException("Inactive contest specified.");
            }

            User u = factory.getUserDAO().find(new Long(getUser().getId()));

            if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                //not registered
                StringBuffer buf = new StringBuffer(50);
                buf.append(getSessionInfo().getServletPath());
                buf.append("?" + Constants.MODULE_KEY + "=ViewRegistration&");
                buf.append(Constants.CONTEST_ID + "=").append(contestId);
                setNextPage(buf.toString());
                setIsNextPageInContext(false);
            } else {
                //registered
                setDefault(Constants.CONTEST_ID, contestId.toString());
                setDefault(Constants.SUBMISSION_RANK, "1");
                loadSubmissionData(u, c, cFactory.getSubmissionDAO());
                setNextPage("/submit.jsp");
                setIsNextPageInContext(true);
            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
}
