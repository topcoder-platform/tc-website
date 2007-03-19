package com.topcoder.web.studio.controller.request;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.AssignmentDocument;
import com.topcoder.web.common.model.AssignmentDocumentStatus;
import com.topcoder.web.common.model.AssignmentDocumentType;
import com.topcoder.web.common.model.StudioContest;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestResult;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionType;

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
            
            List submissions = cFactory.getSubmissionDAO().getSubmissions(u, c, SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE);
            
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

            List adList = PactsServicesLocator.getService()
                .getAssignmentDocumentByUserIdStudioContestId(u.getId().longValue(), c.getId().longValue());
        
            // if there's no AD, we must create it
            AssignmentDocument ad = null;
            if (adList.size() == 0) {
                ad = new AssignmentDocument();

                StudioContest contest = new StudioContest();
                contest.setId(c.getId());
                ad.setStudioContest(contest);

                ad.setSubmissionTitle(c.getName() + " - " + new SimpleDateFormat("MM/dd/yyyy").format(new Date(c.getStartTime().getTime())));
                
                User user = new User();
                user.setId(u.getId());
                ad.setUser(user);
                ad.setType(new AssignmentDocumentType(AssignmentDocumentType.STUDIO_CONTEST_TYPE_ID));
                ad.setStatus(new AssignmentDocumentStatus(AssignmentDocumentStatus.PENDING_STATUS_ID));

                log.debug("Status: (a1) " + ad.getStatus());
                log.debug("Status: (a2) " + ad.getStatus().getId());
                log.debug("Status: (a3) " + ad.getStatus().getId().longValue());

                ad = PactsServicesLocator.getService().addAssignmentDocument(ad);
            } else {
                ad = (AssignmentDocument) adList.get(0);
            }

            getRequest().setAttribute("assignment_document", ad);
            Boolean hasHardCopy = PactsServicesLocator.getService()
                .hasHardCopyAssignmentDocumentByUserId(ad.getUser().getId().longValue(), 
                ad.getType().getId().longValue());

            getRequest().setAttribute("has_hard_copy", hasHardCopy);

            
            setDefault(Constants.CONTEST_ID, contestId.toString());
            setDefault(Constants.SUBMISSION_RANK, "1");
            loadSubmissionData(u, c, cFactory.getSubmissionDAO(), SubmissionType.FINAL_SUBMISSION_TYPE);
            setNextPage("/submitFinalSubmission.jsp");
            setIsNextPageInContext(true);

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
}
