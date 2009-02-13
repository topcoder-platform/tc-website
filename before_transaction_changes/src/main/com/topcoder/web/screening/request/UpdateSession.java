package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.Transaction;
import com.topcoder.web.ejb.session.Session;
import com.topcoder.web.ejb.session.SessionHome;
import com.topcoder.web.ejb.session.SessionSegment;
import com.topcoder.web.ejb.session.SessionSegmentHome;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;
import com.topcoder.web.screening.model.EmailInfo;
import com.topcoder.web.screening.model.SessionInfo;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.transaction.UserTransaction;
import java.sql.Timestamp;
import java.util.Map;

public class UpdateSession extends BaseSessionProcessor {
    public void process() throws Exception {
        synchronized(UpdateSession.class) {
        requireLogin();

        updateSessionInfo(); // we need this just in case of session timeout

        //validate the info just in case someone tries to skip over
        //setup page and commit no info from confirm page
        if(!validateSessionInfo()) {
            setNextPage(Constants.CONTROLLER_URL + "?" +
                        Constants.REQUEST_PROCESSOR + "=" + 
                        Constants.POPULATE_SESSION_PROCESSOR);
            setNextPageInContext(true);
            return;
        }

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
        User requestor = getAuthentication().getUser();

        UserTransaction ut = Transaction.get(context);
        ut.begin();

        try {
        long sessionId =
            session.createSession(sessionProfileId,
                                  userId,
                                  new Timestamp(info.getBeginDate().getTime()),
                                  new Timestamp(info.getEndDate().getTime()),
                                  info.useRepEmail(),
                                  info.useCandidateEmail(),
                                  requestor.getId());


        //now get info for segments
        Request dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND,
                Constants.SESSION_SEGMENT_COMMAND);
        dataRequest.setProperty("sid", String.valueOf(sessionId));

        DataAccessInt access = getDataAccess(Constants.TX_DATA_SOURCE, false);

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
        Timestamp start = (Timestamp)row.getItem("start_time").getResultData();
        Timestamp end = (Timestamp)row.getItem("end_time").getResultData();
        long testSetASegment = end.getTime() - start.getTime();

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

        //if we got through all that, then send the email
        if(info.useCandidateEmail() || info.useRepEmail()) {
            EmailInfo.createEmailInfo(info, requestor).sendEmail();
        }
        }
        catch(Exception e) {
            ut.rollback();
            throw e;
        }
        ut.commit();
        clearSessionInfo();

        setNextPage(Constants.DEFAULT_PAGE);
        setNextPageInContext(false);
        }
    }
}
