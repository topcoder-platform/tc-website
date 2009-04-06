package com.topcoder.web.oracle.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.CandidateRoomResult;

import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2007
 */
public class ViewCandidateResults extends ShortHibernateProcessor {
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
                List<CandidateRoomResult> results = new ArrayList<CandidateRoomResult>(room.getCandidateResults());
                Collections.sort(results, new CandidateRoomResult.CorrectValueComparator());
                getRequest().setAttribute("results", results);
                getRequest().setAttribute("room", room);
                setNextPage("/candidateResults.jsp");
                setIsNextPageInContext(true);
            }
        } else {
            throw new NavigationException("Invalid room specified");
        }
    }
}
