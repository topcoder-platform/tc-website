package com.topcoder.web.oracle.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.ContestStatus;
import com.topcoder.web.oracle.model.Round;
import com.topcoder.web.oracle.model.RoundStatus;

import java.util.Collections;
import java.util.List;
import java.util.Random;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class ViewBallot extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {

        if (userLoggedIn()) {
            String roundId = getRequest().getParameter(Constants.ROUND_ID);
            if ("".equals(StringUtils.checkNull(roundId))) {
                throw new NavigationException("No round specified");
            } else {
                Integer rid;
                try {
                    rid = new Integer(roundId);
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid round specified");
                }
                Round round = OracleDAOUtil.getFactory().getRoundDAO().find(rid);

                if (ContestStatus.ACTIVE.equals(round.getContest().getStatus().getId())) {
                    if (RoundStatus.ACTIVE.equals(round.getStatus().getId())) {
                        /*
                        load up the candidates in appropriate random order
                        it should be the same random order for a particular user every
                        time they look at the candidates for a particular round
                        */
                        List<Candidate> candidates =
                                OracleDAOUtil.getFactory().getCandidateDAO().getCandidates(round.getId(), getUser().getId());
                        Collections.sort(candidates, new Candidate.IDComparator());
                        Collections.shuffle(candidates, new Random(getUser().getId()+round.getId()));
                        getRequest().setAttribute("candidates", candidates);
                        setNextPage("/ballot.jsp");
                        setIsNextPageInContext(true);
                    } else {
                        throw new NavigationException("Invalid round specified.");
                    }
                } else {
                    throw new NavigationException("Invalid contest specified.");
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }

}
