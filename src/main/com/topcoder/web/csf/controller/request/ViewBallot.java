package com.topcoder.web.csf.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.voting.CondorcetSchulzeElection;
import com.topcoder.web.common.voting.ElectionStatus;
import com.topcoder.web.common.voting.RankBallot;
import com.topcoder.web.common.voting.Vote;
import com.topcoder.web.common.voting.dao.VotingDAOUtil;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.model.Contest;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 2, 2007
 */
public class ViewBallot extends Base {
    protected void dbProcessing() throws Exception {

        if (userLoggedIn()) {
            String contestId = getRequest().getParameter(Constants.CONTEST_ID);
            String electionId = getRequest().getParameter(Constants.ELECTION_ID);
            if ("".equals(StringUtils.checkNull(contestId))) {
                throw new NavigationException("No contest specified");
            } else if ("".equals(StringUtils.checkNull(electionId))) {
                throw new NavigationException("No election specified");
            } else {
                Long cid, eid;
                try {
                    cid = new Long(contestId);
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid contest specified");
                }
                try {
                    eid = new Long(electionId);
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid election specified");
                }

                Contest contest = CSFDAOUtil.getFactory().getContestDAO().find(cid);
                CondorcetSchulzeElection election = VotingDAOUtil.getFactory().getCondorcetSchulzeElectionDAO().find(eid);

                if (contest == null) {
                    throw new NavigationException("Invalid contest specified");
                } else if (election == null) {
                    throw new NavigationException("Invalid election specified");
                } else {
                    RankBallot ballot = VotingDAOUtil.getFactory().getRankBallotDAO().find(election.getId(), new Long(getUser().getId()));
                    if (ballot == null) {
                        boolean isAdmin = isAdmin();
                        if (isAdmin) {
                            ballotProcessing(contest, election);
                            setNextPage();
                        } else if (ElectionStatus.ACTIVE.equals(election.getStatus().getId())) {
                            Date now = new Date();
                            if (election.getStartTime().before(now) && election.getEndTime().after(now)) {
                                ballotProcessing(contest, election);
                                setNextPage();
                            } else {
                                throw new NavigationException("Inactive election specified.");
                            }
                        } else {
                            throw new NavigationException("Invalid election specified.");
                        }
                    } else {
                        ArrayList votes = new ArrayList(ballot.getVotes());
                        Collections.sort(votes, new Vote.RankComparator());
                        getRequest().setAttribute("ballot", ballot);
                        getRequest().setAttribute("votes", votes);
                        setNextPage("/vote/completedBallot.jsp");
                        setIsNextPageInContext(true);
                    }
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }

    protected void loadDataIntoRequest(Contest contest, CondorcetSchulzeElection election) {
        setDefault(Constants.ELECTION_ID, election.getId());
        setDefault(Constants.CONTEST_ID, contest.getId());
        ArrayList shuffledCandidates = new ArrayList(election.getCandidates());
        Collections.shuffle(shuffledCandidates);
        getRequest().setAttribute("candidates", shuffledCandidates);
        getRequest().setAttribute("election", election);
        getRequest().setAttribute("contest", contest);
    }

    protected void setNextPage() {
        setNextPage("/vote/ballot.jsp");
        setIsNextPageInContext(true);
    }

    protected void ballotProcessing(Contest contest, CondorcetSchulzeElection election) throws Exception {
        loadDataIntoRequest(contest, election);
    }
}
