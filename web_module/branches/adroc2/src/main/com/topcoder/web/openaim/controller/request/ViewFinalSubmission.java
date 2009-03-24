package com.topcoder.web.openaim.controller.request;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.openaim.Constants;
import com.topcoder.web.openaim.dao.OpenAIMDAOFactory;
import com.topcoder.web.openaim.dao.OpenAIMDAOUtil;
import com.topcoder.web.openaim.model.Contest;
import com.topcoder.web.openaim.model.SubmissionType;

/**
 * @author pulky
 */
public class ViewFinalSubmission extends BaseSubmissionDataProcessor {

    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            OpenAIMDAOFactory cFactory = OpenAIMDAOUtil.getFactory();
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
