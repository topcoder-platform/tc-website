package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.EmailInfo;
import com.topcoder.web.corp.model.TestSessionInfo;
import com.topcoder.web.ejb.session.Session;
import com.topcoder.web.ejb.session.SessionHome;
import com.topcoder.web.ejb.session.SessionSegment;
import com.topcoder.web.ejb.session.SessionSegmentHome;

import javax.rmi.PortableRemoteObject;
import javax.transaction.Status;
import javax.transaction.TransactionManager;
import java.sql.Timestamp;
import java.util.Map;

public class UpdateSession extends BaseSessionProcessor {
    private final static Logger log = Logger.getLogger(UpdateSession.class);

    protected void screeningProcessing() throws TCWebException {
        synchronized (UpdateSession.class) {
            if (getAuthentication().getUser().isAnonymous()) {
                throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
            }

            log.debug("RYAN2 STEP 1");
            log.debug("RYAN2 VAL IS " + getRequest().getParameter(Constants.CANDIDATE_EMAIL));
            updateSessionInfo(); // we need this just in case of session timeout

            try {
                //validate the info just in case someone tries to skip over
                //setup page and commit no info from confirm page
                if (!validateSessionInfo()) {
                    setNextPage("testing" + "?" +
                            Constants.MODULE_KEY + "=" + Constants.POPULATE_SESSION_PROCESSOR);
                    setIsNextPageInContext(true);
                    return;
                }

                TestSessionInfo info = getTestSessionInfo();
                SessionHome sHome = (SessionHome)
                        PortableRemoteObject.narrow(
                                getInitialContext().lookup(SessionHome.class.getName()),
                                SessionHome.class);
                Session session = sHome.create();
                SessionSegmentHome ssHome = (SessionSegmentHome)
                        PortableRemoteObject.narrow(
                                getInitialContext().lookup(SessionSegmentHome.class.getName()),
                                SessionSegmentHome.class);
                SessionSegment segment = ssHome.create();

                long sessionProfileId = Long.parseLong(info.getProfileId());
                long userId = Long.parseLong(info.getCandidateId());
                User requestor = getAuthentication().getUser();

                TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                tm.begin();

                try {
                    long sessionId =
                            session.createSession(sessionProfileId,
                                    userId,
                                    new Timestamp(info.getBeginDate().getTime()),
                                    new Timestamp(info.getEndDate().getTime()),
                                    info.useRepEmail(),
                                    info.useCandidateEmail(),
                                    requestor.getId());


                    info.setSessionId(sessionId);
                    //now get info for segments
                    Request dataRequest = new Request();
                    dataRequest.setProperty(DataAccessConstants.COMMAND,
                            Constants.SESSION_SEGMENT_COMMAND);
                    dataRequest.setProperty("sid", String.valueOf(sessionId));

                    DataAccessInt access = Util.getDataAccess(Constants.TX_DATA_SOURCE, false);

                    Map map = access.getData(dataRequest);

                    ResultSetContainer rsc = (ResultSetContainer)
                            map.get(Constants.SESSION_SEGMENT_TEST_SET_A_QUERY_KEY);
                    ResultSetContainer.ResultSetRow row = null;
                    if (rsc.size() != 0) {
                        row = (ResultSetContainer.ResultSetRow) rsc.get(0);

                        //somehow get dates out and subtract them
                        Timestamp start = (Timestamp) row.getItem("start_time").getResultData();
                        Timestamp end = (Timestamp) row.getItem("end_time").getResultData();
                        long testSetASegment = end.getTime() - start.getTime();

                        segment.createSessionSegment(sessionId, Long.parseLong(Constants.SESSION_SEGMENT_TEST_SET_A_ID), testSetASegment);
                        info.setTestSetALength(testSetASegment);
                    }

                    rsc = (ResultSetContainer)
                            map.get(Constants.SESSION_SEGMENT_TEST_SET_B_QUERY_KEY);
                    if (rsc.size() == 0) {
                        throw new ScreeningException(
                                "Problem with session segment test set b for new session " + sessionId);
                    }
                    row = (ResultSetContainer.ResultSetRow) rsc.get(0);

                    long testSetBSegment = Long.parseLong(row.getItem("count").toString()) *
                            Long.parseLong(Constants.TEST_SET_B_SEGMENT_INTERVAL);

                    //if set b length == 0, don't create the segment
                    if (testSetBSegment > 0)
                        segment.createSessionSegment(sessionId, Long.parseLong(Constants.SESSION_SEGMENT_TEST_SET_B_ID), testSetBSegment);

                    info.setTestSetBLength(testSetBSegment);

                    //if we got through all that, then send the email
                    if (info.useCandidateEmail() || info.useRepEmail()) {
                        EmailInfo.createEmailInfo(info, requestor).sendEmail();
                    }
                } catch (Exception e) {
                    if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                        tm.rollback();
                    }
                    throw e;
                }
                tm.commit();
            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw (new TCWebException(e));
            }
            clearSessionInfo();

            setNextPage(((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getServletPath() + "?" +
                    Constants.MODULE_KEY + "=Default");
            setIsNextPageInContext(false);
        }
    }
}
