package com.topcoder.web.oracle.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.RoomResult;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2007
 */
public class ViewSimpleResults extends ShortHibernateProcessor {
    protected final void dbProcessing() throws Exception {

        String roomId = getRequest().getParameter(Constants.ROOM_ID);

        Room room = null;

        if (!"".equals(StringUtils.checkNull(roomId))) {
            Integer rid;
            try {
                rid = new Integer(roomId);
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid room specified");
            }
            room = OracleDAOUtil.getFactory().getRoomDAO().find(rid);
            if (room == null) {
                throw new NavigationException("Invalid room specified");
            } else {
                List<RoomResult> tempResults = new ArrayList<RoomResult>(room.getResults());
                List<RoomResult> results = new ArrayList<RoomResult>(tempResults.size());
                for (RoomResult rr : tempResults) {
                    if (rr.getScore()!=null) {
                        results.add(rr);
                    }
                }

                Collections.sort(results, new RoomResult.ScoreComparator());
                getRequest().setAttribute("results", results);
                getRequest().setAttribute("room", room);
                setNextPage("/simpleResults.jsp");
                setIsNextPageInContext(true);
            }
        } else {
            throw new NavigationException("Invalid room specified");
        }
    }
}
