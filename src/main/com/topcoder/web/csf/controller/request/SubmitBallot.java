package com.topcoder.web.csf.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.voting.Candidate;
import com.topcoder.web.common.voting.CondorcetSchulzeElection;
import com.topcoder.web.common.voting.RankBallot;
import com.topcoder.web.common.voting.Vote;
import com.topcoder.web.common.voting.dao.CandidateDAO;
import com.topcoder.web.common.voting.dao.VotingDAOUtil;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.model.Contest;

import java.util.StringTokenizer;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 31, 2007
 */
public class SubmitBallot extends ViewBallot {
    protected void ballotProcessing(Contest contest, CondorcetSchulzeElection election) throws Exception {
        String candidateIds = StringUtils.checkNull(getRequest().getParameter(Constants.CANDIDATE_IDS));
        if ("".equals(candidateIds)) {
            loadDataIntoRequest(contest, election);
            addError(Constants.CANDIDATE_IDS, "Please be sure to make your selections before you submit.");
        }

        if (log.isDebugEnabled()) {
            log.debug("candidate ids: " + candidateIds);
        }

        if (!hasErrors()) {
            CandidateDAO dao = VotingDAOUtil.getFactory().getCandidateDAO();
            String id;
            Candidate c;
            Vote v;
            int i = 0;
            RankBallot b = new RankBallot(election, DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId())));
            for (StringTokenizer st = new StringTokenizer(candidateIds, ","); st.hasMoreTokens();) {
                id = st.nextToken();
                try {
                    c = dao.find(new Long(id));
                    if (c == null) {
                        throw new NavigationException("Invalid candidate specified.");
                    } else {
                        v = new Vote();
                        v.setRank(new Integer(++i));
                        v.getId().setCandidate(c);
                        v.getId().setBallot(b);
                        b.getVotes().add(v);
                    }
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid candidate specified.");
                }
                VotingDAOUtil.getFactory().getRankBallotDAO().saveOrUpdate(b);
            }
        }

    }


    protected void setNextPage() {
        if (hasErrors()) {

            setNextPage("/vote/ballot.jsp");
            setIsNextPageInContext(true);
        } else {
            StringBuffer buf = new StringBuffer(50);
            buf.append(getSessionInfo().getServletPath());
            buf.append("?" + Constants.MODULE_KEY + "=Static&");
            buf.append(Constants.STATIC_PREFIX).append("1=vote&");
            buf.append(Constants.STATIC_PREFIX).append("2=success");
            setNextPage(buf.toString());
            setIsNextPageInContext(false);
        }
    }


}
