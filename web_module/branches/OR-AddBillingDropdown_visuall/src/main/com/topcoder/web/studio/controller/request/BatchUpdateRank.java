package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.validation.IntegerValidator;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionType;

import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.TreeSet;


/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 20, 2006
 */
public class BatchUpdateRank extends BaseSubmissionDataProcessor {
    protected void dbProcessing() throws Exception {

        Long contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));

        Integer submissionTypeId = new Integer(getRequest().getParameter(Constants.SUBMISSION_TYPE_ID));

        SubmissionDAO dao = StudioDAOUtil.getFactory().getSubmissionDAO();
        String paramName;
        String newRank;
        Integer newRankInt;
        Submission currSubmission = null;
        Date now = new Date();
        List userSubmissions = dao.getSubmissions(contestId, getUser().getId(), submissionTypeId);
        Integer maxRank = null;
        // BUGR-429 Change: replace two ArrayLists by one TreeSet
        TreeSet<ComparableRank> changedSubmissions = new TreeSet<ComparableRank>();
        for (Enumeration paramNames = getRequest().getParameterNames(); paramNames.hasMoreElements();) {
            paramName = (String) paramNames.nextElement();
            if (paramName.startsWith(Constants.SUBMISSION_ID)) {
                newRank = getRequest().getParameter(paramName);
                ValidationResult r = new IntegerValidator("Please enter a valid number.").validate(new StringInput(newRank));
                if (!r.isValid()) {
                    addError(paramName, r.getMessage());
                } else {
                    currSubmission = findSubmission(userSubmissions,
                            new Long(paramName.substring(Constants.SUBMISSION_ID.length())));
                    if (submissionTypeId.equals(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE) && (now.before(currSubmission.getContest().getStartTime()) ||
                            now.after(currSubmission.getContest().getEndTime()) ||
                            !ContestStatus.ACTIVE.equals(currSubmission.getContest().getStatus().getId()))) {
                        addError(paramName, "Sorry, you can not make a change to a submission for a contest that is not active.");
                    } else {
                        if (maxRank == null) {
                            maxRank = dao.getMaxRank(currSubmission.getContest(), currSubmission.getSubmitter());
                        }
                        newRankInt = new Integer(newRank);
                        if (newRankInt < 1) {
                            newRankInt = 1;
                        } else if (newRankInt > maxRank) {
                            newRankInt = maxRank;
                        }

                        // BUGR-429 Change: unconditional accumulate ComparableRank objects instead conditional newRank and submissions accumulation
                        changedSubmissions.add(new ComparableRank(newRankInt, currSubmission));
                    }
                }
            }
        }

        // BUGR-429: this todo is implemeted
//todo make it smarter, since the transaction isn't yet commited, it seems to be confused since we're updated the same rows
        //todo multiple times.  perhaps we have to do it all here in the processor instead or something.
        Submission s = (Submission) userSubmissions.get(0);
        if (!hasErrors()) {

            // BUGR-429 Change: remove altering rank by dao.changeRank(), the right order of submissions is supported by TreeSet
            int i = 0;
            for (ComparableRank comparableRank : changedSubmissions) {
                Submission submission = comparableRank.getSubmission();
                if (++i != submission.getRank()) {
                    submission.setRank(i);
                    dao.saveOrUpdate(submission);
                }
            }

            closeConversation();

            beginCommunication();

            HibernateUtils.getSession().refresh(s);
            dao = StudioDAOUtil.getFactory().getSubmissionDAO();
        }

        loadSubmissionData(s.getSubmitter(), s.getContest(), dao, maxRank, s.getType().getId());

        if (hasErrors()) {
            //override so that the user gets their data back to them
            for (Enumeration paramNames = getRequest().getParameterNames(); paramNames.hasMoreElements();) {
                paramName = (String) paramNames.nextElement();
                setDefault(paramName, getRequest().getParameter(paramName));
            }
        }

        setIsNextPageInContext(true);
        setNextPage("submitTableBody.jsp");


    }


    private Submission findSubmission(List submissions, Long id) {
        Submission curr = null;
        for (Object submission : submissions) {
            curr = (Submission) submission;
            if (curr.getId().equals(id)) {
                return curr;
            }
        }
        return null;
    }

    /**
     * BUGR-429
     * This class implements value object for support certain order of submissions in the
     * TreeSet. This order number is used as rank of submissions. The order is defined by
     * <ul>
     * <li>new rank</li>
     * <li>offset, which is length between new rank and submission rank</li>
     * <li>and submission Id if previous criteria are unexpectedly same</li>
     * </ul>
     * @author goorov
     */
    private static final class ComparableRank implements Comparable {
        private final Integer newRank;
        private final Submission submission;
        private final Integer offset;

        public ComparableRank(Integer newRank, Submission submission) {
            this.newRank = newRank;
            this.submission = submission;
            offset = newRank - submission.getRank();
        }

        public Submission getSubmission() { return submission; }

        public int compareTo(Object o) {
            if (o instanceof ComparableRank) {
                ComparableRank u = (ComparableRank) o;
                int result = newRank.compareTo(u.newRank);
                if (result == 0) {
                    result = offset.compareTo(u.offset);
                    if (result == 0) {
                        result = submission.getId().compareTo(u.submission.getId());
                    }
                }
                return result;
            } else {
                log.error("BatchUpdateRank.ComparableRank has been improperly comparing.");
                return 0;
            }
        }
    }

}
