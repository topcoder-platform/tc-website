package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOFactory;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Round;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 14, 2007
 */
public class ViewRooms extends Base {
    protected void dbProcessing() throws Exception {

        String roundId = getRequest().getParameter(Constants.ROUND_ID);

        OracleDAOFactory f = OracleDAOUtil.getFactory();

        Round round;

        if ("".equals(StringUtils.checkNull(roundId))) {
            throw new NavigationException("Invalid round specified.");
        } else {
            round = f.getRoundDAO().find(new Integer(roundId));
            if (round == null) {
                throw new NavigationException("Invalid room specified.");
            } else {
                getRequest().setAttribute("rooms", round.getRooms());
                getRequest().setAttribute("round", round);
            }
        }

        setNextPage("/admin/rooms.jsp");
        setIsNextPageInContext(true);


    }
}
