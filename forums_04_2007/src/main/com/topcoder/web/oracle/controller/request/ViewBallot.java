package com.topcoder.web.oracle.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.*;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class ViewBallot extends ShortHibernateProcessor {
    protected final void dbProcessing() throws Exception {

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
                        if (OracleDAOUtil.getFactory().getRoundRegistrationDAO().find(round.getId(), getUser().getId()) != null) {
                            if (OracleDAOUtil.getFactory().getPredictionDAO().alreadyCompeted(getUser().getId(), round.getId())) {
                                StringBuffer buf = new StringBuffer(50);
                                buf.append(getSessionInfo().getServletPath());
                                buf.append("?" + Constants.MODULE_KEY + "=Static&");
                                buf.append(Constants.STATIC_PREFIX).append("1=success");
                                setNextPage(buf.toString());
                                setIsNextPageInContext(false);
                            } else {
                                Date now = new Date();
                                if (round.getPhase(Phase.SUBMISSION).getStartTime().before(now)) {
                                    if (round.getPhase(Phase.SUBMISSION).getEndTime().after(now)) {
                                        ballotProcessing(round);
                                    } else {
                                        throw new NavigationException("Sorry, the submission phase is over.");
                                    }
                                } else {
                                    throw new NavigationException("Sorry, the submission phase has not started.");
                                }

                            }
                        } else {
                            StringBuffer buf = new StringBuffer(50);
                            buf.append(getSessionInfo().getServletPath());
                            buf.append("?" + Constants.MODULE_KEY + "=ViewRegistration&");
                            buf.append(Constants.ROUND_ID).append("=").append(round.getId());
                            setNextPage(buf.toString());
                            setIsNextPageInContext(false);
                        }
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

    protected void ballotProcessing(Round round) throws Exception {
        loadData(round);
        setNextPage("/ballot.jsp");
        setIsNextPageInContext(true);

    }


    /**
     * load up the candidates in appropriate random order
     * it should be the same random order for a particular user every
     * time they look at the candidates for a particular round
     *
     * @param round
     */
    protected final void loadData(Round round) {
        List<Candidate> candidates =
                OracleDAOUtil.getFactory().getCandidateDAO().getCandidates(round.getId(), getUser().getId());
        Collections.sort(candidates, new Candidate.IDComparator());
        Collections.shuffle(candidates, new Random(getUser().getId() + round.getId()));
        getRequest().setAttribute("candidates", candidates);
        getRequest().setAttribute("round", round);
        setDefault(Constants.ROUND_ID, round.getId());

    }

}
