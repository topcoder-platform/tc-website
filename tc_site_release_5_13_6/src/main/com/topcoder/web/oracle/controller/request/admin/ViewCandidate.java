package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOFactory;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.CandidateInfo;
import com.topcoder.web.oracle.model.Room;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2007
 */
public class ViewCandidate extends Base {

    protected void dbProcessing() throws Exception {

        String roomId = getRequest().getParameter(Constants.ROOM_ID);
        String candidateId = getRequest().getParameter(Constants.CANDIDATE_ID);

        OracleDAOFactory f = OracleDAOUtil.getFactory();

        Candidate c = null;
        Room room = f.getRoomDAO().find(new Integer(roomId));
        if (room == null) {
            throw new NavigationException("Invalid room specified.");
        } else {
            setDefault(Constants.ROOM_ID, room.getId());
            getRequest().setAttribute("room", room);
        }
        if (!"".equals(StringUtils.checkNull(candidateId))) {
            c = f.getCandidateDAO().find(new Integer(candidateId));
            if (c == null) {
                throw new NavigationException("Invalid candidate specified.");
            } else {
                getRequest().setAttribute("candidate", c);
                setDefault(Constants.CANDIDATE_ID, c.getId());
                setDefault(Constants.CANDIDATE_NAME, c.getName());
                for (CandidateInfo info : c.getInfo()) {
                    setDefault(Constants.CANDIDATE_PROPERTY + info.getProperty().getId(), info.getValue());
                }

            }
        }
        loadGeneralEditCandidateData();
        setNextPage("/admin/editCandidate.jsp");
        setIsNextPageInContext(true);

    }
}
