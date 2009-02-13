package com.topcoder.web.oracle.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Room;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 3, 2007
 */
public class ViewResults extends ShortHibernateProcessor {
    protected final void dbProcessing() throws Exception {

        String roomId = getRequest().getParameter(Constants.ROOM_ID);
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

            //figure out the competitor results ordered place
            //for each competitor figure out their predictions ordered by value


        }

    }


}

