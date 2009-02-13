package com.topcoder.web.oracle.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.ContestStatus;
import com.topcoder.web.oracle.model.Phase;
import com.topcoder.web.oracle.model.Round;
import com.topcoder.web.oracle.model.RoundStatus;

import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class ViewRegistration extends ShortHibernateProcessor {
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
                if (round == null) {
                    throw new NavigationException("Invalid round specified");
                } else {
                    Date now = new Date();
                    if (ContestStatus.ACTIVE.equals(round.getContest().getStatus().getId())) {
                        if (RoundStatus.ACTIVE.equals(round.getStatus().getId())) {
                            if (round.getPhase(Phase.REGISTRATION).getStartTime().before(now) &&
                                    round.getPhase(Phase.REGISTRATION).getEndTime().after(now)) {
                                if (OracleDAOUtil.getFactory().getRoundRegistrationDAO().find(round.getId(), getUser().getId()) != null) {
                                    StringBuffer buf = new StringBuffer(50);
                                    buf.append(getSessionInfo().getServletPath());
                                    buf.append("?" + Constants.MODULE_KEY + "=ViewBallot&");
                                    buf.append(Constants.ROUND_ID).append("=").append(round.getId());
                                    setNextPage(buf.toString());
                                    setIsNextPageInContext(false);
                                } else {
                                    regProcessing(round);
                                }
                            } else {
                                throw new NavigationException("Registration is not currently open.");
                            }
                        } else {
                            throw new NavigationException("Invalid round specified.");
                        }
                    } else {
                        throw new NavigationException("Invalid contest specified.");
                    }
                }


            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }

    protected void regProcessing(Round round) throws Exception {
        setDefault(Constants.ROUND_ID, round.getId().toString());
        getRequest().setAttribute("round", round);
        setNextPage("reg.jsp");
        setIsNextPageInContext(true);
    }
}
