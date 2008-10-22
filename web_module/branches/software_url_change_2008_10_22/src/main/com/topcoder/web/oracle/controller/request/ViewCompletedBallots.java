package com.topcoder.web.oracle.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOFactory;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.RoomResult;
import com.topcoder.web.oracle.model.Round;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 10, 2007
 */
public class ViewCompletedBallots extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {


        OracleDAOFactory f = OracleDAOUtil.getFactory();

        if (userLoggedIn()) {
            String roundId = getRequest().getParameter(Constants.ROUND_ID);
            if ("".equals(StringUtils.checkNull(roundId))) {
                throw new NavigationException("No round specified");
            } else {

                Round round;
                Integer rid;
                try {
                    rid = new Integer(roundId);
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid round specified");
                }
                round = OracleDAOUtil.getFactory().getRoundDAO().find(rid);

                if (f.getRoundRegistrationDAO().find(round.getId(), getUser().getId()) == null) {
                    //not registered so redirect to register
                    StringBuffer buf = new StringBuffer(50);
                    buf.append(getSessionInfo().getServletPath());
                    buf.append("?" + Constants.MODULE_KEY + "=ViewRegistration&");
                    buf.append(Constants.ROUND_ID).append("=").append(round.getId());
                    setNextPage(buf.toString());
                    setIsNextPageInContext(false);
                } else {
                    //registered so figure out where to go next
                    List<RoomResult> rrs = f.getRoomResultDAO().getResults(getUser().getId(), rid);
                    int attendedCount = 0;
                    for (RoomResult rr : rrs) {
                        if (rr.attended()) {
                            attendedCount++;
                        }
                        if (attendedCount > 1) {
                            break;
                        }
                    }
                    if (attendedCount > 1) {
                        //if they've already done more than one room, show them the list and let them decide what to do next
                        getRequest().setAttribute("results", rrs);
                        getRequest().setAttribute("round", rrs.get(0).getRoom().getRound());
                        setNextPage("/completedBallots.jsp");
                        setIsNextPageInContext(true);
                    } else if (attendedCount == 1) {
                        //if they've only down one room, then redirect to view the completed ballot for that room
                        StringBuffer buf = new StringBuffer(50);
                        buf.append(getSessionInfo().getServletPath());
                        buf.append("?" + Constants.MODULE_KEY + "=ViewCompletedBallot&");
                        buf.append(Constants.ROOM_ID).append("=").append(rrs.get(0).getRoom().getId());
                        setNextPage(buf.toString());
                        setIsNextPageInContext(false);
                    } else {
                        //if they've not done anything, then really they should just be viewing their ballot.
                        if (rrs.isEmpty()) {
                            throw new NavigationException("User not assigned to a room.");
                        } else {
                            StringBuffer buf = new StringBuffer(50);
                            buf.append(getSessionInfo().getServletPath());
                            buf.append("?" + Constants.MODULE_KEY + "=ViewBallot&");
                            buf.append(Constants.ROOM_ID).append("=").append(rrs.get(0).getRoom().getId());
                            setNextPage(buf.toString());
                            setIsNextPageInContext(false);
                        }
                    }
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }
}
