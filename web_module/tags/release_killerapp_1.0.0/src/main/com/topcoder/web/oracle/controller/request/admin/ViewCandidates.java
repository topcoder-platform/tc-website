package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOFactory;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Room;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2007
 */
public class ViewCandidates extends Base {
    protected void dbProcessing() throws Exception {
        //load up all the candidates in the round

        String roomId = getRequest().getParameter(Constants.ROOM_ID);

        OracleDAOFactory f = OracleDAOUtil.getFactory();

        Room room;

        if ("".equals(StringUtils.checkNull(roomId))) {
            throw new NavigationException("Invalid room specified.");
        } else {
            room = f.getRoomDAO().find(new Integer(roomId));
            if (room == null) {
                throw new NavigationException("Invalid room specified.");
            } else {
                getRequest().setAttribute("candidates", f.getCandidateDAO().getCandidates(room));
                getRequest().setAttribute("room", room);
            }
        }

        setNextPage("/admin/candidates.jsp");
        setIsNextPageInContext(true);
    }
}
