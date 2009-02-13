package com.topcoder.web.oracle.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.*;

import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2007
 */
public class ViewCompletedBallot extends ShortHibernateProcessor {
    protected final void dbProcessing() throws Exception {

        String roomId = getRequest().getParameter(Constants.ROOM_ID);
        String userId = StringUtils.checkNull(getRequest().getParameter(Constants.USER_ID));
        if ("".equals(StringUtils.checkNull(roomId))) {
            throw new NavigationException("No room specified");
        } else {
            Integer rid;
            try {
                rid = new Integer(roomId);
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid room specified");
            }
            Room room = OracleDAOUtil.getFactory().getRoomDAO().find(rid);

            User u = null;
            if ("".equals(userId)) {
                if (userLoggedIn()) {
                    u = DAOUtil.getFactory().getUserDAO().find(getUser().getId());
                } else {
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                }
            } else {
                try {
                    u = DAOUtil.getFactory().getUserDAO().find(new Long(userId));
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid user specified.");
                }
            }

            if (u == null) {
                throw new NavigationException("Invalid user specified.");
            } else {
                boolean self = u.getId().equals(getUser().getId());
                boolean ok = false;
                if (!self) {
                    if (ContestStatus.ACTIVE.equals(room.getRound().getContest().getStatus().getId())) {
                        Date now = new Date();
                        if (RoundStatus.ACTIVE.equals(room.getRound().getStatus().getId()) &&
                                now.after(room.getRound().getPhase(Phase.SUBMISSION).getEndTime())) {
                            if (OracleDAOUtil.getFactory().getPredictionDAO().alreadyCompeted(u.getId(), room.getId())) {
                                ok = true;
                            } else {
                                throw new NavigationException("Prediction information not found.");
                            }
                        } else {
                            throw new NavigationException("Invalid round specified.");
                        }
                    } else {
                        throw new NavigationException("Invalid contest specified.");
                    }
                }
                if (self || ok) {
                    //load up the data
                    getRequest().setAttribute("predictions",
                            OracleDAOUtil.getFactory().getPredictionDAO().getPredictions(u, room));
                    getRequest().setAttribute("room", room);
                    setNextPage("/completedBallot.jsp");
                    setIsNextPageInContext(true);
                } else {
                    throw new NavigationException("Prediction information not available.");
                }
            }

        }


    }

}
