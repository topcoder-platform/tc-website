package com.topcoder.web.screening.request;

import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import com.topcoder.web.ejb.session.Session;
import com.topcoder.web.ejb.session.SessionHome;
import com.topcoder.web.ejb.session.SessionSegment;
import com.topcoder.web.ejb.session.SessionSegmentHome;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;

import com.topcoder.web.screening.model.SessionInfo;

public class UpdateSession extends BaseSessionProcessor {
    public void process() throws Exception {
        SessionInfo info = getSessionInfo();
        InitialContext context = new InitialContext();
        SessionHome sHome = (SessionHome)
            PortableRemoteObject.narrow(
                    context.lookup(SessionHome.class.getName()), 
                                   SessionHome.class);
        Session session = sHome.create();
        SessionSegmentHome ssHome = (SessionSegmentHome)
            PortableRemoteObject.narrow(
                    context.lookup(SessionSegmentHome.class.getName()), 
                                   SessionSegmentHome.class);
        SessionSegment segment = ssHome.create();

        long sessionProfileId = Long.parseLong(info.getProfileId());
        long userId = Long.parseLong(info.getCandidateId());
        boolean repEmail = "YES".equals(info.getRepEmail());
        boolean candidateEmail = "YES".equals(info.getCandidateEmail());

        long sessionId = 0;
        /*
            session.createSession(sessionProfileId, 
                                  userId, 
                                  info.getBeginDate(), 
                                  info.getEndDate(), 
                                  repEmail, 
                                  candidateEmail, 
                                  getAuthentication().getUser().getId());


        //now get info for segments
        Request dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND, 
                Constants.SESSION_SEGMENT_COMMAND);
        dataRequest.setProperty("sid", String.valueOf(sessionId));

        DataAccess access = getDataAccess();

        Map map = access.getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer)
            map.get(Constants.SESSION_SEGMENT_TEST_SET_A_QUERY_KEY);
        if(rsc.size() == 0) {
            throw new ScreeningException(
              "Problem with session segment test set a for new session " + sessionId);
        }
        ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow)
            rsc.get(0);

        //somehow get dates out and subtract them
        long testSetASegment = 0;

        segment.createSessionSegment(sessionId, Long.parseLong(Constants.SESSION_SEGMENT_TEST_SET_A_ID), testSetASegment);

        rsc = (ResultSetContainer)
            map.get(Constants.SESSION_SEGMENT_TEST_SET_B_QUERY_KEY);
        if(rsc.size() == 0) {
            throw new ScreeningException(
              "Problem with session segment test set b for new session " + sessionId);
        }
        row = (ResultSetContainer.ResultSetRow)rsc.get(0);

        long testSetBSegment = Long.parseLong(row.getItem("count").toString()) *
            Long.parseLong(Constants.TEST_SET_B_SEGMENT_INTERVAL);
        segment.createSessionSegment(sessionId, Long.parseLong(Constants.SESSION_SEGMENT_TEST_SET_B_ID), testSetBSegment);
                                  */

        setNextPage(Constants.DEFAULT_PAGE);
        setNextPageInContext(false);
    }
}
