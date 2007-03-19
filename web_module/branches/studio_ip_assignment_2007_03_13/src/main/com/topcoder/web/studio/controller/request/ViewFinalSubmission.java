package com.topcoder.web.studio.controller.request;

import java.util.Iterator;
import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestResult;
import com.topcoder.web.studio.model.Submission;

/**
 * @author pulky
 */
public class ViewFinalSubmission extends BaseSubmissionDataProcessor {

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
            User u = factory.getUserDAO().find(new Long(getUser().getId()));

            if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                throw new NavigationException("User not registered for the contest");
            }
            
            List submissions = cFactory.getSubmissionDAO().getSubmissions(u, c);
            
            boolean isWinner = false;
            for (Iterator it = submissions.iterator(); it.hasNext() && !isWinner;) {
                Submission s = (Submission) it.next();
                log.debug("sub:" + s.getId());
                ContestResult curr;
                for (Iterator it2 = s.getContest().getResults().iterator(); it2.hasNext() && !isWinner;) {
                    curr = (ContestResult) it2.next();
                    log.debug("Prize: " + curr.getPrize() + "sub:" + curr.getSubmission().getId());
                    isWinner = s.equals(curr.getSubmission()) && curr.getPrize().getPlace() != null;
                    if (isWinner) {
                        log.debug("user has got place: " + curr.getPrize().getPlace());
                    }
                }
            }
            
            if (!isWinner) {
                throw new NavigationException("User cannot upload final submissions");
            }

            setDefault(Constants.CONTEST_ID, contestId.toString());
            setDefault(Constants.SUBMISSION_RANK, "1");
            loadSubmissionData(u, c, cFactory.getSubmissionDAO());
            setNextPage("/submitFinalSubmission.jsp");
            setIsNextPageInContext(true);

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
}
