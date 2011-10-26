package com.topcoder.web.csf.controller.request;

import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.validation.IntegerValidator;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.dao.SubmissionDAO;
import com.topcoder.web.csf.model.ContestStatus;
import com.topcoder.web.csf.model.Submission;

import java.util.*;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 20, 2006
 */
public class BatchUpdateRank extends BaseSubmissionDataProcessor {
    protected void dbProcessing() throws Exception {

        Long contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));

        SubmissionDAO dao = CSFDAOUtil.getFactory().getSubmissionDAO();
        String paramName;
        String newRank;
        Integer newRankInt;
        Submission currSubmission = null;
        Date now = new Date();
        List userSubmissions = dao.getSubmissions(contestId, new Long(getUser().getId()));
        Integer maxRank = null;
        ArrayList newRanks = new ArrayList(userSubmissions.size());
        ArrayList changedSubmissions = new ArrayList(userSubmissions.size());
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
                    if (now.before(currSubmission.getContest().getStartTime()) ||
                            now.after(currSubmission.getContest().getEndTime()) ||
                            !ContestStatus.ACTIVE.equals(currSubmission.getContest().getStatus().getId())) {
                        addError(paramName, "Sorry, you can not make a change to a submission for a contest that is not active.");
                    } else {
                        if (maxRank == null) {
                            maxRank = dao.getMaxRank(currSubmission.getContest(), currSubmission.getSubmitter());
                        }
                        newRankInt = new Integer(newRank);
                        if (newRankInt.intValue() < 1) {
                            newRankInt = new Integer(1);
                        } else if (newRankInt.intValue() > maxRank.intValue()) {
                            newRankInt = maxRank;
                        }
                        if (!newRankInt.equals(currSubmission.getRank())) {
                            newRanks.add(newRankInt);
                            changedSubmissions.add(currSubmission);
                        }
                    }
                }
            }
        }

//todo make it smarter, since the transaction isn't yet commited, it seems to be confused since we're updated the same rows
        //todo multiple times.  perhaps we have to do it all here in the processor instead or something.
        Submission s = (Submission) userSubmissions.get(0);
        if (!hasErrors()) {

            for (int i = 0; i < newRanks.size(); i++) {
                dao.changeRank((Integer) newRanks.get(i), (Submission) changedSubmissions.get(i));
            }

            markForCommit();
            closeConversation();

            beginCommunication();

            HibernateUtils.getSession().refresh(s);
            dao = CSFDAOUtil.getFactory().getSubmissionDAO();
        }

        loadSubmissionData(s.getSubmitter(), s.getContest(), dao, maxRank);

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

    private void changeRank(int idx, List submissions) {

    }

/*
    protected void dbProcessing() throws Exception {

        Long contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));

        SubmissionDAO dao = CSFDAOUtil.getFactory().getSubmissionDAO();
        String paramName;
        String newRank;
        Integer newRankInt;
        Submission currSubmission = null;
        Date now = new Date();
        List userSubmissions = dao.getSubmissions(contestId, new Long(getUser().getId()));
        Integer maxRank = null;
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
                    if (now.before(currSubmission.getContest().getStartTime()) ||
                            now.after(currSubmission.getContest().getEndTime()) ||
                            !ContestStatus.ACTIVE.equals(currSubmission.getContest().getStatus().getId())) {
                        addError(paramName, "Sorry, you can not make a change to a submission for a contest that is not active.");
                    } else {
                        if (maxRank==null) {
                            maxRank = dao.getMaxRank(currSubmission.getContest(), currSubmission.getSubmitter());
                        }
                        newRankInt = new Integer(newRank);
                        if (newRankInt.intValue() > 0 && newRankInt.intValue() <= maxRank.intValue()) {
                            currSubmission.setRank(newRankInt);
                        } else {
                            addError(paramName, "Rank must be between 1 and " + maxRank);
                        }

                    }
                }
            }
        }


        HashSet hash = new HashSet();
        Submission sub;
        for (Iterator it = userSubmissions.iterator(); it.hasNext();) {
            sub = (Submission)it.next();
            if (hash.contains(sub.getRank())) {
                addError(Constants.SUBMISSION_ID+sub.getId(), "Be sure you rank each of your submissions uniquely, there can be no ties.");
            }
            hash.addVote(sub.getRank());
        }

        Submission s = (Submission)userSubmissions.get(0);
        if (!hasErrors()) {
            for (Iterator it = userSubmissions.iterator(); it.hasNext();) {
                dao.saveOrUpdate((Submission)it.next());
            }

            markForCommit();
            closeConversation();

            beginCommunication();

            HibernateUtils.getSession().refresh(s);
            dao = CSFDAOUtil.getFactory().getSubmissionDAO();
        }

        loadSubmissionData(s.getSubmitter(), s.getContest(), dao, maxRank);
        //override so that the user gets their data back to them
        for (Enumeration paramNames = getRequest().getParameterNames(); paramNames.hasMoreElements();) {
            paramName = (String) paramNames.nextElement();
            setDefault(paramName, getRequest().getParameter(paramName));
        }

        setIsNextPageInContext(true);
        setNextPage("submitTableBody.jsp");


    }
*/


    private Submission findSubmission(List submissions, Long id) {
        Submission curr = null;
        for (Iterator it = submissions.iterator(); it.hasNext();) {
            curr = (Submission) it.next();
            if (curr.getId().equals(id)) {
                return curr;
            }
        }
        return null;
    }
}
