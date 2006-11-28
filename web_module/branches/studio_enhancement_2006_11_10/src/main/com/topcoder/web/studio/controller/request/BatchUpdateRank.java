package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.validation.IntegerValidator;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.studio.model.Submission;

import java.util.Date;
import java.util.Enumeration;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 20, 2006
 */
public class BatchUpdateRank extends BaseSubmissionDataProcessor {
    protected void dbProcessing() throws Exception {

        //figure out all the submissions we're changing
        //validate that they can be updated etc.
        //if so, update
        //commit and reload

        SubmissionDAO dao = StudioDAOUtil.getFactory().getSubmissionDAO();
        String paramName;
        String newRank;
        Integer newRankInt;
        Submission currSubmission;
        Date now = new Date();
        Contest contest=null;
        for (Enumeration paramNames = getRequest().getParameterNames(); paramNames.hasMoreElements();) {
            paramName = (String)paramNames.nextElement();
            if (paramName.startsWith(Constants.SUBMISSION_ID)) {
                newRank = getRequest().getParameter(paramName);
                ValidationResult r = new IntegerValidator("Please enter a valid number.").validate(new StringInput(newRank));
                if (!r.isValid()) {
                    addError(paramName, r.getMessage());
                } else {
                    currSubmission = dao.find(new Long(paramName.substring(Constants.SUBMISSION_ID.length())));
                    if (contest ==null) {
                        contest = currSubmission.getContest();
                    } else {
                        if (log.isDebugEnabled()) {
                            log.debug("curr contest: " + currSubmission.getContest().getId() + " " +
                                    currSubmission.getContest().hashCode() + " first contest: " + contest.getId() + " " + contest.hashCode());
                            log.debug("is currsubmission in the session " + HibernateUtils.getSession().contains(currSubmission));
                            log.debug("is curr contest in the session " + HibernateUtils.getSession().contains(currSubmission.getContest()));
                            log.debug("is first contest in the session " + HibernateUtils.getSession().contains(contest));
                        }
                        if (!currSubmission.getContest().equals(contest)) {
                            throw new NavigationException("All the submissions being updated must be part of the same contest.");
                        }
                    }
                    if (now.before(currSubmission.getContest().getStartTime()) ||
                                now.after(currSubmission.getContest().getEndTime()) ||
                                !ContestStatus.ACTIVE.equals(currSubmission.getContest().getStatus().getId())) {
                            addError(paramName, "Sorry, you make a change to a submission for a contest that is not active.");
                    } else if (currSubmission.getSubmitter().getId().longValue() != getUser().getId()) {
                        throw new NavigationException("Illegal operation attempted, submission doesn't belong to current user.");
                    } else {
                        newRankInt = new Integer(newRank);
                        Integer maxRank = dao.getMaxRank(currSubmission.getContest(), currSubmission.getSubmitter());
                        if (newRankInt.intValue() > 0 && newRankInt.intValue() <= maxRank.intValue()) {
                            currSubmission.setRank(newRankInt);
                            dao.saveOrUpdate(currSubmission);

                            markForCommit();
                            closeConversation();

                            beginCommunication();

                            loadSubmissionData(currSubmission.getSubmitter(), currSubmission.getContest(),
                                    StudioDAOUtil.getFactory().getSubmissionDAO(), maxRank);
                            setIsNextPageInContext(true);
                            setNextPage("submitTableBody.jsp");
                        } else {
                            addError(paramName, "Rank must be between 1 and " + maxRank);
                        }

                }
            }
        }


    }
}
}
