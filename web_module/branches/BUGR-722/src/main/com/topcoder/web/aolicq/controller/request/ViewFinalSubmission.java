package com.topcoder.web.aolicq.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.aolicq.Constants;
import com.topcoder.web.aolicq.dao.AolicqDAOFactory;
import com.topcoder.web.aolicq.dao.AolicqDAOUtil;
import com.topcoder.web.aolicq.model.Contest;
import com.topcoder.web.aolicq.model.SubmissionType;

/**
 * @author pulky
 */
public class ViewFinalSubmission extends BaseSubmissionDataProcessor {

    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            AolicqDAOFactory cFactory = AolicqDAOUtil.getFactory();
            DAOFactory factory = DAOUtil.getFactory();
            Long contestId;
            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid Contest Specified");
            }

            Contest c = cFactory.getContestDAO().find(contestId);
            User u = factory.getUserDAO().find(getUser().getId());

            if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                throw new NavigationException("User not registered for the contest");
            }

            if (!userPlaced(u, c, cFactory.getSubmissionDAO())) {
                throw new NavigationException("User cannot upload final submissions");
            }

            setDefault(Constants.CONTEST_ID, contestId.toString());
            loadSubmissionData(u, c, cFactory.getSubmissionDAO(), SubmissionType.FINAL_SUBMISSION_TYPE);
            setNextPage("/submitFinalSubmission.jsp");
            setIsNextPageInContext(true);

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
}
