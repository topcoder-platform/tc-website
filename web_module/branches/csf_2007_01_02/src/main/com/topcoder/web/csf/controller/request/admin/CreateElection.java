package com.topcoder.web.csf.controller.request.admin;

import com.topcoder.web.common.voting.Candidate;
import com.topcoder.web.common.voting.CondorcetSchulzeElection;
import com.topcoder.web.common.voting.dao.VotingDAOUtil;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.dao.SubmissionDAO;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.model.Submission;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 1, 2007
 */
public class CreateElection extends Base {
    protected void dbProcessing() throws Exception {
        //take the list of submission id's and create an election from them.
        //take the start and end dates for the election
        String startTime = getRequest().getParameter(Constants.START_TIME);
        String endTime = getRequest().getParameter(Constants.END_TIME);

        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        String[] submissionIds = getRequest().getParameterValues(Constants.SUBMISSION_IDS);
        Submission[] submissions = null;
        if (submissionIds == null || submissionIds.length == 0) {
            addError(Constants.SUBMISSION_IDS, "No submissions selected");
        } else {
            SubmissionDAO sDao = CSFDAOUtil.getFactory().getSubmissionDAO();
            submissions = new Submission[submissionIds.length];
            try {
                for (int i = 0; i < submissionIds.length; i++) {
                    submissions[i] = sDao.find(new Long(submissionIds[i]));
                }
            } catch (NumberFormatException ex) {
                addError(Constants.SUBMISSION_IDS, "Please choose valid submissions");
            }
        }
        if (hasErrors()) {
            setDefault(Constants.START_TIME, startTime);
            setDefault(Constants.END_TIME, endTime);
            setDefault(Constants.SUBMISSION_IDS, submissions);

            Contest contest = CSFDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            ArrayList a = new ArrayList(contest.getSubmissions());
            Collections.sort(a, new Comparator() {
                public int compare(Object o1, Object o2) {
                    return ((Submission) o1).getId().compareTo(((Submission) o2).getId());
                }
            });
            getRequest().setAttribute("submissions", a);
            setDefault(Constants.CONTEST_ID, contest.getId());

            setNextPage("/admin/electionCreation.jsp");
            setIsNextPageInContext(true);
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);

            CondorcetSchulzeElection election = new CondorcetSchulzeElection();
            election.setStartTime(new Timestamp(sdf.parse(startTime).getTime()));
            election.setEndTime(new Timestamp(sdf.parse(endTime).getTime()));
            election.setName(submissions[0].getContest().getName());

            Candidate c;
            for (int i = 0; i < submissions.length; i++) {
                c = new Candidate(submissions[i].getId().toString());
                c.setElection(election);
                election.getCandidates().add(c);
            }

            VotingDAOUtil.getFactory().getCondorcetSchulzeElectionDAO().saveOrUpdate(election);

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=Static&d1=admin&d2=electionCreationSuccess.jsp");
            setIsNextPageInContext(false);
        }

    }
}
