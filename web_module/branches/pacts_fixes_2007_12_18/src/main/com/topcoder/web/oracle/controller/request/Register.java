package com.topcoder.web.oracle.controller.request;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.dao.RoomDAO;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.RoomResult;
import com.topcoder.web.oracle.model.Round;
import com.topcoder.web.oracle.model.RoundRegistration;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class Register extends ViewRegistration {
    protected void regProcessing(Round round) throws Exception {
        if (!"on".equals(getRequest().getParameter(Constants.TERMS_AGREE))) {
            addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
            setDefault(Constants.ROUND_ID, round.getId());
            getRequest().setAttribute("round", round);
            setNextPage("/reg.jsp");
            setIsNextPageInContext(true);
        } else {
            RoomDAO roomDAO = OracleDAOUtil.getFactory().getRoomDAO();
            Room room = roomDAO.findSmallestRoom(round);
            if (room==null) {
                throw new NavigationException("Couldn't find a room to assign.");
            }
            User u = DAOUtil.getFactory().getUserDAO().find(getUser().getId());

            RoomResult rr = new RoomResult();
            rr.setUser(u);

            room.addResult(rr);
            roomDAO.saveOrUpdate(room);

            RoundRegistration rReg = new RoundRegistration();
            rReg.setRound(round);
            rReg.setUser(u);
            rReg.setTerms(DAOUtil.getFactory().getTermsOfUse().find(Constants.CONTEST_TERMS_OF_USE_ID));

            OracleDAOUtil.getFactory().getRoundRegistrationDAO().saveOrUpdate(rReg);

            StringBuffer buf = new StringBuffer(50);
            buf.append(getSessionInfo().getServletPath());
            buf.append("?" + Constants.MODULE_KEY + "=ViewBallot&");
            buf.append(Constants.ROOM_ID).append("=").append(room.getId());
            setNextPage(buf.toString());
            setIsNextPageInContext(false);


        }

    }
}
